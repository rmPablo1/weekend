class UsersGroupsController < ApplicationController
  def destroy
    @usergroup = UsersGroup.find(params[:id])
    @usergroup.destroy
    redirect_to friends_path
  end
end
