module ApplicationHelper
  def auth_token
    '<input type="hidden" name="authenticity_token" value="#{h(form_authencity_token)}"'.html_safe
  end
end
