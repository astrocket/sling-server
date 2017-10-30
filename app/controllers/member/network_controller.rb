class Member::NetworkController < Member::ApplicationController
  def index
    @users = User.last(8)
    @posts = Post.where(group: nil).last(8)

    network = {
        #users: UserSerializer.new(@users),
        #posts: PostSerializer.new(@posts)
        users: ActiveModel::Serializer::CollectionSerializer.new(@users, each_serializer: UserSerializer),
        posts: ActiveModel::Serializer::CollectionSerializer.new(@posts, each_serializer: PostSerializer)
    }.to_json

    render json: network
  end
end
