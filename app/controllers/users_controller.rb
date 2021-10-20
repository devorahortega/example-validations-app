class UsersController < ApplicationController
  def create
    user = User.new(first_name: params[:first_name], last_name: params[:last_name], email: params[:email])
    
    if user.save
      render json: user
    else
      render json: {errors: user.errors.full_messages} status: :unprocessable_entity
    end
  end

  def update
    user = User.find_by(:id params[:id])

    first_name = params["first_name"]
    last_name = params["last_name"]
    email = params["email"]
    user.save
    render json: user
  end
end
