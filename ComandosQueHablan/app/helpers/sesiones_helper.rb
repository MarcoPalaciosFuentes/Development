module SesionesHelper
  def log_in(usuario)
    session[:usuario_id] = user.id
  end

  def current_usuario
    @current_usuario ||= Usuario.find_by(id: session[:user_id])
  end

  def logged_in?
    !current_usuario.nil?
  end

  def authenticate_user
    redirect_to root_path unless logged_in?
  end

  def log_out
    sesion.delete(:usuario_id)
    @current_user = nil
  end
end