class RelationshipsController < ApplicationController
  respond_to? :js
  def create
    if current_user.present?
      @user = User.find(params[:relationship][:followed_id])
      current_user.follow!(@user)
      @user
    else
      @user
    end
  end

  def destroy
    @user = Relationship.find(params[:id]).followed
    current_user.unfollow!(@user)
    @user
  end
end
