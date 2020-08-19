class ItemsController < ApplicationController

  def index
    @items = Item.all
  end

  def create
  end

  def new
    @items = Item.new
  end
end
