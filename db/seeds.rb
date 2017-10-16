devc = User.create(email: "candidate@sling.com", password: 'reactnative')
devc.add_role :candidate
devc.create_user_detail(name: '개발팀', birth: DateTime.now - 26.years, phone: '010-1111-1111', job: '개발자', company: '구글', position: 'CEO', interested_area: '[강남, 건대, 신촌]', interested_field: '[낚시, 게임, 파티]', pic: File.open('app/assets/images/girl_sample.jpg'), gender: 'F')
devc.update_attributes!(authentication_token: 'test_token_candidate')
puts "Candidate Dev created"

devm = User.create(email: "member@sling.com", password: 'reactnative')
devm.add_role :candidate
devm.add_role :member
devm.create_user_detail(name: '개발팀', birth: DateTime.now - 26.years, phone: '010-1111-1111', job: '개발자', company: '구글', position: 'CEO', interested_area: '[강남, 건대, 신촌]', interested_field: '[낚시, 게임, 파티]', pic: File.open('app/assets/images/girl_sample.jpg'), gender: 'F')
devm.update_attributes!(authentication_token: 'test_token_member')
puts "Member Dev created"

devp = User.create(email: "prime@sling.com", password: 'reactnative')
devp.add_role :candidate
devp.add_role :member
devp.add_role :prime
devp.create_user_detail(name: '개발팀', birth: DateTime.now - 26.years, phone: '010-1111-1111', job: '개발자', company: '구글', position: 'CEO', interested_area: '[강남, 건대, 신촌]', interested_field: '[낚시, 게임, 파티]', pic: File.open('app/assets/images/girl_sample.jpg'), gender: 'F')
devp.update_attributes!(authentication_token: 'test_token_prime')
puts "Prime Dev created"

5.times.each do |i|
  sex = ['girl', 'boy'].sample
  user = User.create(email: "user-candidate#{i}@sling.com", password: 'gksruf')
  user.add_role :candidate
  user.create_user_detail(name: '대기자', birth: DateTime.now - 26.years, phone: '010-1111-1111', job: '디자이너', company: '페이스북', position: '인턴', interested_area: '[강남, 건대, 신촌]', interested_field: '[낚시, 게임, 파티]', pic: File.open("app/assets/images/#{sex}_sample.jpg"), gender: "#{sex == 'girl' ? 'F' : 'M'}")
  puts "#{user.email} created !"
end

20.times.each do |i|
  sex = ['girl', 'boy'].sample
  user = User.create(email: "user-ㅡmember#{i}@sling.com", password: 'gksruf')
  user.add_role :candidate
  user.add_role :member
  user.create_user_detail(name: '일반인', birth: DateTime.now - 26.years, phone: '010-1111-1111', job: '기획자', company: '페이스북', position: '팀장', interested_area: '[강남, 건대, 신촌]', interested_field: '[낚시, 게임, 파티]', pic: File.open("app/assets/images/#{sex}_sample.jpg"), gender: "#{sex == 'girl' ? 'F' : 'M'}")
  puts "#{user.email} created !"
end

60.times.each do |i|
  sex = ['girl', 'boy'].sample
  user = User.create(email: "user-prime#{i}@sling.com", password: 'gksruf')
  user.add_role :candidate
  user.add_role :member
  user.add_role :prime
  user.create_user_detail(name: '정회원', birth: DateTime.now - 26.years, phone: '010-1111-1111', job: '개발자', company: '페이스북', position: '개발팀장', interested_area: '[강남, 건대, 신촌]', interested_field: '[낚시, 게임, 파티]', pic: File.open("app/assets/images/#{sex}_sample.jpg"), gender: "#{sex == 'girl' ? 'F' : 'M'}")
  puts "#{user.email} created !"
end

puts "==== All User created ===="

5.times.each do |m|
  # 그룹장 생성
  manager = User.create(email: "manager-#{m}@sling.com", password: 'gksruf')
  manager.create_user_detail(name: '손석희', birth: DateTime.now - 45.years, phone: '010-3384-2838', job: '앵커', company: 'JTBC', position: '사장', interested_area: '[일산, 강남]', interested_field: '[토론, 방송, 정의구현]', pic: File.open('app/assets/images/manager_sample.jpg'), gender: 'M')
  manager.add_role :candidate
  manager.add_role :member
  manager.add_role :prime
  manager.add_role :manager

  # 그룹장 명의로 그룹생성하고 그룹의 결제상품 생성
  group = Group.create!(manager: manager, category: ['부동산', '등산', '와인', '파티'].sample)
  group.create_group_detail!(name: "Group-#{m}", about: '해당 그룹에 대한 소개 입니다. 함께 즐거운 시간 보내요.', location: '강남', pic: 'https://media.newyorker.com/photos/5909522d6552fa0be682c09b/master/w_727,c_limit/denby-wolf-of-wall-street.jpg')
  group.save!
  puts "Group-#{m} created !"

  product = group.create_web_product!(price: 1000)

  group_users = User.with_role(:prime).where.not(id: manager).sample(10)
  # 그룹에 조인만하고 결제하지 않은 유저
  group_users.first(5).each do |u|
    group.users << u
    group.save
  end

  # 그룹에 조인하고 결제까지 한 유저 ( 그룹으로 넣는 로직은 결제 처리하면 자동으로 진행 됨 )
  group_users.last(5).each do |u|
    product.web_purchases.create!(web_product: product, user: u )
  end

  3.times.each do |a|
    activity = Activity.create!(group: group, category: ['정모', '번개'].sample)
    activity.users << group.users.with_role(:prime).sample(5)
    activity.create_activity_detail(name: "Activity-#{a}", about: '미래의 그룹의 액티비티 입니다. 참여해보세요.', location: '미래 cgv', schedule: DateTime.now + 3.days , pic: 'http://pds.joins.com/news/component/htmlphoto_mmdata/201309/16/htm_2013091616193924002420.jpg')
  end

  3.times.each do |a|
    activity = Activity.create!(group: group, category: ['정모', '번개'].sample)
    activity.users << group.users.with_role(:prime).sample(5)
    activity.create_activity_detail(name: "Activity-#{a}", about: '과거의 그룹의 액티비티 입니다. 참여했었어야죠.', location: '과거 cgv', schedule: DateTime.now - 3.days , pic: 'http://pds.joins.com/news/component/htmlphoto_mmdata/201309/16/htm_2013091616193924002420.jpg')
  end

end
puts "==== All Group created ! ===="
# 스팟모임 생성

User.with_role(:member).sample(6).each_with_index do |u, i|
  spot = Spot.create!(organizer: u, category: ['연예인', '전문직', '고급강의', '컨설팅', '상담'].sample)
  spot.create_spot_detail!(name: "Spot-#{i}", about: '해당 스팟에 대한 소개 입니다. 얼른 참여해서 즐거운 시간 보내셔요', location: '굿브라더 강남점', schedule: DateTime.now + 4.days, pic: 'https://i.pinimg.com/originals/44/a2/d0/44a2d0b2d4a25962c619d0645c8b2499.jpg')
  spot.save!
  puts "Spot-#{i} created !"
  product = spot.create_web_product!(price: 1500)

  User.with_role(:member).where.not(id: u).sample(9).each do |x|
    product.web_purchases.create!(web_product: product, user: x)
  end

end
puts "==== All Spot created ! ===="

test = User.first
puts "======= Successfully seeded ! ======\n"
puts "email : #{test.email}\n"
puts "token : #{test.authentication_token}\n"
puts "key   : #{test.key}"
