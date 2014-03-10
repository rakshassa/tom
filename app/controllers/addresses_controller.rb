class AddressesController < ApplicationController




  def create
    #@address = Address.new
    #@vendor = params[:vendor])
    #@address = @vendor.addresses.build
    render :partial => "addresses/edit", 
           :locals => { :address => @address, :vendor => @vendor }, 
           :layout => false, 
           :status => :created
  end


  def update
    @address = Address.find(params[:id])
    @vendor = @address.vendor
    
    @address.update_attributes(vendor_params)
    flash[:success] = "Address updated"
    
    respond_to do |format|
      format.js
    end    
  end 

  private

    def address_params
      params.require(:address).permit(:street1, :street2, :city, :state, :zip)
    end  

end