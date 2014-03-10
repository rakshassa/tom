class VendorAddressRelationshipsController < ApplicationController

  protect_from_forgery :except => [:destroy]
  #respond_to :js, only: [:destroy]

  def destroy
    @relationship = VendorAddressRelationship.find(params[:id])
    @address = @relationship.address
    @vendor = @relationship.vendor
    @vendor.remove_address!(@address)
     
    #respond_with(@address, @vendor)

    respond_to do |format|
      #format.html { redirect_to @vendor }
      format.js
    end

  
  end

end