module FormHelper
  def error_for(form, field)
    error_message = form.object.errors[field].try(:first)
    content_tag(:div, error_message, class: 'error-message')
  end
end
