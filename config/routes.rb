Rails.application.routes.draw do
 resources :games, only: [:index, :new], :path => '/'do
    collection do
      post :move, as: :move
    end
 end
end
