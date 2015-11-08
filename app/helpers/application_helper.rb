module ApplicationHelper
  def set_user_registration_type_session
    session[:registration] = "Customer" if request.fullpath =~ /\/customers\/sign_up/
    session[:registration] = "Nurse" if request.fullpath =~ /\/nurses\/sign_up/
    ''
  end

  def is_nurse_registration?
    session[:registration] == "Nurse"
  end

  def is_customer_registration?
    session[:registration] == "Customer"
  end

  def format_nav_notifications

    message = 'Antes de continuar debes de completar tu perfil!'

    content_tag(:div, class: 'nav-wrapper red') do
      concat(content_tag(:div, class: 'container') do
        concat(content_tag(:div, class: 'row') do
          concat(content_tag(:div, class: 'col s12 m12 l8 offset-l2') do
            concat(content_tag :p, message, class: 'notification-message')
          end)
        end)
      end)
    end
  end

  def increase_margin_container
    'duplicate-margin-top' if incomplete_user_profile?
  end

  def show_alert_imcomplete_profile
    if incomplete_user_profile?
      format_nav_notifications
    end
  end

  def incomplete_user_profile?
    user_signed_in? && current_user.pending?
  end

  def format_user_form_title
    content_tag :div, class: 'registration-title-container s12 m12 l12 center' do

      if session[:registration] == 'Nurse'
        icon = 'local_hospital'
        person_title = 'Asistente'
      end

      if session[:registration] == 'Customer'
        icon = 'person'
        person_title = 'Cliente'
      end

      concat(content_tag(:p, class: 'light-blue-text text-darken-4 icon-title') do
        "<i class='material-icons icon-increase-font-size'>#{icon}</i>".html_safe
      end)

      concat(content_tag(:h3, class: 'center light-blue-text text-darken-4 title') do
        person_title
      end)
    end
  end

  def render_error_message(object, field_name)
    'invalid' if object.errors[field_name.to_sym].present?
  end

  def render_error_messages!(resource)
    return "" if resource.errors.empty?

    messages = resource.errors.full_messages.map { |msg| content_tag(:li, msg) }.join
    sentence = I18n.t("errors.messages.not_saved",
                      count: resource.errors.count,
                      resource: resource.class.model_name.human.downcase)

    html = <<-HTML
    <div id="error_explanation">
      <h2>#{sentence}</h2>
      <ul>#{messages}</ul>
    </div>
    HTML

    html.html_safe
  end
end
