YTZ::Application.routes.draw do
  get 'test_utz_questions/new'

  get 'test_utz_questions/show'

  get 'filling_utz/new'

  get 'filling_utz/show'

  root 'utz#index'

  resources :test_utz_questions do
    post :check_answers, on: :member
  end

  resources :matching_utz do
    post :check_answers, on: :member
  end

  resources :filling_utz do
    post :check_answers, on: :member
  end
end
