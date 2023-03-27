class FriendsController < ApplicationController
  def index
    @friends = current_user.followers
    @friend_requests = current_user.follow_requests
  end

  def show
    @friend_requester = User.find(params[:id])
    unless @friend_requester.mutual_following_with?(current_user)
      current_user.accept_follow_request_of(@friend_requester)
      current_user.send_follow_request_to(@friend_requester)
      @friend_requester.accept_follow_request_of(current_user)
    end

    redirect_to friends_path
  end

  def create
    @user = User.find_by(email:params[:email])
    unless @user.mutual_following_with?(current_user)
      current_user.send_follow_request_to(@user)
      @user.send_follow_request_to(current_user)
    end
  end

  def destroy
    @friend = User.find(params[:id])
    @friend.unfollow(current_user)
    current_user.unfollow(@friend)
    current_user.decline_follow_request_of(@friend)
    redirect_to friends_path
  end
end
