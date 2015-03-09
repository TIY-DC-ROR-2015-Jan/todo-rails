namespace :todos do
  desc "Generate a collection of lists and items"
  task generate: :environment do
    raise unless Rails.env.development?

    List.delete_all
    Todo.delete_all

    User.find_each do |user|
      rand(5..7).times do
        list = user.lists.where(title: Faker::Company.catch_phrase).first_or_create!
        rand(3..10).times do
          due_on = rand(2..14).days.from_now if rand < 0.3
          list.todos.where(description: Faker::Company.bs, due_on: due_on).first_or_create!
        end
      end
    end

    puts "Created #{Todo.count} items in #{List.count} lists"
  end
end
