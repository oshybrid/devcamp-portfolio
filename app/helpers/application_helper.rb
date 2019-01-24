module ApplicationHelper
  def login_helper(style = '')  # Setting Style to a default of empty string, getting around small blog bug
    if current_user.is_a?(GuestUser)
      (link_to "Register", new_user_registration_path, class: style) + 
      " ".html_safe +
      (link_to "Login", new_user_session_path, class: style)
    else
      link_to "Logout", destroy_user_session_path, method: :delete, class: style
    end
  end

  def source_helper(layout_name)
    if session[:source]
      greeting = "Thanks for visiting me from #{session[:source]} and you are on the #{layout_name} layout"
      content_tag(:P, greeting, class: "source-greeting")
    end
  end

  def copyright_generator
    DevcampViewToolBsh::Renderer.copyright 'Brad Hutchins', 'All rights reserved'
  end
end
