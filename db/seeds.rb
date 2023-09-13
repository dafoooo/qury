# Users
[ProjectUser, User, Project].each(&:destroy_all)

10.times do |i|
  username = Faker::Internet.unique.username(specifier: 5..8)

  User.create!(
    {
      username: username,
      email: Faker::Internet.email(name: username)
    }
  )
end

5.times do |i|
  Project.create!(
    {
      name: Faker::Company.name,
      key: Faker::Finance.unique.ticker,
      description: Faker::Lorem.paragraph
    }
  )
end

15.times do |i|
  user_id = User.pluck(:id).sample
  project_id = Project.pluck(:id).sample
  is_owner = ProjectUser.find_by(is_owner: true, project_id: project_id, user_id: user_id).blank?

  ProjectUser.create!(
    user_id: user_id,
    project_id: project_id,
    is_owner: is_owner
  )
end
