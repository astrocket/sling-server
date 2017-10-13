class Member::GroupsController < Member::ApplicationController
  before_action :set_group, only: [:show]

  # GET /member/groups
  # 아무나 다 볼 수 있는 그룹들
  def index
    @groups = Group.all # 추천알고리즘 나중에 ㄱ

    render json: @groups
  end

  # GET /member/groups/my_index
  # 내가 가입한 그룹들
  def my_index
    @groups = current_user.groups

    render json: @groups
  end

  # GET /member/groups/search?category=등산&query=시간
  def search
    if params[:category]
      if params[:category] === 'all'
        @groups = Group.search(params[:query])
      else
        @groups = Group.where(category: params[:category]).search(params[:query])
      end
    else
      @groups = Group.search(params[:query])
    end

    render json: @groups
  end

  # GET /member/groups/1
  def show
    authorize [:member, @group] #이렇게 부르면 policy 에서 record[1] 로 꺼내야 object 를 받을 수 있다.

    render json: @group, serializer: GroupUnitSerializer
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_group
      @group = Group.find(params[:id])
    end

end

# 그룹에 필요한 기능들
# 나에게 추천되는 그룹 5개 : index, 멤버만 보기 / 추천 알고리즘 필요 /
# 내가 가입한 그룹 : my_index
# 검색하기 : search
# 그룹 미리 보기 : info 그룹 디테일이랑, 현재 가입한 유저들 보여주기, 그룹장
# 내가 가입한 그룹 자세히보기 : show 디테일 유저목록 열린수업들 사진들, 그룹장
### 그룹 별로 생성되는 수업도 개설해줘야함 -> activity 이름 / 설명 / 열리는시간
