class DocAttachmentsController < ApplicationController

  def index

    @doc_attachments = DocAttachment.all
  end

  def new
    @doc_attachment = DocAttachment.new
  end

  def create
    @doc_attachment = DocAttachment.new(params_with_user)

    if @doc_attachment.save
      render 'doc_attachments/confirmation'
    else
      render action: 'new'
    end
  end

  def update
    @doc_attachment= DocAttachment.find(params[:id])

    if @doc_attachment.update(params_with_user)
      render 'doc_attachments/confirmation'
    else
      flash[:error] = 'Form can not be updated'

      render action: 'edit'
    end
  end
  def edit

    @doc_attachment = DocAttachment.find(params[:id])
  end
  def destroy

    @doc_attachment = DocAttachment.find(params[:id])

    if @doc_attachment.destroy
      redirect_to doc_attachments_path , :notice => "Your form has been succcessfully deleted."
    else
      flash[:error] = 'Form can not be deleted'

      render :action => 'index'
    end
  end
  private

  def doc_attachment_params
    params.require(:doc_attachment)
        .permit(:attachment, :code, :title, :doc_attachment_type_id, :published_date_dd, :published_date_mm, :published_date_yyyy, :language_id)
  end

  def params_with_user
    form_params =  doc_attachment_params
    form_params[:creator_id] = @user.id
    form_params
  end
end
