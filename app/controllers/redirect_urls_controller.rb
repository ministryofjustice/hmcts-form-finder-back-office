class RedirectUrlsController < ApplicationController
  before_action :authenticate_user!, :set_user
  before_action :set_redirect_url, only: [:show, :edit, :update, :destroy]
  before_action :set_paper_trail_whodunnit

  def index
    @active_redirect_urls = RedirectUrl.active.all.order(incoming: :asc)
    @inactive_redirect_urls = RedirectUrl.inactive.all.order(incoming: :asc)
  end

  def show; end

  def new
    @redirect_url = RedirectUrl.new
  end

  def edit; end

  def create
    @redirect_url = RedirectUrl.new(redirect_url_params)
    if @redirect_url.save
      redirect_to @redirect_url, notice: t('redirect_url.create_success')
    else
      render :new
    end
  end

  def update
    if @redirect_url.update(redirect_url_params)
      redirect_to @redirect_url, notice: t('redirect_url.update_success')
    else
      render :edit
    end
  end

  def destroy
    @redirect_url.destroy
    redirect_to redirect_urls_url, notice: t('redirect_url.delete_success')
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_redirect_url
    @redirect_url = RedirectUrl.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def redirect_url_params
    params.require(:redirect_url).permit(:incoming, :outgoing, :inactive)
  end
end
