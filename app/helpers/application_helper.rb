module ApplicationHelper

  def body_class(page_body_class)
    content_for(:body_class) { page_body_class }
  end

end
