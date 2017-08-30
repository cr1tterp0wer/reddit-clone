class PostsController < ApplicationController
   before_action :require_logged_in!, only:[:new,:create]
  def show
    @post = Post.find(params[:id])
  end

  def new
    @subs = Sub.all  
  end

  def create
    sub_ids = params[:sub][:id].map{|el|el.to_i }
   cu_id =  current_user.id

    @post = Post.new(title: post_params[:title], 
                    url: post_params[:url],
                    content: post_params[:content],
                    sub_ids: sub_ids,
                    author_id: cu_id)
    if @post.save
       redirect_to subs_url
    else
      flash[:errors]= @post.errors.full_messages
    end
  end

  private
  def post_params
    params.require(:post).permit(:title,:url,:content)
  end

end
