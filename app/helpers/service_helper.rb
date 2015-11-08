module ServiceHelper
  def service_date(service)
    I18n.localize service.created_at, format: :history_details
  end

  def service_state_badge(service)
    content_tag :span, class: "badge #{service.state}" do
      service.state
    end
  end

  def display_service_price(service)
    number_to_currency(service.price, precision: 2)
  end

end
