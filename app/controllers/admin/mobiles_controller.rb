class Admin::MobilesController < ApplicationController
  layout 'admin'
  def index
    @mobiles = Mobile.all
    if params[:sold].present?
     @mobiles = @mobiles.where(sold: true)
    end
    if params[:query].present?
      @mobiles = @mobiles.where(imei1: params[:query])
    end
    respond_to do |format|
      format.html
      format.js
    end
  end

  def show
    @mobile = Mobile.find(params[:id])
  end

  def new
    @mobile = Mobile.new()
  end

  def create
    @mobile = Mobile.new(mobile_params)
    byebug
    if @mobile.save
      sold_check(@mobile)
      redirect_to admin_mobile_path(@mobile)
    else
      render :new
    end
  end

  def edit
    @mobile = Mobile.find(params[:id])
  end

  def update
    @mobile = Mobile.find(params[:id])
    if @mobile.update(mobile_params)
      sold_check(@mobile)
      redirect_to admin_mobile_path(@mobile)
    else
      render :edit
    end
  end

  def sell
    @mobile = Mobile.find(params[:id])
    @mobile.sold = true
    @mobile.selling_date = DateTime.now
    @mobile.save
    redirect_to root_path
  end

  def destroy
    @mobile = Mobile.find(params[:id])
    if @mobile.delete
      redirect_to root_path
    end
  end

  private

    def sold_check(mobile)
      unless mobile.sold.present?
        mobile.update(selling_date: nil)
      end
    end
    def mobile_params
      params.require(:mobile).permit(:name, :model, :company, :imei1, :imei2, :invoice_price, :selling_price, :color, :purchasing_date, :selling_date, :sold)
    end
end
