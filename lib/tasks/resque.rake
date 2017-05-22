require 'active_support/dependencies'
require 'resque/tasks'

namespace :resque do
  desc "setup resque environment"

  task 'resque:setup'  do
    require 'active_support/dependencies'
    require 'resque'


  end
end
