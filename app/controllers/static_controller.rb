class StaticController < ApplicationController
  skip_before_filter :authorize, only: [:home, :contact, :instagram]

  layout "static"

  def home
  end

  def contact
  end

end
