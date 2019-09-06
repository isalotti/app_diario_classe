class User < ApplicationRecord
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, authentication_keys: [:login]

  attr_writer :login

  def login
    @login || self.matricula || self.email
  end


#  def self.find_for_database_authentication(warden_conditions)
#    conditions = warden_conditions.dup
#    if login = conditions.delete(:login)
#      where(conditions.to_h).where(["lower(matricula) = :value OR lower(email) = :value", { :value => login.downcase }]).first
#    elsif conditions.has_key?(:matricula) || conditions.has_key?(:email)
#      where(conditions.to_h).first
#    end
#  end
  
  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions).where(["lower(matricula) = :value OR lower(email) = :value", { :value => login.downcase }]).first
    else
      if conditions[:matricula].nil?
        where(conditions).first
      else
        where(matricula: conditions[:matricula]).first
      end
    end
  end

end
