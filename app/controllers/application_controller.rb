class ApplicationController < ActionController::API
  before_action :print_params

  def print_params
    p params
  end
end
