class UsersController < ApplicationController

  respond_to :json, :html

  def meet_the_hosts
  	p 'hola world'
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :phone_number)
  end

  private :user_params
end
