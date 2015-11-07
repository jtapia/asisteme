module ApplicationHelper
  def set_user_registration_type_session
    session[:registration] = "Customer" if request.fullpath =~ /\/customers\/sign_up/
    session[:registration] = "Nurse" if request.fullpath =~ /\/nurses\/sign_up/
    ''
  end

  def format_user_form_title
    content_tag :div, class: 'registration-title-container s12 m12 l12 center' do

      if session[:registration] == 'Nurse'
        icon = 'local_hospital'
        person_title = 'Enfermera'
      end

      if session[:registration] == 'Customer'
        icon = 'person'
        person_title = 'Cliente'
      end

      concat(content_tag(:p, class: 'light-blue-text text-lighten-3 icon-title') do
        "<i class='material-icons icon-increase-font-size'>#{icon}</i>".html_safe
      end)

      concat(content_tag(:h3, class: 'center light-blue-text text-lighten-3 title') do
        person_title
      end)
    end

  end
end
