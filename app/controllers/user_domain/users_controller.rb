module UserDomain
  class UsersController < ApplicationController
    def sign_in
      ctx = Usecases::SignIn.call(params: user_params, session:)

      if ctx.success?
        render json: { message: 'ok' }
      else
        render json: { message: ctx.message }
      end
    end

    def sign_up
      ctx = Usecases::SignUp.call(params: user_params, session:)

      if ctx.success?
        render json: { message: 'ok' }
      else
        render json: { message: ctx.message }
      end
    end

    private

    def user_params
      params.require(:user).permit(:email, :password)
    end
  end
end
