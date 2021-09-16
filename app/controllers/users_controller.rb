class UsersController < ApplicationController
  before_action :authenticate_user!

  def index; end

  def new; end

  def create; end

  def edit; end

  def update; end

  def delete;

  protected

  def create_params
    params.require(:user).permit(:first_name, :last_name, :email, :password)
  end

  def update_params
    params.require(:user).permit(:first_name, :last_name, :email, :password)
  end
end
