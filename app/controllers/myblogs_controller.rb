class MyblogsController < ApplicationController
  def show
    @myblogs = Blog.all
  end

  def new
    @myblog = Blog.new
  end

  def create
    @myblog = Blog.new
  end

  def update
  end

  def destroy
  end

  def index
  end
end
