class PagesController < ApplicationController
  def home
    @posts=Blog.all
    @techs=Tech.all

  end

  def about
  end

  def contact
  end
end
