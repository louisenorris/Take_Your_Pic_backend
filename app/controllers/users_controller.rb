class UsersController < ApplicationController

    def index
        users = User.all
        render json: users
    end

    def show
        user = @current_user
        render ({json: {user: UserSerializer.new(user)}})
    end

    def find_user
        user = User.find(params[:id])
        render ({json: {user: UserSerializer.new(user)}})
    end

    def create
        user = User.create(user_params)
        if user.valid?
            render json: { user: UserSerializer.new(user), token: encode_token({user_id: user.id}) }, status: :created
        else
            render json: { errors: user.errors.full_messages }, status: :not_accepted
        end
    end

    def edit
        user = @current_user
        render ({json: {user: UserSerializer.new(user)}})
    end

    def update
        user = @current_user
        user.update(user_params)
        if user.valid?
            render json: user
        else
            render json: { errors: user.errors.full_messages }
        end
    end

    def destroy
        # byebug
        user = @current_user
        user.destroy
    end


    private

    def user_params
        params.require(:user).permit(:username, :email, :password)
    end

end
