class PostsController < ApplicationController
  
  def show
    @post = Post.find(params[:id])
  end

  def new
    @subs = Sub.all  
  end

  def create
    @post = Post.new(title: post_params[:title], 
                    url: post_params[:url])
    
   debugger
    #get sub
    #get sub.post_ids
    #push new post id into post_ids array
    #set sub.post_ids = array_post_ids
   
  end

  private
  def post_params
    params.require(:post).permit(:title,:url)
  end

end
