class Public::AddressesController < ApplicationController
  
  def index
    @address = Address.new
    @addresses = Address.where(customer_id: current_customer.id)
  end
  
  def create
    @address = Address.new(address_params)
    @address.customer_id = current_customer.id
    if @address.save
      redirect_to addresses_path
    else
      @addresses = Address.where(customer: current_customer)
      render :index
    end
  end
  
  private
  
  def address_params
    params.require(:address).permit(:zip_code, :address, :name)
  end
  
end
