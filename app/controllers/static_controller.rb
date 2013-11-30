class StaticController < ApplicationController
  skip_before_filter :authorize, only: [:home, :contact]

  layout "static"

  def home
  end

  def contact
  end

end
