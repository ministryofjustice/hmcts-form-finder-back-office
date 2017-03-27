class DocumentCategoriesController < ApplicationController
  before_action :authenticate_user!, :set_user
  before_action :set_paper_trail_whodunnit

  before_action :set_document_category, only: [:show, :edit, :update, :destroy]

  # GET /document_categories
  # GET /document_categories.json
  def index
    @document_categories = DocumentCategory.all
  end

  # GET /document_categories/1
  # GET /document_categories/1.json
  def show
  end

  # GET /document_categories/new
  def new
    @document_category = DocumentCategory.new
  end

  # GET /document_categories/1/edit
  def edit
  end

  # POST /document_categories
  # POST /document_categories.json
  def create
    @document_category = DocumentCategory.new(document_category_params)

    respond_to do |format|
      if @document_category.save
        format.html { redirect_to @document_category, notice: 'Document category was successfully created.' }
        format.json { render :show, status: :created, location: @document_category }
      else
        format.html { render :new }
        format.json { render json: @document_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /document_categories/1
  # PATCH/PUT /document_categories/1.json
  def update
    respond_to do |format|
      if @document_category.update(document_category_params)
        format.html { redirect_to @document_category, notice: 'Document category was successfully updated.' }
        format.json { render :show, status: :ok, location: @document_category }
      else
        format.html { render :edit }
        format.json { render json: @document_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /document_categories/1
  # DELETE /document_categories/1.json
  def destroy
    @document_category.destroy
    respond_to do |format|
      format.html { redirect_to document_categories_url, notice: 'Document category was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  def search
    @documents = Document.all

    if params[:search].present?
      @documents = Document.search(params[:search]).order("created_at DESC")
    else
      @documents = []
    end
  end
  def link
    @document = Document.find(params[:document])
    @linkedcategories=DocumentCategory.where("document_id=#{params[:document]}")
    @categories=[]
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
    @documentcategory=DocumentCategory.new
    @documentcategory.category_id=params[:related_category]
    @documentcategory.document_id=params[:document]
    @documentcategory.save
    postlink
  end
  def links
    @categories = []
    @cate=[]

    if params[:linksearch].present?
      @categories = Category.search(params[:linksearch]).order("created_at DESC")
    else
      @categories = []
    end
    @parent_document = Document.find(params[:document])
    @linkedcategories=DocumentCategory.where("document_id=#{params[:document]}")
    @linkedcategories.each do |linkedcategory|
      @cate=@cate.push(linkedcategory.category)
    end
    @categories=@categories-@cate
    @document=@parent_document
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
      @cate=[]
      if params[:linksearch].present?
        @categories = Category.search(params[:linksearch]).order("created_at DESC")
      else
        @categories = []
      end
      if params[:linksearch].present?
        @documents = Document.search(params[:linksearch]).order("created_at DESC")
      else
        @documents = []
      end
      @parent_document = Document.find(params[:document])
    end
    def postlink
      @linkedcategories=DocumentCategory.where("document_id=#{params[:document]}")
      @linkedcategories.each do |linkedcategory|
        @cate=@cate.push(linkedcategory.category)
      end
      @categories=@categories-@cate
      @document=@parent_document
      @linkeddocuments=@parent_document.all_related
      render 'documents/show'
    end
end
