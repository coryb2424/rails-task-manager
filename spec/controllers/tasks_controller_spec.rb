require 'rails_helper'

RSpec.describe TasksController, type: :controller do
  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
    it "assigns @tasks" do
      task = FactoryBot.create(:task)
      get :index
      expect(assigns(:tasks)).to eq([task])
    end
  end

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST #create" do
    it "creates a new task" do
      params = {task: { title: 'Test title', details: 'text', author: 'Cory' }}
      expect { post :create, params: params }.to change(Task, :count).by(1)
    end

    it "raises an error if invalid" do
      params = {task: { title: 'Test title', details: nil, author: 'Cory' }}
      expect { post :create, params: params }.to raise_error(ActiveRecord::RecordInvalid)
    end
  end

  describe "GET #edit" do
    it "returns http success" do
      task = FactoryBot.create(:task)
      get :edit, params: { id: task.id }
      expect(response).to have_http_status(:success)
    end

    it "assigns @task" do
      task = FactoryBot.create(:task)
      get :edit, params: { id: task.id }
      expect(assigns(:task)).to eq(task)
    end
  end

  describe "PATCH #update" do
    it "updates a value" do
      task = FactoryBot.create(:task)
      params = { task: { title: 'new title' }, id: task.id }
      patch :update, params: params
      updated_task = Task.find(task.id)
      expect(updated_task).to have_attributes(title: "new title")
    end
  end

  describe "GET #show" do
    it "returns http success" do
      task = FactoryBot.create(:task)
      get :show, params: { id: task.id }
      expect(response).to have_http_status(:success)
    end

    it "assigns @task" do
      task = FactoryBot.create(:task)
      get :show, params: { id: task.id }
      expect(assigns(:task)).to eq(task)
    end
  end

  describe "DELETE #destroy" do
    it "destroys a task" do
      task = FactoryBot.create(:task)
      expect {delete :destroy, params: { id: task.id }}.to change(Task, :count).by(-1)
    end
  end
end
