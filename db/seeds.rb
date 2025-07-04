# Clear existing data
Wish.destroy_all
User.destroy_all

# Create test users
user1 = User.create!(
  name: 'Ali Dev',
  email: 'ali@example.com',
  password: 'password'
)

user2 = User.create!(
  name: 'Test User',
  email: 'test@example.com',
  password: 'password'
)

# Create wishes for user1
user1.wishes.create!([
  {
    name: 'John Smith',
    email: 'john@example.com',
    birthday: '2025-07-10',
    time: 'morning',
    style: 'funny'
  },
  {
    name: 'Emily Rose',
    email: 'emily@example.com',
    birthday: '2025-08-21',
    time: 'evening',
    style: 'sweet'
  }
])

# Create wishes for user2
user2.wishes.create!([
  {
    name: 'Mike Jordan',
    email: 'mike@example.com',
    birthday: '2025-07-15',
    time: 'afternoon',
    style: 'motivational'
  }
])

puts "✅ Seeded #{User.count} users and #{Wish.count} wishes!"
