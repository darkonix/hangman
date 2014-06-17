# -*- encoding : utf-8 -*-
Clicplic::Application.routes.draw do 
  root "home#index"

  get '/:round/:guess' => 'home#index', :as => :guess
end
