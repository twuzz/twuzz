module ApplicationHelper
  def current_user; controller.send :current_user; end
end
