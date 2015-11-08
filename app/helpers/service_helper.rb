module ServiceHelper
  def service_date(service)
    service.created_at.to_date.to_formatted_s(:long_ordinal)
  end

  def service_state_badge(service)
    "<span class='badge #{service.state}'>#{service.state}</span>"
  end

  def display_service_price(service)
    number_to_currency(service.price, precision: 2)
  end

end