module ApplicationHelper

  def show_icon(className)
    return "<i class='fa fa-fw #{className}'></i>".html_safe
  end

  def show_icon_with_text(className, text)
    return "<i class='fa fa-fw #{className}'></i> #{text}".html_safe
  end

end
