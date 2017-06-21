class DocumentsController < ApplicationController
  include Search

  before_action :authenticate_user!, :set_user
  before_action :set_paper_trail_whodunnit

  def connect
    preconnect
    @parent_document.related_documents << @document
    postconnect
  end

  def create
    @document = Document.new(params_with_user)
    if @document.save
      render 'documents/confirmation'
    else
      render action: 'new'
    end
  end

  def destroy
    @document = Document.find(params[:id])
    if @document.destroy
      redirect_to documents_path, notice: 'Your form has been succcessfully deleted.'
    else
      flash[:error] = 'Form can not be deleted'
      render action: 'index'
    end
  end

  def edit
    @document = Document.find(params[:id])
  end

  def edit_selected_document
    redirect_to edit_document_path(params[:selected_document])
  end

  def index
    @documents = Document.all
  end

  def link
    @document = Document.find(params[:document])
    @linked_documents = @document.all_related
    @documents = []
    render 'documents/link'
  end

  def links
    @documents = []
    if params[:linksearch].present?
      @documents = Document.search(params[:linksearch]).order('created_at DESC')
    else
      @documents = []
    end
    @parent_document = Document.find(params[:document])
    @linked_documents = @parent_document.all_related
    @documents = @documents - [@parent_document]
    @documents = @documents - @linked_documents
    @document = @parent_document
    render 'documents/link'
    # TODO: Refactor Collection subtraction logic.
  end

  def list
    @documents = Document.all
  end

  def new
    @document = Document.new
  end

  def show
    @document = Document.find(params[:id])
    @linked_documents = @document.all_related
  end

  def unconnect
    preconnect
    (@parent_document.related_documents).delete(@document)
    postconnect
  end

  def update
    @document = Document.find(params[:id])
    if @document.update(params_with_user)
      render 'documents/confirmation'
    else
      flash[:error] = 'Form can not be updated'
      render action: 'edit'
    end
  end

  private

  def doc_attachment_params
    params.require(:document)
        .permit(:attachment, :code, :title, :doc_attachment_type_id, :published_date_dd, :published_date_mm, :published_date_yyyy, :language_id, :inactive)
  end

  def params_with_user
    form_params = doc_attachment_params
    form_params[:creator_id] = @user.id
    form_params
  end

  def postconnect
    @linked_documents = @parent_document.all_related
    @documents = @documents - [@parent_document]
    @documents = @documents - @linked_documents
    @document = @parent_document
    @linkedcategories = DocumentCategory.where("document_id=#{params[:document]}")

    render 'documents/details'
    # TODO: Refactor Collection subtraction logic.
  end

  def preconnect
    if params[:linksearch].present?
      @documents = Document.search(params[:linksearch]).order('created_at DESC')
    else
      @documents = []
    end
    @document = Document.find(params[:related_document])
    @parent_document = Document.find(params[:document])
  end

end
