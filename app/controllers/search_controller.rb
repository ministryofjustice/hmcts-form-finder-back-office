class SearchController < ApplicationController
  before_action :set_paper_trail_whodunnit

  def index
    @page_title = t(:search)
  end
end
