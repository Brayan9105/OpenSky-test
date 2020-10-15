class ApplogsController < ApplicationController
  def index
    @logs = Applog.all
  end
end
