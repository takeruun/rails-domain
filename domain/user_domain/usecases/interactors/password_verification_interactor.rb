module UserDomain
  module Usecases
    module Interactors
      class PasswordVerificationInteractor < ApplicationInteractor
        delegate :params, :user, :session, to: :context, private: true

        def call
          context.fail!(message: 'パスワードが違います。') if user.authenticate(params[:password]).nil?
        end
      end
    end
  end
end
