class ContentController < ApplicationController
  before_filter :authenticate_user!

  def free
    authorize! :view, :free, :message => 'Access limited to Free Plan subscribers.'
  end

  def silver
    authorize! :view, :silver, :message => 'Access limited to Silver Plan subscribers.'
  end

  def gold
    authorize! :view, :gold, :message => 'Access limited to Gold Plan subscribers.'
  end

  def platinum
    authorize! :view, :platinum, :message => 'Access limited to Platinum Plan subscribers.'
  end

end