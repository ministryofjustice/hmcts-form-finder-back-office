class DocumentsController < ApplicationController
  include Search

  before_action :authenticate_user!, :set_user
  before_action :set_paper_trail_whodunnit

  def connect
    pre_connect
    @parent_document.related_documents << @document
    post_connect
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
    @document_id = params[:selected_document]
    if @document_id == ['']
      redirect_to documents_path
    else
      redirect_to edit_document_path(@document_id)
    end
  end

  def index
    @documents = Document.where('published_date >= ?', Date.today.beginning_of_day).order(published_date: :asc)
  end

  def link
    @document = Document.find(params[:document])
    @linked_documents = @document.all_related
    @documents = []
    render 'documents/link'
  end

  def links
    @document = Document.find(params[:document])
    @documents = []
    if params[:linksearch].present?
      @documents = @document.all_unrelated.search(params[:linksearch]).order('created_at DESC')
    else
      @documents = @document.all_unrelated
    end
    @linked_documents = @document.all_related

    render 'documents/link'
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
    pre_connect
    (@parent_document.related_documents).delete(@document)
    post_connect
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
        .permit(:attachment, :code, :doc_attachment_type_id, :inactive, :language_id, :published_date_dd, :published_date_mm, :published_date_yyyy, :summary, :title)
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
    render 'documents/details'
  end

  def pre_connect
    if params[:linksearch].present?
      @documents = Document.search(params[:linksearch]).order('created_at DESC')
    else
      @documents = []
    end
    @document = Document.find(params[:related_document])
    @parent_document = Document.find(params[:document])
  end

end
