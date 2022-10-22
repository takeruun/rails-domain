module UserDomain
  module Usecases
    module Interactors
      class CreateUserInteractor < ApplicationInteractor
        delegate :params, to: :context, private: true

        def call
          user = Models::User.new(**params)
          context[:user] = user
        end

        def rollback; end

        private
      end
    end
  end
end