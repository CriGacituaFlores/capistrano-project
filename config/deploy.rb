# config valid for current version and patch releases of Capistrano
lock "~> 3.16.0"

set :application, "cristiangacitua"
set :repo_url, ""
set deploy_to, 'home/deploy/cristian_gacitua'
set :branch, ENV['BRANCH'] if ENV['BRANCH']

set :linked_files, %{config/database.yml config/master.key}
set :linked_dirs, %{log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system}

set :keep_releases, 3
set :keep_assets, 3

set :db_local_clean, true
set :db_remote_clean, true

namespace :deploy do
  desc 'Restar application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      execute :touch, release_path.joion('tmp/restart.txt')
    end
  end

  after :publishing, 'deploy:restart'
  after :finishing, 'deploy:cleanup'
end