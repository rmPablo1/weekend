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
      redirect_to friends_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def add
    @user = User.find_by(email: params[:email])
    return unless @user && check_validation(params[:email])

    if users_group_save(params[:group_id], params[:email]).save!
      redirect_to friends_path
    else
      render "new", status: :unprocessable_entity
    end
  end

  def remove
    @user = User.find(params[:id])
    @users_groups
  end

  def destroy
    @group = Group.find(params[:id])
    @group.destroy
    redirect_to friends_path
  end

  private

  def check_validation(email_user)
    # if both conditions don't match, it won't return true
    current_user.email != email_user && current_user.mutual_following_with?(User.find_by(email: email_user))
  end

  def users_group_save(group, email_user)
    @group = Group.find(group)
    @user = User.find_by(email: email_user)
    @users_group = UsersGroup.new(group: @group, user: @user)
  end

  def strong_params
    params.require(:group).permit(:name)
  end
end
