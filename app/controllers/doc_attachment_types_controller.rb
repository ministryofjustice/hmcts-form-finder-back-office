class DocAttachmentTypesController < ApplicationController
  before_action :authenticate_user!, :set_user
  before_action :set_paper_trail_whodunnit
  before_action :set_doc_attachment_type, only: [:show, :edit, :update, :destroy]

  # GET /doc_attachment_types
  # GET /doc_attachment_types.json
  def index
    @doc_attachment_types = DocAttachmentType.all
  end

  # GET /doc_attachment_types/1
  # GET /doc_attachment_types/1.json
  def show
  end

  # GET /doc_attachment_types/new
  def new
    @doc_attachment_type = DocAttachmentType.new
  end

  # GET /doc_attachment_types/1/edit
  def edit
  end

  # POST /doc_attachment_types
  # POST /doc_attachment_types.json
  def create
    @doc_attachment_type = DocAttachmentType.new(doc_attachment_type_params)

    respond_to do |format|
      if @doc_attachment_type.save
        format.html { redirect_to @doc_attachment_type, notice: "The document type was successfully created." }
        format.json { render :show, status: :created, location: @doc_attachment_type }
      else
        format.html { render :new }
        format.json { render json: @doc_attachment_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /doc_attachment_types/1
  # PATCH/PUT /doc_attachment_types/1.json
  def update
    respond_to do |format|
      if @doc_attachment_type.update(doc_attachment_type_params)
        format.html { redirect_to @doc_attachment_type, notice: "This document type was successfully updated." }
        format.json { render :show, status: :ok, location: @doc_attachment_type }
      else
        format.html { render :edit }
        format.json { render json: @doc_attachment_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /doc_attachment_types/1
  # DELETE /doc_attachment_types/1.json
  def destroy
    @doc_attachment_type.destroy
    respond_to do |format|
      format.html { redirect_to doc_attachment_types_url, notice: "The document type was successfully deleted." }
      format.json { head :no_content }
    end
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
