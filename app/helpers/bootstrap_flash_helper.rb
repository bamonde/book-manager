module BootstrapFlashHelper
  def bootstrap_alert(key)
    case key
      when 'alert'
        'danger'
      when 'notice'
        'success'
    end
  end
end
