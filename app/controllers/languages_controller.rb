class LanguagesController < ApplicationController
  before_action :authenticate_user!, :set_user
  before_action :set_language, only: [:show, :edit, :update, :destroy]
  before_action :set_paper_trail_whodunnit

  def index
    @languages = Language.all.order(english_name: :asc)
  end

  def show
  end

  def new
    @language = Language.new
  end

  def edit
  end

  def create
    @language = Language.new(language_params)
    apply_change("add")
  end

  def update
    apply_change("edit")
  end

  # DELETE /languages/1
  # DELETE /languages/1.json
  def destroy
    @language.destroy
    apply_change("delete")
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

  def apply_change(action)
    respond_to do |format|
      case action
      when "add"
        if @language.save
          format.html { redirect_to @language, notice: t('language.create_success') }
        else
          format.html { render :new }
        end
      when "edit"
        if @language.update(language_params)
          format.html { redirect_to @language, notice: t('language.update_success') }
        else
          format.html { render :edit }
        end
      else
        format.html { redirect_to languages_url, notice: t('language.delete_success') }
      end
    end
  end

end
