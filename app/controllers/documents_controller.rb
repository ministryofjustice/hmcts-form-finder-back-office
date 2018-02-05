class DocumentsController < ApplicationController
  include Search

  before_action :authenticate_user!, :set_user
  before_action :set_paper_trail_whodunnit

  def connect
    if params[:selected_document].blank?
      redirect_to link_documents_link_path(document: params[:document])
    else
      pre_connect
      @parent_document.related_documents << @document
      post_connect
    end
  end

  def create
    @document = Document.new(params_with_user)
    if @document.save
      render 'document_categories/index'
    else
      @document.overwrite_file = params[:overwrite_file]
      render 'new'
    end
  end

  def disconnect
    pre_connect
    (@parent_document.related_documents).delete(@document)
    (@document.related_documents).delete(@parent_document)
    post_connect
  end

  def edit
    @document = Document.find(params[:id])
  end

  def edit_selected_document
    redirect_to params[:selected_document] == [''] ? documents_path : edit_document_path(params[:selected_document])
  end

  def index
    @publication_queue = Document.where('published_date >= ?', Time.zone.today.beginning_of_day).order(published_date: :asc)
  end

  def link
    @document = Document.find(params[:document])
    @linked_documents = @document.all_related
    @documents = @document.all_unrelated
  end

  def new
    @document = Document.new
  end

  def show
    @document = Document.find(params[:id])
    @linked_documents = @document.all_related
    @assigned_categories = @document.document_categories
  end

  def update
    @document = Document.find(params[:id])
    @document.overwrite_file = true
    unless @document.update(params_with_user)
      @document.overwrite_file = params[:overwrite_file]
      @document.update(params_with_user)
    end
    render 'document_categories/index'
  end

  private

  def doc_attachment_params
    params.require(:document).permit(:attachment, :code, :content_date_dd, :content_date_mm, :content_date_yyyy, :doc_attachment_type_id, :inactive, :language_id, :published_date_dd, :published_date_mm, :published_date_yyyy, :summary, :title)
  end

  def params_with_user
    form_params = doc_attachment_params
    form_params[:creator_id] = @user.id
    form_params
  end

  def post_connect
    @document = @parent_document
    @documents = @document.all_unrelated
    @linked_documents = @parent_document.all_related
    @document_categories = @document.document_categories
    render 'documents/link'
  end

  def pre_connect
    @document = Document.find(params[:selected_document])
    @parent_document = Document.find(params[:document])
  end
end
