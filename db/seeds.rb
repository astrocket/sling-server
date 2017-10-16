100.times.each do |i|
  user = User.create(email: "user-#{i}@sling.com", password: 'gksruf')
  user.add_role [:candidate, :member, :prime]
  user.create_user_detail(name: '이한결', birth: DateTime.now - 26.years, phone: '010-1111-1111', job: '개발자', company: '페이스북', position: '인턴', interested_area: '[강남, 건대, 신촌]', interested_field: '[낚시, 게임, 파티]', pic: 'https://pi.tedcdn.com/r/pe.tedcdn.com/images/ted/0ef62e4df27b4ba7294de889fdbc33e476a08ec9_254x191.jpg?')
end

5.times.each do |m|
  # 그룹장 생성
  manager = User.create(email: "manager-#{m}@sling.com", password: 'gksruf')
  manager.add_role :manager

  # 그룹장 명의로 그룹생성하고 그룹의 결제상품 생성
  group = Group.create!(manager: manager, category: ['부동산', '등산', '와인', '파티'].sample)
  group.create_group_detail!(name: "Group-#{m}", about: '해당 그룹에 대한 소개 입니다. 함께 즐거운 시간 보내요.', location: '강남', pic: 'https://media.newyorker.com/photos/5909522d6552fa0be682c09b/master/w_727,c_limit/denby-wolf-of-wall-street.jpg')
  group.save!

  product = group.create_web_product!(price: 1000)

  # 유저가 가입하고 그룹에 조인
  User.where.not(user: manager).sample(10).each do |u|
    product.web_purchases.create!(web_product: product, user: u )
  end

  3.times.each do |a|
    activity = Activity.create!(group: group, category: ['정모', '번개'].sample)
    activity.users << group.users.sample(5)
    activity.create_activity_detail(name: "Activity-#{a}", about: '미래의 그룹의 액티비티 입니다. 참여해보세요.', location: '미래 cgv', schedule: DateTime.now + 3.days , pic: 'http://pds.joins.com/news/component/htmlphoto_mmdata/201309/16/htm_2013091616193924002420.jpg')
  end

  3.times.each do |a|
    activity = Activity.create!(group: group, category: ['정모', '번개'].sample)
    activity.users << group.users.sample(5)
    activity.create_activity_detail(name: "Activity-#{a}", about: '과거의 그룹의 액티비티 입니다. 참여했었어야죠.', location: '과거 cgv', schedule: DateTime.now - 3.days , pic: 'http://pds.joins.com/news/component/htmlphoto_mmdata/201309/16/htm_2013091616193924002420.jpg')
  end

end

# 스팟모임 생성

User.all.sample(6).each_with_index do |u, i|
  spot = Spot.create!(organizer: u, category: ['연예인', '전문직', '고급강의', '컨설팅', '상담'].sample)
  spot.create_spot_detail!(name: "Spot-#{i}", about: '해당 스팟에 대한 소개 입니다. 얼른 참여해서 즐거운 시간 보내셔요', location: '굿브라더 강남점', schedule: DateTime.now + 4.days, pic: 'https://i.pinimg.com/originals/44/a2/d0/44a2d0b2d4a25962c619d0645c8b2499.jpg')
  spot.save!

  product = spot.create_web_product!(price: 1500)

  User.where.not(user: u).sample(9).each do |x|
    product.web_purchases.create!(web_product: product, user: x)
  end

end

user = User.create(email: "free@sling.com", password: 'gksruf')
user.add_role [:candidate, :member]
user.create_user_detail(name: '간찰스', birth: DateTime.now - 26.years, phone: '010-1111-1111', job: '의사', company: '삼성병원', position: '레지던트', interested_area: '[강남, 건대, 신촌]', interested_field: '[낚시, 게임, 파티]', pic: 'https://i.ytimg.com/vi/GLXrKmrRmKc/maxresdefault.jpg')

test = User.first
puts "======= Successfully seeded ! ======\n"
puts "email : #{test.email}\n"
puts "token : #{test.authentication_token}\n"
puts "key   : #{test.key}"
