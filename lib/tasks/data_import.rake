require 'import_db'

namespace :app do

  desc "User importing from old bd"
  task :user_importing => :environment do
    ImportDb.import_users
  end
  desc "Work importing from old bd"
  task :work_importing => :environment do
    ImportDb.import_works
  end
  desc "Data importing from old bd"
  task :data_import => [:work_importing, :user_importing] do
    puts "Data was imported"
  end
end
