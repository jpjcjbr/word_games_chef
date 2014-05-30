include_recipe "rbenv::default"
include_recipe "rbenv::ruby_build"

rbenv_ruby "1.9.3-p194" do
  ruby_version "1.9.3-p194"
  global true
end