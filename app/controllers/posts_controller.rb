class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :ranks, only: [:top]

  # GET /posts
  # GET /posts.json
  def index
    @q = Post.ransack(params[:q])
    posts = @q.result.order('updated_at DESC').includes(:user)
    @posts = posts.page(params[:page]).per(10)
    @posts_count = posts.count
    now = Time.current
    @ten_minutes_ago = now.ago(10.minutes)
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    @comments = @post.comments.order('created_at DESC')
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(post_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  
  def search
    
    now = Time.current
    @ten_minutes_ago = now.ago(10.minutes)
    
    # @q = Post.ransack(currency_pair_eq: search_params[:currency_pair_eq], title_cont: search_params[:title_cont], user_nickname_eq: search_params[:user_nickname_eq], rich_text_content_cont: search_params[:rich_text_content_cont], created_at_gteq: search_params[:create_at_gteq], created_at_lteq: search_params[:create_at_lteq], updated_at_gteq: search_params[:updated_at_gteq], updated_at_lteq: search_params[:updated_at_lteq])
    @q = Post.ransack(params[:q])
    posts = @q.result.order('updated_at DESC').includes(:user)
    @posts = posts.page(params[:page]).per(10)
    @posts_count = posts.count
    
    render action: 'index'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:title, :content, :currency_pair).merge(user_id: current_user.id)
    end
    
    def search_params
      params.require(:q).permit(:currency_pair_eq, :title_cont, :user_nickname_eq, :rich_text_content_body_cont, :created_at_gteq, :created_at_lteq, :updated_at_gteq, :updated_at_lteq)
    end
    
    def ranks
      @ranks = Post.create_ranks
    end
end
