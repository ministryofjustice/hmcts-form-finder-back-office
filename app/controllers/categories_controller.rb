class CategoriesController < ApplicationController
  before_action :authenticate_user!, :set_user
  before_action :set_paper_trail_whodunnit
  before_action :set_category, only: [:show, :edit, :update, :destroy]

  def index
    @categories = Category.all.order(english_name: :asc)
  end

  def show
  end

  def new
    @category = Category.new
  end

  def edit
    render :edit
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to @category, notice: t('category.create_success')
    else
      render :new
    end
  end

  def update
    if @category.update(category_params)
      redirect_to @category, notice: t('category.update_success')
    else
      render :edit
    end
  end

  def destroy
    @category.destroy
    redirect_to categories_url, notice: t('category.delete_success')
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

end
