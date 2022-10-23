require 'rails_helper'

RSpec.describe TodoDomain::TodosController, type: :request do
  before do
    user = create(:user)
    allow_any_instance_of(TodoDomain::Usecases::Interactors::CreateTodoInteractor).to receive(:session) { { user_id: user.id } }
  end

  describe 'POST create' do
    subject do
      post todos_path, params: params
      response
    end

    let(:params) do
      {
        todo: {
          title: 'title',
          body: 'body'
        }
      }
    end

    it 'http success' do
      expect(subject).to have_http_status(:success)
    end
  end
end
