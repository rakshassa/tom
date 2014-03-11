class AddressesController < ApplicationController


  def destroy    
    @address = Address.find(params[:id])
    @address.destroy         
  end


  def update
    @address = Address.find(params[:id])       
    @address.update_attributes(address_params)
    flash[:success] = "Address updated"    
  end 

  private

    def address_params
      params.require(:address).permit(:street1, :street2, :city, :state, :zip,
        address_types_attributes: [:id, :name, :_destroy])
    end  
end