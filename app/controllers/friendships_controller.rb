class FriendshipsController < ApplicationController
  def create
    @friendship = Friendship.new()
    @friendship.out_friend = current_user
    @friendship.in_friend_id = params[:user_id]
    @friendship.save!
    render :json => @friendship
  end

  def destroy
    friendship = Friendship.find(params[:id])
    friendship.destroy
    head :ok
  end
end
