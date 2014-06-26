class MyblogsController < ApplicationController
  def show
    

  end

  def new
    @myblog = Blog.new
  end

  def create
    @myblog = Blog.new myblog_params

    #puts 'xxxxxxxxxxxxx', params[:user_id].inspect
   #mmmm
     respond_to do |format|
      if @myblog.save

        format.html { redirect_to myblogs_path, notice: 'message  posted.' }
        format.json { render :show, status: :posted, location: @myblogs }
      else
        format.html { render :new }
        format.json { render json: @myblog.errors, status: :unprocessable_entity }

     end
        
    end

  end

  def update
  end

  def destroy
  end

  def index
    @myblogs = Blog.all
  end

  def myblog_params
    params.require(:blog).permit(:message, :user_type, :user_id)
  end

  private

  def set_myblog
    @myblog= Blog.find(params[:id])
  end
end