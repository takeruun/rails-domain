module UserDomain
  module Usecases
    module Interactors
      class PasswordVerificationInteractor < ApplicationInteractor
        delegate :params, :user, :cookies, to: :context, private: true

        def call
          puts params
          if user.authenticate(params[:password])
            cookies['user_id'] = user.id
          else
            context.fail!(message: 'パスワードが違います。')
          end
        end
      end
    end
  end
end