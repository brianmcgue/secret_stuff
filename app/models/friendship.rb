class Friendship < ActiveRecord::Base
  validates :out_friend, :in_friend, :presence => true

  belongs_to :out_friend, :class_name => "User"
  belongs_to :in_friend, :class_name => "User"

  def self.can_friend?(out_friend_id, in_friend_id)
    !(Friendship.exists?(
      :out_friend_id => out_friend_id,
      :in_friend_id => in_friend_id
    ) || out_friend_id == in_friend_id)
  end

  def self.can_unfriend?(out_friend_id, in_friend_id)
    Friendship.exists?(
      :out_friend_id => out_friend_id,
      :in_friend_id => in_friend_id
    )
  end

  def self.getFriendship(out_id, in_id)
    Friendship.find_by_out_friend_id_and_in_friend_id(out_id, in_id)
  end
end
