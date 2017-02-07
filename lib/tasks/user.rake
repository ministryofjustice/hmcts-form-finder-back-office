namespace :user do

  desc 'Creates an user with given name, email and password.'
  task :create, [:email, :password, :first_name, :last_name] => :environment do |t, args|
    email, password, first_name, last_name = args[:email], args[:password],  args[:first_name], args[:last_name]

    puts "Creating user with name: #{first_name} and email: #{email} with password: #{password}"
    User.create(email: email, password: password, first_name: first_name, last_name: last_name)
    puts 'User created!'
  end
end
