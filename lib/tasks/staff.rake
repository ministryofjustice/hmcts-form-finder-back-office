namespace :staff do
  desc "FormFinder Task: Delete all dummy docs after dropping the DB"
  task :delete_docs do
    FileUtils.rm_rf('./public/assets/dev/images/')
    FileUtils.rm_rf('./public/assets/test/images/')
  end

  desc 'Creates sample users'
  task :sample_users => :environment do
    load File.join(Rails.root, 'lib', 'demo_data', 'demo_seeds.rb')
  end
end
