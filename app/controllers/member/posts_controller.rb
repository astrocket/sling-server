class Member::PostsController < Member::ApplicationController
  before_action :set_post, only: [:show, :update, :destroy]

  # GET /member/posts
  def index
    @posts = Post.all

    render json: @posts
  end

  # GET /member/posts/1
  def show
    render json: @post, serializer: PostUnitSerializer
  end

  # POST /member/posts
  def create
    @post = current_user.posts.new(post_params)

    if @post.save
      render json: @post, serializer: PostSerializer
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /member/posts/1
  def update
    if @post.update(post_params)
      render json: @post
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  # DELETE /member/posts/1
  def destroy
    @post.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def post_params
      params.require(:post).permit(:group_id, :user_id, :content, :comments_count)
    end

end
