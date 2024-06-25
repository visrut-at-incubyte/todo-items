require 'rails_helper'

RSpec.describe TodosController, type: :controller do
  describe "GET #index" do
    it "assigns all todos to @todos" do
      # Setup
      mock_todos = double('Todo')
      allow(Todo).to receive(:all).and_return(mock_todos)

      # Action
      get :index

      # Assert
      expect(assigns(:todos)).to eq(mock_todos)
    end
  end

  describe "POST #create" do
    let(:valid_attributes) { { description: 'Test Todo' } }

    it "creates a new Todo and redirects if valid" do
      # Setup
      mock_todo = double('Todo', valid?: true)
      allow(Todo).to receive(:create).with(description: 'Test Todo').and_return(mock_todo)

      # Action
      post :create, params: { todo: valid_attributes }

      # Assert
      expect(response).to redirect_to(todos_path)
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested todo and redirects" do
      # Setup
      mock_todo = double('Todo', destroy: true)
      allow(Todo).to receive(:find).with('1').and_return(mock_todo)

      # Action
      delete :destroy, params: { id: '1' }

      # Assert
      expect(response).to redirect_to(todos_path)
    end
  end
end
