class WishesController < ApplicationController

    def create
        @wish = Wish.new(wish_params)
        if @wish.save
            render json: { wish: @wish }
        else
            render json: { error: 'failed to create wish' }
        end
    end

    def destroy
        Wish.find(params[:id]).destroy
    end

    def destroyWithIds
        Wish.find_by(user_id: params[:user_id], skin_id: params[:skin_id]).destroy
    end

    def wish_params
        params.require(:wish).permit(:user_id, :skin_id)
    end

end


# @user = User.create(user_params)
# if @user.valid?
#   @token = encode_token(user_id: @user.id)
#   render json: { user: UserSerializer.new(@user), jwt: @token }, status: :created
# else
#   render json: { error: 'failed to create user' }
# end