class SpecialController < ApplicationController
  def index
    @categories = Category.all
  end
end
