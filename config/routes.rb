Rails.application.routes.draw do
  
  get 'api/ping'
  # devise_for :usuarios
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  scope "api" do
    scope "twitter" do 
      scope "v1" do

        resources :tweets do
          resources :comentarios  
        end
        
        get "ping" => "api#ping"
        post "login" => "api#login"

      end
    end
  end

end
