class ServicesController < ApplicationController

  def new
    @service = Service.new
    @service.build_address
  end

  def create
    @service = Service.new service_params
    @service.address = check_address
    @service.start_date = build_date[0]
    @service.end_date = build_date[1]

    if @service.save
      respond_to do |format|
        format.html { redirect_to service_chose_assistent_path(@service) }
      end
    end
  end

  private

  def service_params
    params.require(:service).permit(
      :start_date,
      :end_date,
      :specialty,:address_attributes => [:line_1, :line_2, :state, :city, :zip_code]
    )
  end

  def check_address
    address = Address.find_by(
      line_1: @service.address.line_1,
      zip_code: @service.address.zip_code
    )

    if address && address.user_id?
      current_user.address
    else
      service_params[:address_attributes]
    end
  end

  def build_date
    date = []
    date[0] = ParseDate.new(service_params.select{ |k, v| k.to_s.index('start_date(') == 0 }.sort.map{ |p| p[1].to_i }).convert
    date[1] = ParseDate.new(service_params.select{ |k, v| k.to_s.index('end_date(') == 0 }.sort.map{ |p| p[1].to_i }).convert
    date
  end

end