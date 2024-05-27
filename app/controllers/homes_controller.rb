class HomesController < ApplicationController
  include Pagy::Backend
  def index
    @pagy, @jobs = pagy(Job.all.order(created_at: :desc))
  end

  def show
  end
end
