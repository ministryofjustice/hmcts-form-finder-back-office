class CategoriesController < ApplicationController
  before_action :authenticate_user!, :set_user
  before_action :set_paper_trail_whodunnit
  before_action :set_category, only: [:show, :edit, :update, :destroy]

  # GET /categories
  # GET /categories.json
  def index
    @categories = Category.all.order(english_name: :asc)
  end

  # GET /categories/1
  # GET /categories/1.json
  def show
  end

  # GET /categories/new
  def new
    @category = Category.new
  end

  # GET /categories/1/edit
  def edit
    render :edit
  end

  # POST /categories
  # POST /categories.json
  def create
    @category = Category.new(category_params)
    apply_category_change('add')
  end

  # PATCH/PUT /categories/1
  # PATCH/PUT /categories/1.json
  def update
    apply_category_change('edit')
  end

  # DELETE /categories/1
  # DELETE /categories/1.json
  def destroy
    @category.destroy
    apply_category_change('delete')
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_category
    @category = Category.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def category_params
    params.require(:category).permit(:english_name, :welsh_name, :inactive)
  end

  def update_params
    params.permit(:id, :english_name, :welsh_name, :inactive)
  end

  def apply_category_change(action)
    respond_to do |format|
      case action
      when 'add'
        if @category.save
          format.html { redirect_to @category, notice: t('category.create_success') }
        else
          format.html { render :new }
        end
      when 'edit'
        if @category.update(category_params)
          format.html { redirect_to @category, notice: t('category.update_success') }
        else
          format.html { render :edit }
        end
      else
        format.html { redirect_to categories_url, notice: t('category.delete_success') }
      end
    end
  end

end
