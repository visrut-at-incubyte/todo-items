require 'rails_helper'

RSpec.describe TodosController, type: :controller do
  describe 'GET #index' do
    it 'assigns all todos as @todos' do
      todo = Todo.create!(description: 'Test todo')
      get :index
      expect(assigns(:todos)).to eq([todo])
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new Todo' do
        expect {
          post :create, params: { todo: { description: 'Test todo' } }
        }.to change(Todo, :count).by(1)
      end

      it 'redirects to the todos list' do
        post :create, params: { todo: { description: 'Test todo' } }
        expect(response).to redirect_to(todos_path)
      end
    end

    context 'with invalid params' do
      it 'does not create a new Todo' do
        # Assuming Todo model has validations which are not shown in the provided code
        allow_any_instance_of(Todo).to receive(:save).and_return(false)
        expect {
          post :create, params: { todo: { description: '' } } # Invalid description
        }.to_not change(Todo, :count)
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested todo' do
      todo = Todo.create!(description: 'Test todo')
      expect {
        delete :destroy, params: { id: todo.to_param }
      }.to change(Todo, :count).by(-1)
    end

    it 'redirects to the todos list' do
      todo = Todo.create!(description: 'Test todo')
      delete :destroy, params: { id: todo.to_param }
      expect(response).to redirect_to(todos_path)
    end
  end
end
