class UsersController < ApplicationController

  # load_and_authorize_resource param_method: :call_params

  respond_to :json, :html

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :phone_number)
  end

  private :user_params
end
