module TodoDomain
  module Usecases
    module Interactors
      class CreateTodoInteractor < ApplicationInteractor
        delegate :userId, to: :context, private: true

        def call
          todo = Models::Todo.new(user_id: userId)
          context[:todo] = todo
        end

        def rollback; end

        private
      end
    end
  end
end