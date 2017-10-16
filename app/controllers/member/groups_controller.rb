class Member::GroupsController < Member::ApplicationController
  before_action :set_group, only: [:show, :my_index_show, :join]

  # GET /member/groups
  # 가입 유도하는 그룹들
  # 여기서 개별 보기를 누르면 내것이 아닌 그룹이니까 show 액션에서 GroupSampleSerializer로 빠진다.
  def index
    @groups = Group.where.not(id: current_user.groups.ids) # 추천알고리즘 나중에 ㄱ

    render json: @groups
  end

  # GET /member/groups/1
  # 미리보기로 맛보기를 시켜준다.
  # member => 신청 누르면 구독으로 보낸다.
  # prime => 신청 누르면 join 시켜준다. join/@group.id로 post 날린다.
  def show
    authorize [:member, @group] #이렇게 부르면 policy 에서 record[1] 로 꺼내야 object 를 받을 수 있다.

    render json: @group, serializer: GroupSampleSerializer # 가입이 되어있지 않는 그룹 일 경우에 샘플 데이터만 뿌린다. 여기서 join 신청을 해서 내 그룹으로 담아준다.
  end

  # GET /member/groups/my_index
  # 내가 가입한 그룹 중 결제한 그룹과 결제하지 않은 그룹 모두 보여진다. paid 로 구분
  # 정회원인지 아닌지를 보여줘야한다. 카드에서 꼬리표같은 느낌으로
  def my_index
    @groups = current_user.groups

    render json: @groups
  end

  # 모든 걸 싹 보게 해준다.
  # prime.paid == false => 누르면 웹 결제로 보낸다.
  # prime.paid == true => 다보기
  def my_index_show
    authorize [:member, @group] #이렇게 부르면 policy 에서 record[1] 로 꺼내야 object 를 받을 수 있다.

    render json: @group, serializer: GroupUnitSerializer # 이미 유저가 가입 된 그룹 일 경우에 연관 데이터 전체를 뿌린다. 이 속에는 정회원이 된 그룹과, 아닌 그룹이 혼재한다. 정회원이 아닌 그룹의 경우 정회원만 할 수 있는 액션을 취할 경우에 앱단에서 결제창으로 리디렉션 시켜야 한다.
  end

  # GET /member/groups/search?category=등산&query=시간 누구나 가능.
  # join된 그룹은 검색되지 않는다.
  # member, prime => 누르면 show 로 보낸다.
  def search
    if params[:category]
      if params[:category] == 'all'
        @groups = Group.where.not(id: current_user.groups.ids).search(params[:query])
      else
        @groups = Group.where.not(id: current_user.groups.ids).where(category: params[:category]).search(params[:query])
      end
    else
      @groups = Group.where.not(id: current_user.groups.ids).search(params[:query])
    end

    render json: @groups
  end

  #prime 만 그룹에 조인 가능
  def join
    authorize [:member, @group]

    @group.users << current_user

    render json: @group, serializer: GroupUnitSerializer
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_group
      @group = Group.find(params[:id])
    end

end
