module TodoDomain
  class TodosController < ApplicationController
    def index
    end

    def create
      ctx = Usecases::CreateTodo.call(params: todo_params, session: session)

      if ctx.success?
      else
        
      end
    end

    private

    def todo_params
      params.require(:todo).permit(:title, :body)
    end
  end
end