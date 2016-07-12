class UsersController < ApplicationController

def create
  User.create(user_params)
  redirect_to '/sessions'
end

private

def user_params
  params.require(:user).permit(:first_name, :last_name, :email, :password_digest)
end

end
