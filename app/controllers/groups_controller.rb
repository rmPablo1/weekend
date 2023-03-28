class GroupsController < ApplicationController
  def index
    @groups = current_user.groups.includes(:users_groups)
    @group = Group.new
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(strong_params)
    @group.user = current_user
    if @group.save
      redirect_to groups_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def add
    if current_user.email != params[:email] && current_user.mutual_following_with?(User.find_by(email:params[:email]))
      @group = Group.find(params[:group_id])
      @user = User.find_by(email:params[:email])
      @users_group = UsersGroup.new(group:@group, user: @user)
      if @users_group.save!
        redirect_to groups_path
      else
        render :new, status: :unprocessable_entity
      end
    end
  end

  def remove
    @user = User.find(params[:id])
    @users_groups
  end

  def destroy
    @group = Group.find(params[:id])
    @group.destroy
    redirect_to groups_path
  end

  private
  def strong_params
    params.require(:group).permit(:name)
  end
end
