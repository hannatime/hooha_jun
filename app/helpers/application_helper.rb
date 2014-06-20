module ApplicationHelper
  def title(value)
    unless value.nil?
      @title = "#{value} | Hooha"      
    end
  end
end
