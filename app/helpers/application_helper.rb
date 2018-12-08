module ApplicationHelper

  def histry_item_css(item)
    label = ""

    case item
    when 'クレジット'
      label = 'success'
    when '作者'
      label = 'primary'
    else
      label = 'info'
    end

    "label label-#{label}"
  end
end
