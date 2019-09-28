class CatsController < ApplicationController
  def new; end

  def show
    @result = CatsFinder.call(type: params[:cats_type], location: params[:user_location])
  end
end
