# -*- encoding : utf-8 -*-
Clicplic::Application.routes.draw do 
  root "home#index"

  get '/:token' => 'home#index', :as => :game
  get '/:token/:round/:guess' => 'home#index', :as => :guess
end
