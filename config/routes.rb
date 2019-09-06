Rails.application.routes.draw do
  
  #Cadastro de usuários
  resource :cadastros
  #ISBG
  devise_for :users
           #  :controllers => {:sessions=> 'users/sessions'}
  #get 'home/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # Redireciona para o login sempre que for para a página inicial
  # https://stackoverflow.com/questions/4954876/setting-devise-login-to-be-root-page
  devise_scope :user do
    authenticated :user do
      root 'home#index' , as: :authenticated_root
    end

    unauthenticated  do
      root 'devise/sessions#new', as: :unauthenticated_root
    end
  end
  root 'home#index'
end
