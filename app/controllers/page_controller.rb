class PageController < ApplicationController
  def home
    if (!user_signed_in?)
      redirect_to action: 'login'
    end
  end

  def login
    # @post = Post.new(params[:post])
    #
    # respond_to do |format|
    #   if @post.save
    #     format.html  { redirect_to(@post,
    #                                :notice => 'Post was successfully created.') }
    #     format.json  { render :json => @post,
    #                           :status => :created, :location => @post }
    #   else
    #     format.html  { render :action => "new" }
    #     format.json  { render :json => @post.errors,
    #                           :status => :unprocessable_entity }
    #   end
    # end
  end

end
