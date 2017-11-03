class Member::NetworkController < Member::ApplicationController
  def index
    if params[:page] == '1'
      @users = ActiveModel::Serializer::CollectionSerializer.new(User.last(8), each_serializer: UserSerializer)
    end
    post_datas = Post.all.paginate(:page => params[:page], :per_page => 10)
    @posts = ActiveModel::Serializer::CollectionSerializer.new(post_datas, each_serializer: PostSerializer)

    network = {
        users: @users,
        posts: @posts
    }.to_json

    render json: network
  end
end
