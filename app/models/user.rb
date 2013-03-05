class User < ActiveRecord::Base

  has_many :authorizations, :dependent => :destroy

  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  attr_accessible :email, :password, :password_confirmation, :remember_me, :role, :first_name,
                  :last_name, :patronymic

  ROLES = %w[admin moderator user]

  def role?(role)
    self.role == role.to_s
  end

end
