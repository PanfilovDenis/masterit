load 'deploy' if respond_to?(:namespace) # cap2 differentiator

require 'bundler/capistrano'
require "rvm/capistrano"

# Uncomment if you are using Rails' asset pipeline
load 'deploy/assets'

Dir['vendor/gems/*/recipes/*.rb','vendor/plugins/*/recipes/*.rb'].each { |plugin| load(plugin) }

load 'config/deploy' # remove this line to skip loading any of the default tasks

require 'capistrano/ext/multistage'
require 'capistrano_colors'