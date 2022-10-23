module UserDomain
  module Usecases
    module Interactors
      class StoreUserInteractor < ApplicationInteractor
        delegate :user, to: :context, private: true

        def call
          UserDomain::User.store!(user)
        end

        def rollback
        end
      end
    end
  end
end
