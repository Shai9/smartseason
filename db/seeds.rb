puts "Cleaning existing data..."
User.destroy_all
Field.destroy_all

admin = User.create!(
  email: "admin@smartseason.com",
  name: "Admin User",
  password: "admin123",
  password_confirmation: "admin123",
  role: 1
)

agent1 = User.create!(
  email: "kimani@smartseason.com",  
  name: "Kimani Agent",
  password: "agent123",
  password_confirmation: "agent123",
  role: 0
)

agent2 = User.create!(
  email: "abuya@smartseason.com",   
  name: "Abuya Agent",
  password: "agent123",
  password_confirmation: "agent123",
  role: 0
)

# Create sample fields
Field.create!(
  name: "Opoda Farm",
  crop_type: "Rice",
  planting_date: 15.days.ago,
  current_stage: 1,
  agent: agent1
)

Field.create!(
  name: "Langwe Farm",
  crop_type: "Wheat",
  planting_date: 45.days.ago,
  current_stage: 0,
  agent: agent1
)

Field.create!(
  name: "Juja Fields",
  crop_type: "Soybeans",
  planting_date: 10.days.ago,
  current_stage: 1,
  agent: agent2
)

puts "Seed data created successfully!"
puts "=" * 50
puts "Login Credentials:"
puts "Admin: admin@smartseason.com / admin123"
puts "Agent 1 (Kimani): kimani@smartseason.com / agent123"
puts "Agent 2 (Abuya): abuya@smartseason.com / agent123"
puts "=" * 50
puts "Fields created:"
puts "Kimani's fields: Opoda Farm (Rice), Langwe Farm (Wheat)"
puts "Abuya's fields: Juja Fields (Soybeans)"
puts "=" * 50
