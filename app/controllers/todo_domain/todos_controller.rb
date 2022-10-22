module TodoDomain
  class TodosController < ApplicationController
    def index
    end

    def create
      ctx = Usecases::CreateTodo.call(userId: 1)

      if ctx.success?
      else
        
      end
    end
  end
end