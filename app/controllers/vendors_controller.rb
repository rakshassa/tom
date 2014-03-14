class VendorsController < ApplicationController
  helper_method :sort_column, :sort_direction

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

    #flash[:success] = "Vendor deleted."
    
    respond_to do |format|      
      format.js
    end    
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
    @address = @vendor.addresses.build 
    @contact = @vendor.contacts.build
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
      params.require(:vendor).permit(:name, :year_established, :website,
        :duns, :naics, :phone, :fax, :terms, :certified, :last_audit, 
        :cert_expire, :audit_findings, products_provided: [], product_types: [],
        types: [], 

        addresses_attributes: [:id, :street1, :street2, :city, 
          :state, :zip, :_destroy, types: []],
        contacts_attributes: [:id, :first_name, :last_name, 
          :phone, :fax, :cell, :email, :_destroy, :title])
    end  

    def sort_column
      Contact.column_names.include?(params[:sort]) ? params[:sort] : "first_name"
    end

    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
    end

end
