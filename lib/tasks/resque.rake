require 'resque/tasks'


namespace :resque do
  desc "setup resque environment"
  task :setup, :environment do
    require 'resque'
    
  end
end
