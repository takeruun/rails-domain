module TodoDomain
  module Usecases
    module Interactors
      class CreateTodoInteractor < ApplicationInteractor
        delegate :params, :session, to: :context, private: true

        def call
          todo = Models::Todo.new(**params, user_id: session[:user_id])
          context[:todo] = todo
        end

        def rollback
        end
      end
    end
  end
end
