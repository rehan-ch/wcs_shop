class AdminController < ApplicationController
  def index
    @sold = Mobile.where(sold: true)
    @stock = Mobile.where(sold: false)
  end
end
