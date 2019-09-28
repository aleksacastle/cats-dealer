class CatsController < ApplicationController
  def new; end

  def show
    @facade = Cats::ShowFacade.new(type: params[:cats_type], location: params[:user_location])
  end
end
