include_recipe "apt"
include_recipe "word_games_chef::user"
include_recipe "word_games_chef::ruby"
include_recipe "word_games_chef::gems"
include_recipe "word_games_chef::environment_variables"
include_recipe "word_games_chef::ssh"
include_recipe "nginx"

link "/usr/bin/bundle" do
  to "/opt/rbenv/shims/bundle"
end

[
  "/home/deploy", 
  "/var/www",
  "/etc/nginx/sites-enabled",
  "/etc/unicorn"
].each do |dir|
  directory dir do
    action :create
    recursive true
    group "deploy"
    owner "deploy"
    mode 00775
  end
end

cookbook_file "/etc/nginx/nginx.conf" do
  mode "0644"
  notifies :restart, 'service[nginx]'
end

cookbook_file "/etc/nginx/sites-enabled/default" do
  mode "0644"
  notifies :restart, 'service[nginx]'
end

cookbook_file "/etc/unicorn/word_games.conf" do
  mode "0644"
end

["word_games"].each do |file_name|
  cookbook_file "/etc/init/#{file_name}.conf" do
    source "#{file_name}-upstart.conf"
    mode 00775
    group "deploy"
    owner "deploy"
  end
end