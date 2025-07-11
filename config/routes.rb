# config/routes.rb

Rails.application.routes.draw do
  # Home page
  root "quarters#index"

  # Quarters → Lessons → nested resources
  resources :quarters, only: [:index, :show] do
    resources :lessons do
      # Many-to-many link between lessons and standards
      resources :lesson_standards, only: [:create, :destroy]

      # Assignments
      resources :formative_assignments
      resources :summative_assignments

      # Quizzes
      resources :quizzes do
        # If you later want to manage grades via routes:
        resources :quiz_grades, only: [:create, :update, :destroy]
      end
    end
  end

  # Top-level lookup for Standards and Users
  resources :standards, only: [:index, :show]
  resources :users,     only: [:index, :show]
end
