class LanguagesController < ApplicationController
  before_action :authenticate_user!, :set_user
  before_action :set_language, only: [:show, :edit, :update, :destroy]
  before_action :set_paper_trail_whodunnit

  def index
    @active_languages = Language.active.all.order(english_name: :asc)
    @inactive_languages = Language.inactive.all.order(english_name: :asc)
  end

  def show; end

  def new
    @language = Language.new
  end

  def edit; end

  def create
    @language = Language.new(language_params)
    if @language.save
      redirect_to @language, notice: t('language.create_success')
    else
      render :new
    end
  end

  def update
    if @language.update(language_params)
      redirect_to @language, notice: t('language.update_success')
    else
      render :edit
    end
  end

  def destroy
    @language.destroy
    redirect_to languages_url, notice: t('language.delete_success')
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_language
    @language = Language.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def language_params
    params.require(:language).permit(:english_name, :welsh_name, :code, :inactive)
  end
end
