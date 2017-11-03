class Member::HomeController < Member::ApplicationController

  def index
    @groups = Group.where.not(id: current_user.groups.ids).paginate(:page => params[:page], :per_page => 4) # 추천알고리즘 나중에 ㄱ 정확도 순서로 뱉어내게 해야함. 홈에서 미리보기할때 4개만 컷하고 전체보기로 쭉 보여주게 됨
    @spots = Spot.where.not(id: current_user.spots.ids).paginate(:page => params[:page], :per_page => 3) # 나중에 추천 알고리즘

    home = {
        groups: ActiveModel::Serializer::CollectionSerializer.new(@groups, each_serializer: GroupSerializer, scope: current_user),
        spots: ActiveModel::Serializer::CollectionSerializer.new(@spots, each_serializer: SpotSerializer, scope: current_user)
    }.to_json

    render json: home
  end

end
