class PingController < ApplicationController
  respond_to :json

  def index
    Rails.logger.silence do
      render :json => Deployment.info
    end
  end
end