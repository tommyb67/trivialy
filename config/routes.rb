Trivialy::Application.routes.draw do
  resources :users
  resources :games, only: [:show] do
    resources :questions, only: [:show]
  end

  #/users/1
  # START A NEW GAME

  #/games/1/questions/1
  # Random question from the questions table

  # Answer input
  # SUBMIT

  #/games/1/questions/2


  resource :session, only: [:new, :create, :destroy]
end

###################### EXAMPLE #####################
# http://stackoverflow.com/questions/7164865/how-to-populate-fields-in-a-has-many-through-join-table
#The you can use things like form_for(@physician, @patient)
#and url's like physician/1/patient/23
#for updating a patient within the context of a physician.
#######################################################