module Api
  module V1
    class UsersController < ApplicationController
      before_action :set_user, only: [:login, :show, :edit, :update, :destroy]

      def login
        session[:user_id] = @user.id
      end

      def new
        @user = User.new
      end

      def edit
      end

      def create
        @user = User.new(user_params)

        if @user.save
          redirect_to @user, notice: 'User was successfully created.'
        else
          render :new
        end
      end

      def update
        if @user.update(user_params)
          redirect_to @user, notice: 'User was successfully updated.'
        else
          render :edit
        end
      end

      def destroy
        @user.destroy
        redirect_to users_url, notice: 'User was successfully destroyed.'
      end

      private

      def set_user
        @user = User.find(params[:id])
      end

      def user_params
        params.require(:user).permit(:email, :password_digest)
      end
    end
  end
=======
class Api::V1::UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def show
    render json: @user
  end

  def create
    user = User.new(user_params)

    if user.save
      render json: user, status: 201
    else
      render json: { errors: user.errors }, status: 422
    end
  end

  private
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def user_params
      params.require(:user).permit(:email, :password)
    end
>>>>>>> change user controller
end
