YTZ::Application.routes.draw do
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

  resources :text_correction_utz do
    post :check_answers, on: :member
  end
end
