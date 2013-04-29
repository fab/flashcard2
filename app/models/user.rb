class EmailValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    unless value =~ /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
      record.errors[attribute] << (options[:message] || "is not an email")
    end
  end
end

class User < ActiveRecord::Base
  validates :name, :presence => true  
  validates :email, :uniqueness => true, :email => true
  validates :password, :length => { :minimum => 5}
  before_create :hash_password
  has_many :rounds
  has_many :games
  include BCrypt

  def self.authenticate(email, password)
    user = User.find_by_email(email)
    return nil unless user
    db_password = Password.new(user.password)
    db_password == password ? user : nil  
  end


  private
  def hash_password
    self.password = Password.create(self.password)
  end  
end
