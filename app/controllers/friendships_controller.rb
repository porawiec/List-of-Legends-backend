class FriendshipsController < ApplicationController

    def create
        console.log(params)
        @friendship = Friendship.new(user_id: params[:user_id], friend_id: User.find_by(username: params[:friendUsername])).build
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

    def createWithIds
        @friendship = Friendship.find_by(user_id: params[:user_id], friend_id: params[:friend_id]).build
        if @friendship.save
            render json: { friendship: @friendship }
        else
            render json: { error: 'failed to create friendship' }, status: :not_acceptable
        end
    end

    def destroyWithIds
        Friendship.find_by(user_id: params[:user_id], friend_id: params[:friend_id]).destroy
    end