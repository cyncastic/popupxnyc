class StaticController < ApplicationController
  skip_before_filter :authorize, only: [ :contact, :instagram ]

  def instagram
  end

end
