class HomesController < ApplicationController
  def index
    @jobs = Job.all.order(created_at: :desc)
  end

  def show
  end
end
