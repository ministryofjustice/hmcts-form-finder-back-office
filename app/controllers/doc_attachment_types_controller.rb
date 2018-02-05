class DocAttachmentTypesController < ApplicationController
  before_action :authenticate_user!, :set_user
  before_action :set_paper_trail_whodunnit
  before_action :set_doc_attachment_type, only: [:show, :edit, :update, :destroy]

  def index
    @active_doc_attachment_types = DocAttachmentType.active.all.order(english_name: :asc)
    @inactive_doc_attachment_types = DocAttachmentType.inactive.all.order(english_name: :asc)
  end

  def show; end

  def new
    @doc_attachment_type = DocAttachmentType.new
  end

  def edit; end

  def create
    @doc_attachment_type = DocAttachmentType.new(doc_attachment_type_params)
    if @doc_attachment_type.save
      redirect_to @doc_attachment_type, notice: t('type.create_success')
    else
      render :new
    end
  end

  def update
    if @doc_attachment_type.update(doc_attachment_type_params)
      redirect_to @doc_attachment_type, notice: t('type.update_success')
    else
      render :edit
    end
  end

  def destroy
    @doc_attachment_type.destroy
    redirect_to doc_attachment_types_url, notice: t('type.delete_success')
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_doc_attachment_type
    @doc_attachment_type = DocAttachmentType.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def doc_attachment_type_params
    params.require(:doc_attachment_type).permit(:english_name, :welsh_name, :inactive)
  end
end
