class VendorsController < ApplicationController

  def index
    @vendors = Vendor.paginate(page: params[:page])
  end	

  def show
  	@vendor = Vendor.find(params[:id])
  end

  def destroy
    Vendor.find(params[:id]).destroy
    flash[:success] = "Vendor deleted."
    redirect_to vendors_url
  end

  def create
    @vendor = Vendor.new(vendor_params)
    if @vendor.save
      flash[:success] = "Vendor Created!"
      
      redirect_to @vendor
    else
      render 'new'
    end
  end

  def new
  	@vendor = Vendor.new
  end  

  def edit
    @vendor = Vendor.find(params[:id])
  end  

  def update
    @vendor = Vendor.find(params[:id])
    if @vendor.update_attributes(vendor_params)
      flash[:success] = "Vendor updated"
      redirect_to @vendor
    else
      render 'edit'
    end
  end    

  private

    def vendor_params
      params.require(:vendor).permit(:name)
    end  

end
