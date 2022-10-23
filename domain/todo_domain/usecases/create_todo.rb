module TodoDomain
  module Usecases
    class CreateTodo < ApplicationUsecase
      include InteractorTransactional

      organize Interactors::CreateTodoInteractor,
               Interactors::StoreTodoInteractor
    end
  end
end
