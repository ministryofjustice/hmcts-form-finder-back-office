namespace :user do

  desc 'Creates an user with given name, email and password.'
  task :create, [:email, :password, :first_name, :last_name] => :environment do |_t, args|
    email, password, password_confirmation, first_name, last_name = args[:email], args[:password], args[:password_confirmation],  args[:first_name], args[:last_name]

    puts "Creating user with name: #{first_name} and email: #{email} with password: #{password}"
    User.create(email: email, password: password, password_confirmation: password_confirmation, first_name: first_name, last_name: last_name)
    puts 'User created!'
  end
end
