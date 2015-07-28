class CookbooksController < ApplicationController
  include ApplicationHelper
  before_action :logged_in?
  before_action :get_cookbook, only: [:show, :edit, :update, :destroy]

  # Display cookbook(s)
  def index
    @cookbooks = Cookbook.all
  end

  def show; end

  # Add a new cookbook
  def new
    @cookbook = Cookbook.new
  end

  def create
    @cookbook = Cookbook.create(cookbook_params)
    if @cookbook.save
      redirect_to user_path
    else
      render new_cookbook_path
    end
  end

  # Edit an existing cookbook
  def edit; end

  def update
    @cookbook.update(cookbook_params)

    redirect_to user_path
  end

  # Delete a cookbook
  def destroy
    @cookbook.destroy

    redirect_to user_path
  end

end

private

  def get_cookbook
    @cookbook = Cookbook.find(params[:id])
  end

  def cookbook_params
    params.require(:cookbook).permit(:name, :desc)
  end
