class ApiController < ApplicationController
  
  def ping
    render json: { respuesta: "hola mundo", hora: Time.now }
  end

  def login
    
    resultado = {
      respuesta: false,
      descripcion: "Sucedió algún error inesperado"
    }

    if !params[:email].present? or !params[:password].present?
      resultado = resultado = {
        respuesta: false,
        descripcion: "Envíe todos los parámetros"
      }
      render json: resultado
      return
    end

    usuario = Usuario.find_by_email params[:email]

    if !usuario
      resultado = resultado = {
        respuesta: false,
        descripcion: "Usuario o contraseña inválidos"
      }
      render json: resultado
      return
    end

    if usuario.valid_password? params[:password]

      UsuarioSesion.where(usuario_id: usuario.id).update sesion_activa: false

      usuario_sesion = UsuarioSesion.new
      usuario_sesion.usuario_id = usuario.id
      usuario_sesion.token = Digest::MD5.hexdigest "#{Time.new}#{usuario.id}-mi twitter checha"
      usuario_sesion.ultima_conexion = Time.now
      usuario_sesion.sesion_activa = true
      usuario_sesion.save

      resultado = {
        resultado: true,
        descripcion: usuario_sesion
      }
      render json: resultado
      return

    else
      resultado = {
        respuesta: false,
        descripcion: "Usuario o contraseña inválidos"
      }
      render json: resultado
      return
    end

    render json: resultado

  end

end
