directory "/home/deploy/.ssh" do
  action :create
  recursive true
  group "deploy"
  owner "deploy"
  mode 00775
end

cookbook_file "/home/deploy/.ssh/authorized_keys" do
  source "authorized_keys"
  mode 00775
  group "deploy"
  owner "deploy"
end