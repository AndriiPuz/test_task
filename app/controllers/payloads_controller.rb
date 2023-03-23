class PayloadsController < ApplicationController
  def index
  end

  def search
    #This event takes parameters from the search field and adds pagination
    @payloads = Payload.search(params[:search]) == nil || params[:search].empty? ? [] : Payload.search(params[:search]).page(params[:page])
  end
end
