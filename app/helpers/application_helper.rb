module ApplicationHelper
  def bootstrap_class_for(flash_type)
    { alert: 'alert-danger', notice: 'alert-success' }[flash_type.to_sym] || flash_type.to_s
  end

  def bootstrap_icon_for(flash_type)
    { alert: 'warning-sign', notice: 'ok-circle' }[flash_type.to_sym] || 'question-sign'
  end

  def flash_messages
    flash.each do |msg_type, message|
      concat(content_tag(:div, message, class: "alert #{bootstrap_class_for(msg_type)} fade in") do
        concat content_tag(:button, 'x', class: 'close', data: { dismiss: 'alert' })
        concat content_tag(:i, nil, class: "glyphicon glyphicon-#{bootstrap_icon_for(msg_type)}")
        concat '  '
        concat message
      end)
    end
    nil
  end
end
