class Usuario < ActiveRecord::Base
	#def user_params
  	#   params.require(:user).permit(:username, :email, :password, :password_confirmation, :admin)
   	#end
  	validates_uniqueness_of :email
  	#validates :email, presence: true, uniqueness: true, email: true
  	#validates :password, presence: true, length: { minimum: 8 }

  has_secure_password
  
end
