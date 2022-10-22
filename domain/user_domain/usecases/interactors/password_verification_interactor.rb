module UserDomain
  module Usecases
    module Interactors
      class PasswordVerificationInteractor < ApplicationInteractor
        delegate :params, :user, :session, to: :context, private: true

        def call
          if user.authenticate(params[:password])
          else
            context.fail!(message: 'パスワードが違います。')
          end
        end
      end
    end
  end
end