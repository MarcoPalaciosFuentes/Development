class SesionesController < ApplicationController
  def new
  end

  def create
    usuario = Usuario.find_by(email: params[:email])
    if usuario && usuario.authenticate(params[:password])
      log_in(user)
      redirect_to usuario_path
    else
      flash[:notice] = "Nombre de usuario o password incorrecta"
      render :new

    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_path
  end



 # def create
    #usuario = Usuario.where(email: params[:email]).first
    #if usuario && usuario.authenticate(params[:password])
    #	sesion[:usuario_id] = Usuario_id
    #	redirect_to root_url, notice: "logeado"
    #else
    #	flash.now.alert = "nombre de usuario o password incorrecta"
    #	render "new"
    #end
  #end
 

  #def destroy
  	#sesion[:usuario_id] = nil 
  	#redirect_to root_url, notice: "sesion terminada"
  #end

end

#  def create
    #usuario = Usuario.find_by_email( params[:email] )
    #if Usuario && Usuario.authenticate(params[:password])

