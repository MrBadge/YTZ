YTZ::Application.routes.draw do
  get 'images_sort_utz/new'

  get 'images_sort_utz/show'

  root 'utz#index'

  resources :test_utz_questions do
    post :check_answer, on: :member
  end

  resources :matching_utz do
    post :check_answers, on: :member
  end

  resources :filling_utz do
    post :check_answers, on: :member
  end

  resources :text_correction_utz do
    post :check_answer, on: :member
  end

  resources :images_sort_utz do
    post :check_answer, on: :member
  end
end
