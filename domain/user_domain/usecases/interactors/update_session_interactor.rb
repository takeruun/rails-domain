module UserDomain
  module Usecases
    module Interactors
      class UpdateSessionInteractor < ApplicationInteractor
        delegate :session, :user, to: :context, private: true

        def call
          session[:user_id] = user.id
        end
      end
    end
  end
end
