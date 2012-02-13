Dummy::Application.routes.draw do
  resources :pages, except: [:index, :show, :delete]
end
