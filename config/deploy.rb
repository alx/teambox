require "bundler/capistrano"

default_run_options[:pty] = true

set :application, "teambox"

set :deploy_to,   "/var/app/#{application}"
set :user,        "alx"
set :port,        22104

set :scm,               :git
set :repository,        "git@github.com:alx/teambox.git"
set :branch,            "tetalab"
set :deploy_via,        :remote_cache

role :web, "teambox.tetalab.org"
role :app, "teambox.tetalab.org"
role :db, "teambox.tetalab.org", :primary => true

# ========================
#
# App tasks
#
# ========================

namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end

# ========================
#
# Dev tasks
#
# ========================

# ========================
#
# Hooks
#
# ========================