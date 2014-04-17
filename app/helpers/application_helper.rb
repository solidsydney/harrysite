module ApplicationHelper
  def tab_link(name, url)
    selected = url.all? { |key, value| params[key] == value }
    link_to(name, url, :class => (selected ? "selected tab" : "tab"))
  end

  def active_tab(c_name, a_name)
    if controller_name == c_name  && action_name == a_name
      "active"
    end
  end

  def active_controller(name, action = nil)
    if action.nil?
      if controller_name == name
        "active"
      end
    else
      if controller_name == name && action_name == action
        "active"
      end
    end
  end

  def opened_tab(name)
    if controller_name == name
      "opened"
    else
      "collapsed"
    end
  end

  def in_open(name)
    if controller_name == name
      "in"
    end
  end
end
