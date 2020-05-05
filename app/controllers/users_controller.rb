class UsersController < ApplicationController
  # マイページ
  
  def show
    @user = User.find(params[:id])
    @users = User.all
  end

    # ログイン後のリダイレクト先
  def after_sign_in_path_for(resource)
    posts_path(resource.id)
  end

  private

def user_params
  params.require(:user).permit(:name, :profile, :image) 
end
end
