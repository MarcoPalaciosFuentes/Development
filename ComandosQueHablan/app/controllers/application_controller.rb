include SesionesHelper
class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception


private
	def current_user
		@current_usuario ||=usuario.find(sesione[:usuario_id]) if sesione[:usuario_id]
	end
		helper_method :current_usuario
end