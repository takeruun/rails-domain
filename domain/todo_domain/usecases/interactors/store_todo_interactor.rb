module TodoDomain
  module Usecases
    module Interactors
      class StoreTodoInteractor < ApplicationInteractor
        delegate :todo, to: :context, private: true

        def call
          TodoDomain::Todo.store!(todo)
        end

        def rollback; end

        private
      end
    end
  end
end