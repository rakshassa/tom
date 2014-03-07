class AddressesController < ApplicationController



  def destroy
    #@address = Address.find(params[:id])
    #if (@address.destroy)
    @vendor = params[:vendor]
    @address = params[:address]

    if (@vendor.addresses.find_by(@address.id).destroy)
      render :status => :ok
    else
      render :js => "alert('error deleting the address');"
    end
  end

  def create
    #@address = Address.new
    #@vendor = params[:vendor])
    #@address = @vendor.addresses.build
    render :partial => "addresses/edit", 
           :locals => { :address => @address, :vendor => @vendor }, 
           :layout => false, 
           :status => :created
  end

end