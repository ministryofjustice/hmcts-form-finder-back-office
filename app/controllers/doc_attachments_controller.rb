class DocAttachmentsController < ApplicationController
  #TODO Lock down the upload page
  before_action :authenticate_user!

  def index
    @doc_attachments = DocAttachment.all
  end

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
    params.require(:doc_attachment)
        .permit(:attachment, :code, :title, :doc_attachment_type_id, :published_date_dd, :published_date_mm, :published_date_yyyy)
  end
end
