module ApplicationHelper

  def login_helper
    if current_user.is_a?(User)
      link_to 'logout', destroy_user_session_path, method: :delete 
    else
      (link_to 'login', new_user_session_path) + "<br>".html_safe +
      (link_to 'sign-up', new_user_registration_path)    
    end
  end

  def source_helper
   if session[:query]
    greeting = "Thanks for visiting me from #{session[:query]}"
    content_tag(:p, greeting, class: "source_greeting")
    end
  end
end
