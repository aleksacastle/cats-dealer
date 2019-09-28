Rails.application.routes.draw do
  root 'cats#new'

  resource :cat, only: %i[new show]
end
