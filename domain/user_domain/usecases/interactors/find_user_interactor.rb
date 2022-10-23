module UserDomain
  module Usecases
    module Interactors
      class FindUserInteractor < ApplicationInteractor
        delegate :params, to: :context, private: true

        def call
          user = Models::User.find_by(email: params[:email])

          if user.nil?
            context.fail!(message: 'ユーザーが見つかりません。')
          else
            context[:user] = user
          end
        end
      end
    end
  end
end
