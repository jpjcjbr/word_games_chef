chef_gem "ruby-shadow"

group "deploy"
user "deploy" do
  group "deploy"
  system true
  shell "/bin/bash"
  password "$1$yMLpmBv.$31HvzYbiSMPb0kCD63pWr1"
end

group "admin" do
	members ["deploy"]
end

cookbook_file "/etc/sudoers.d/deploy" do
  source "deploy_sudoers"
  mode 00440
end