class DocumentCategoriesController < ApplicationController
  include Search

  before_action :authenticate_user!, :set_user
  before_action :set_paper_trail_whodunnit

  before_action :set_document_category, only: [:show, :edit, :update, :destroy]

  def index
    @document_categories = DocumentCategory.all
  end

  def show
  end

  def new
    @document_category = DocumentCategory.new
  end

  def edit
  end

  def create
    @document_category = DocumentCategory.new(document_category_params)
    if @document_category.save
      redirect_to @document_category, notice: 'Document category was successfully created.'
    else
      render :new
    end
  end

  def update
    if @document_category.update(document_category_params)
      redirect_to @document_category, notice: 'Document category was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @document_category.destroy
    redirect_to document_categories_url, notice: 'Document category was successfully destroyed.'
  end

  def link
    @document = Document.find(params[:document])
    @document_categories = DocumentCategory.where('document_id = ?', params[:document])
    @categories = @document.unrelated_categories
    render 'document_categories/link'
  end

  def unconnect
    prelink
    DocumentCategory.destroy(params[:related_category])
    postlink
  end

  def connect
    prelink
    @category = Category.find(params[:related_category])
    @documentcategory = DocumentCategory.new
    @documentcategory.category_id = params[:related_category]
    @documentcategory.document_id = params[:document]
    @documentcategory.save
    postlink
  end

  def links
    @categories = []
    @cate = []

    @document = Document.find(params[:document])
    @document_categories = @document.document_categories

    if params[:linksearch].present?
      @categories = @document.unrelated_categories.search(params[:linksearch]).order('created_at DESC')
    else
      @categories = @document.unrelated_categories
    end
    render 'document_categories/link'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_document_category
    @document_category = DocumentCategory.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def document_category_params
    params.require(:document_category).permit(:document_id, :category_id, :sort_order)
  end

  def prelink
    @cate = []
    if params[:linksearch].present?
      @categories = Category.search(params[:linksearch]).order('created_at DESC')
    else
      @categories = []
    end
    if params[:linksearch].present?
      @documents = Document.search(params[:linksearch]).order('created_at DESC')
    else
      @documents = []
    end
    @parent_document = Document.find(params[:document])
  end

  def postlink
    @document = Document.find(params[:document])
    @document_categories = @document.document_categories
    @categories = @document.unrelated_categories
    @linked_documents = @document.all_related
    render 'documents/details'
  end
end
