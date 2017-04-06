module Search
  extend ActiveSupport::Concern

  def search
    @documents = Document.all
    if params[:search].present?
      @documents = Document.search(params[:search]).order("created_at DESC")
    else
      @documents = []
    end
  end
end