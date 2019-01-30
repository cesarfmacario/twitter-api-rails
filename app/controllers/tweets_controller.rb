class TweetsController < ApplicationController

  before_action :autenticar_token
  before_action :set_tweet, only: [:show, :update, :destroy]

  def autenticar_token
    
    @usuario_sesion = UsuarioSesion.find_by_token request.env["HTTP_TOKEN"]
    
    if !@usuario_sesion
      resultado = resultado = {
        respuesta: false,
        descripcion: "Sesion invalida"
      }
      render json: resultado
      return
      
    end

    @usuario = @usuario_sesion.usuario

  end

  # GET /tweets
  def index
    # @tweets = Tweet.all
    @tweets = @usuario.tweets.all.order("id desc")

    render json: @tweets
  end

  # GET /tweets/1
  def show
    render json: @tweet
  end

  # POST /tweets
  def create
    @tweet = Tweet.new(tweet_params)

    @tweet.usuario_id = @usuario_sesion.usuario_id

    if @tweet.save
      render json: @tweet, status: :created, location: @tweet
    else
      render json: @tweet.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /tweets/1
  def update
    if @tweet.update(tweet_params)
      render json: @tweet
    else
      render json: @tweet.errors, status: :unprocessable_entity
    end
  end

  # DELETE /tweets/1
  def destroy
    @tweet.destroy

    resultado = resultado = {
      respuesta: true,
      descripcion: "Tweet eliminado"
    }
    render json: resultado
    return
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tweet
      # @tweet = Tweet.find(params[:id])
      @tweet = @usuario.tweets.find(params[:id])

    rescue
      resultado = resultado = {
        respuesta: false,
        descripcion: "No se encontró el tweet"
      }
      render json: resultado
      return

    end

    # Only allow a trusted parameter "white list" through.
    def tweet_params
      params.require(:tweet).permit(:usuario_id, :texto)
    end
end
