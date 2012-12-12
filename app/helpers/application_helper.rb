module ApplicationHelper
  
  def highlight(path)
    "active" if current_page?(path)
  end 
end
