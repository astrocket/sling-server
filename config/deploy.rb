# config valid only for current version of Capistrano
lock "3.9.1"

set :application, 'sling'
set :repo_url, 'git@github.com:astrocket/sling-server.git'

# cap production deploy BRANCH=master
set :branch, ENV['BRANCH'] if ENV['BRANCH']

set :migration_role, :app

set :rbenv_type, :user # or :system, depends on your rbenv setup
set :rbenv_ruby, File.read('.ruby-version').strip

# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# Default deploy_to directory is /var/www/my_app_name
set :deploy_to, '/home/deploy/apps/sling'

# Default value for :scm is :git
# set :scm, :git

# Default value for :format is :airbrussh.
# set :format, :airbrussh

# You can configure the Airbrussh format using :format_options.
# These are the defaults.
# set :format_options, command_output: true, log_file: 'log/capistrano.log', color: :auto, truncate: :auto

# Default value for :pty is false
set :pty, true

# Default value for :linked_files is []
set :linked_files, fetch(:linked_files, []).push('config/database.yml', 'config/secrets.yml')

# Default value for linked_dirs is []
set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'public/system')

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }
set :default_env, {
    'SLING_DATABASE_HOST' => ENV['SLING_DATABASE_HOST'],
    'SLING_DATABASE_PORT' => ENV['SLING_DATABASE_PORT'],
    'SLING_DATABASE_USERNAME' => ENV['SLING_DATABASE_USERNAME'],
    'SLING_DATABASE_PASSWORD' => ENV['SLING_DATABASE_PASSWORD'],
    'SLING_DATABASE_DATABASE' => ENV['SLING_DATABASE_DATABASE'],
    'SLING_SECRET_KEY_BASE' => ENV['SLING_SECRET_KEY_BASE'],
    'SLING_S3_BUCKET' => ENV['SLING_S3_BUCKET'],
    'SLING_ACCESS_KEY' => ENV['SLING_ACCESS_KEY'],
    'SLING_SECRET_KEY' => ENV['SLING_SECRET_KEY'],
    'SLING_FACEBOOK_APP' => ENV['SLING_FACEBOOK_APP'],
    'SLING_FACEBOOK_SECRET' => ENV['SLING_FACEBOOK_SECRET'],
    'SLING_EC2_IP' => ENV['SLING_EC2_IP'],
    'SLING_EC2_DOMAIN' => ENV['SLING_EC2_DOMAIN'],
    'SLING_IAMPORT_API_KEY' => ENV['SLING_IAMPORT_API_KEY'],
    'SLING_IAMPORT_API_SECRET' => ENV['SLING_IAMPORT_API_SECRET']
}

# Default value for keep_releases is 5
# set :keep_releases, 5

# Nginx Configuration
set :nginx_domains, "slingfamily.com"
set :nginx_use_ssl, true

# Name of SSL certificate file
set :nginx_ssl_certificate, '/etc/letsencrypt/live/slingfamily.com/fullchain.pem'
set :nginx_ssl_certificate_key, '/etc/letsencrypt/live/slingfamily.comm/privkey.pem'

before 'deploy:check:linked_files', 'config:push'
before 'deploy:starting', 'figaro_yml:setup'
after 'figaro_yml:setup', 'puma:nginx_config'
set :keep_releases, 5

namespace :deploy do
  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      # Here we can do anything such as:
      # within release_path do
      #   execute :rake, 'cache:clear'
      # end
    end
  end
end
