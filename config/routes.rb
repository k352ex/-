Rails.application.routes.draw do

  mount Ckeditor::Engine => '/ckeditor' # 텍스트 편집기
  root 'index#index'

  devise_for :users
  resources :index
  resources :notice
  resources :freeboard

  # WillPaginateExample::Application.routes.draw do
  #   resources :notice, only: [:index]
  #   root to: "notice#index"
  # end
end
