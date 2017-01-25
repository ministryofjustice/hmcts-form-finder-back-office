class DocumentsController < ApplicationController
  before_action :authenticate_user!, :set_user

  def index

    @documents = Document.all
  end

  def new
    @document = Document.new
  end

  def create
    @document = Document.new(params_with_user)

    if @document.save
      render 'documents/confirmation'
    else
      render action: 'new'
    end
  end

  def update
    @document= Document.find(params[:id])

    if @document.update(params_with_user)
      render 'documents/confirmation'
    else
      flash[:error] = 'Form can not be updated'

      render action: 'edit'
    end
  end
  def edit

    @document = Document.find(params[:id])
  end
  def destroy

    @document = Document.find(params[:id])

    if @document.destroy
      redirect_to documents_path , :notice => "Your form has been succcessfully deleted."
    else
      flash[:error] = 'Form can not be deleted'

      render :action => 'index'
    end
  end
  private

  def doc_attachment_params
    params.require(:document)
        .permit(:attachment, :code, :title, :doc_attachment_type_id, :published_date_dd, :published_date_mm, :published_date_yyyy, :language_id)
  end

  def params_with_user
    form_params =  doc_attachment_params
    form_params[:creator_id] = @user.id
    form_params
  end
end
