require "bundler/capistrano"

default_run_options[:pty] = true

set :application, "prowellness"
set :branch, "master"
set :scm, :git
set :git_shallow_clone, 1
set :scm_user, "ubuntu"
set :use_sudo, false
set :repository, "git://github.com/rabarroso/prowellness.git"
ssh_options[:forward_agent] = true
set :keep_releases, 5

set :appserver, "178.79.179.253"

role :app, appserver
role :web, appserver
role :db,  appserver, :primary => true

set :user,  "ubuntu"
set :port, "2222"

set(:deploy_to){
  "/home/ubuntu/www/#{application}"
}

before "db:setup", "deploy:update_code", "bundle:install"

after "deploy:update_code", :symlinks
after "deploy:symlink", :run_migrations
after "deploy", "deploy:cleanup"

desc "Restart Application"
deploy.task :restart, :roles => [:app] do
  run "touch #{current_path}/tmp/restart.txt"
end

desc "Migraciones"
task :run_migrations, :roles => [:app] do
  run <<-CMD
    export RAILS_ENV=production &&
    cd #{release_path} &&
    rake db:migrate --trace
  CMD
end

task :symlinks, :roles => [:app] do
  run <<-CMD
    ln -s #{shared_path}/system #{release_path}/public/system;
    ln -s #{shared_path}/cache #{release_path}/public/;
    ln -s #{shared_path}/uploads #{release_path}/public/;
    rm #{release_path}/config/database.yml;
    ln -s #{shared_path}/database.yml #{release_path}/config/;
  CMD
end