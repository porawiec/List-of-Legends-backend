class FriendshipsController < ApplicationController

    def create
        console.log(params)
        @friendship = Friendship.find_by(user_id: params[:user_id], friend_id: params[:friend_id]).build
        # @friendship = Friendship.new(friendship_params)

        if @friendship.save
            render json: { friendship: @friendship }
        else
            render json: { error: 'failed to create friendship' }
        end
    end
      
    def destroy
        Friendship.find(params[:id]).destroy
    end

    def createFriendWithName
        @friend = User.find_by(username: params[:friendUsername])
        @friendship = Friendship.new(user_id: params[:user_id], friend: @friend)
        if @friendship.save
            render json: { friend: @friend }
        else
            render json: { error: 'failed to create friendship' }, status: :not_acceptable
        end
    end

    def destroyFriendWithIds
        Friendship.find_by(user_id: params[:user_id], friend_id: params[:friend_id]).destroy
    end
end