class DocAttachmentsController < ApplicationController
  #TODO Lock down the upload page
  #before_action :authenticate_user!

  def new
    @doc_attachment = DocAttachment.new
  end

  def create
    @doc_attachment = DocAttachment.new(doc_attachment_params)

    if @doc_attachment.save
      redirect_to doc_attachments_new_path, notice: 'Friend was successfully created.'
    else
      render action: 'new'
    end
  end

  private

  def doc_attachment_params
    params.require(:doc_attachment).permit(:doc_attachment_type_id, :attachment)
  end
end
