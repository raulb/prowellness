#!/usr/bin/env rake
# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)

Prowellness::Application.load_tasks

Rake.application.instance_variable_get('@tasks').delete('default')

Rake.application.instance_variable_get('@tasks').delete('default')
task :default do
  Rake::Task["db:drop"].invoke
  Rake::Task["db:create"].invoke
  Rake::Task["db:migrate"].invoke
  Rake::Task["spec:models"].invoke
  Rake::Task["spec:acceptance"].invoke
end

Rake.application.instance_variable_get('@tasks').delete('db:reset')
namespace :db do
  task :reset do
    Rake::Task["db:drop"].invoke
    Rake::Task["db:create"].invoke
    Rake::Task["db:migrate"].invoke
    Rake::Task["db:seed"].invoke
  end
end