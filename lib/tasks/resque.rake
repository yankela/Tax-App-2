require 'active_support/dependencies'
require 'resque/tasks'


task 'resque:setup' => :environment
# namespace :resque do
#   desc "setup resque environment"
#
#   task 'resque:setup'  do
#     require 'active_support/dependencies'
#     require 'resque'
#
#
#   end
# end
