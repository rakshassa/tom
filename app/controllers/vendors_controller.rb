class VendorsController < ApplicationController

  def index
    @vendors = Vendor.paginate(page: params[:page])
  end	

  def show
  	@vendor = Vendor.find(params[:id])
  end

  def destroy
    @vendor = Vendor.find(params[:id])
    @vendor.clear_addresses!
    @vendor.destroy

    flash[:success] = "Vendor deleted."
    
    respond_to do |format|      
      format.js
    end    
  end

  def create
    @vendor = Vendor.new(vendor_params)
    #need to also save the addresses which were created using the "add address" button
    #note that they were not linked into this vendor because they were still invalid.
    if @vendor.save
      flash[:success] = "Vendor Created!"
      
      redirect_to @vendor
    else
      render 'new'
    end
  end

  def new
  	@vendor = Vendor.new 
    @address = Address.new   
  end  

  def edit
    @vendor = Vendor.find(params[:id])
    @address = Address.new
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
