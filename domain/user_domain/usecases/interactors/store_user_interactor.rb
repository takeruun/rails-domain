module UserDomain
  module Usecases
    module Interactors
      class StoreUserInteractor < ApplicationInteractor
        delegate :user, to: :context, private: true

        def call
          UserDomain::User.store!(user)
          puts user.id
        end

        def rollback; end

        private
      end
    end
  end
end