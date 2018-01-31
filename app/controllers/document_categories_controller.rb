class DocumentCategoriesController < ApplicationController
  before_action :authenticate_user!, :set_user
  before_action :set_paper_trail_whodunnit
  before_action :set_document_category, only: [:show, :edit, :update, :destroy]

  def assigns
    if params[:selected_category].blank?
      redirect_to document_categories_path(document: params[:document])
    else
      @category = Category.find(params[:selected_category])
      @documentcategory = DocumentCategory.new
      @documentcategory.category_id = params[:selected_category]
      @documentcategory.document_id = params[:document]
      @documentcategory.save
      postlink
    end
  end

  def create
    @document_category = DocumentCategory.new(document_category_params)
    if @document_category.save
      redirect_to @document_category, notice: 'Document category was successfully created.'
    else
      render :new
    end
  end

  def destroy
    @document_category.destroy
    redirect_to document_categories_url, notice: 'Document category was successfully destroyed.'
  end

  def unassign
    DocumentCategory.destroy(params[:related_category])
    postlink
  end

  def index
    @document = Document.find(params[:document])
    @document_categories = DocumentCategory.where('document_id = ?', params[:document])
    @categories = @document.unrelated_categories
  end

  def new
    @document_category = DocumentCategory.new
  end

  def update
    if @document_category.update(document_category_params)
      redirect_to @document_category, notice: 'Document category was successfully updated.'
    else
      render :edit
    end
  end

  private

  # Never trust parameters from the scary internet, only allow the white list through.
  def document_category_params
    params.require(:document_category).permit(:document_id, :category_id, :sort_order)
  end

  def postlink
    @document = Document.find(params[:document])
    @document_categories = @document.document_categories
    @categories = @document.unrelated_categories
    @linked_documents = @document.all_related
    render 'document_categories/index'
  end
end
