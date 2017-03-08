class LanguagesController < ApplicationController
  before_action :authenticate_user!, :set_user
  before_action :set_language, only: [:show, :edit, :update, :destroy]
  before_action :set_paper_trail_whodunnit

  # GET /languages
  # GET /languages.json
  def index
    @languages = Language.all.order(english_name: :asc)
  end

  # GET /languages/1
  # GET /languages/1.json
  def show
  end

  # GET /languages/new
  def new
    @language = Language.new
  end

  # GET /languages/1/edit
  def edit
  end

  # POST /languages
  # POST /languages.json
  def create
    @language = Language.new(language_params)
    if @language.save
      render 'languages/show'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /languages/1
  # PATCH/PUT /languages/1.json
  def update
    if @language.update(language_params)
      render 'languages/show'
    else
      render action: 'new'
    end
  end

  # DELETE /languages/1
  # DELETE /languages/1.json
  def destroy
    @language.destroy
    respond_to do |format|
      format.html { redirect_to languages_url, notice: 'The language successfully deleted.' }
      format.json { head :no_content }
    end
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
