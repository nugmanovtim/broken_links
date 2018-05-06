class BrokenLinksController < ApplicationController
  def index
  end

  def go
    @url = params[:url]
    @broken_links = BrokenLinksInspector.new(@url).go
  end
end
