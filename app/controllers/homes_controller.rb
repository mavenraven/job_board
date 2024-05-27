class HomesController < ApplicationController
  include Pagy::Backend
  def index
    @pagy, @jobs = pagy(Job.all.order(created_at: :desc), fragment: '#jobs')
  end

  def show
  end
end
