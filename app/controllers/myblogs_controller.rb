class MyblogsController < ApplicationController
  def show
    @comments = Comment.all
  end

  def new
    @myblog = Blog.new
  end

  def create
    @myblog = Blog.new(myblog_params)

    #puts 'xxxxxxxxxxxxx', myblog_params.inspect
    #a
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

  def myposts
    @myposts= Blog.where(user_id: current_user.id)   
  end

  def destroy
  end

  def index
    @myblogs = Blog.all
    @comments =Comment.all
  end

  def comment
   Blog.find(params[:id]).comments.create(params[:comment])
   flash[:notice] = "Added your comment"
   redirect_to :action => "show", :id => params[:id]
end

  def myblog_params
    params.require(:blog).permit(:message, :user_type, :user_id)
  end

  private

  def set_myblog
    @myblog= Blog.find(params[:id])
  end
end