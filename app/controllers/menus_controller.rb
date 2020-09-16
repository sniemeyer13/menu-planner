class MenusController < ApplicationController
  before_action :set_menu, only: [:show, :destroy, :update]

  def index
    @menus = Menu.all
    json_response(@menus)
  end

  def create
    @menu = Menu.create!(menu_params)
    json_response(@menu, :created)
  end

  def show
    json_response(@menu)
  end

  def update
    @menu.update(menu_params)
    json_response(@menu)
  end

  def destroy
    @menu.destroy
    head :no_content
  end

  private

  def menu_params
    params.permit(:title, :author)
  end

  def set_menu
    @menu = Menu.find(params[:id])
  end
end
