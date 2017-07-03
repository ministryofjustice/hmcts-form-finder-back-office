class SearchController < ApplicationController
  before_action :set_paper_trail_whodunnit

  def index
    @page_title = t(:search)
  end

  def search
    @documents, @docs = []

    if params[:searchcode].present?
      @documents = Document.active.search(params[:searchcode])
    end
    if params[:searchcategory].first.present?
      @documents = Document.active.searchdocument(params[:searchcategory])
    end
    if params[:searchcode].present? && params[:searchcategory].first.present?
      @documents = Document.active.searchdocs(params[:searchcategory], params[:searchcode])
    end
    @english_documents = @documents.forms.language_english.active.order('code ASC')
    @english_leaflets = @documents.leaflets.language_english.active.order('code ASC')
    @other_documents = @documents.language_other.active.order('code ASC')
    @welsh_documents = @documents.forms.language_welsh.active.order('code ASC')
    @welsh_leaflets = @documents.leaflets.language_welsh.active.order('code ASC')
    render 'search/results'
  end

  def show
    @document = Document.find(params[:document])
    @linked_documents = @document.all_related.active
    render 'search/show'
  end
end
