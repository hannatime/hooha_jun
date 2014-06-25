class PagesController < ApplicationController
  before_action :authenticate_user!, only: [
    :inside, :dashboard
  ]

  def home
  end
  
  def inside
  end 

  def dashboard
  end 

  def about
  end

  def plans
  end

  def feature
  end
    
end
