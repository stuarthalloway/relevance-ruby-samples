namespace "app" do
  desc "Complete setup to run the app"
  task :setup => ["db:mysql:recreate", "db:migrate", "test", "db:fixtures:load"]
end