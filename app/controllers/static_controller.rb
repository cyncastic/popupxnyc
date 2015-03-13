class StaticController < ApplicationController
  skip_before_filter :authorize, only: [ :instagram ]

  def instagram
  end

end
