class HomeController < ApplicationController

  def index
  end

  def welcome
    render layout: 'devise'
  end

  def render_404
    render file: "#{Rails.root}/public/404.html", layout: false, status: :not_found
  end

end
