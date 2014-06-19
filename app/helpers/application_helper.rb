module ApplicationHelper
  def title(value)
    unless value.nil?
      @title = "#{value} | HoohaJun"      
    end
  end
end
