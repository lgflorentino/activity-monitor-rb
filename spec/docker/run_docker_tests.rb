require "rainbow"

TEST_NAME="AM - Docker Tests - (debug)"
TEST_GEM_NAME="am"
WORK_D="/tmp/#{TEST_GEM_NAME}.test.d"
def log_msg(str)
  puts "#{Rainbow(TEST_NAME).fg(:webpurple).bg(:lightsalmon)}: #{str}"
end

log_msg("Executing script #{Rainbow(__FILE__).fg(:lightsalmon)}")

system("mkdir #{WORK_D}")
Dir.chdir(WORK_D) && log_msg("Changed dir to #{Rainbow(WORK_D).fg(:lightsalmon)}")

#system("bundle", "gem", "#{TEST_GEM_NAME}", "--ci=github", "--no-test", "--no-changelog", "--no-coc", "--no-mit")
system("export BUNDLE_PATH=#{WORK_D}/.bundle")
system("bundle", "init")
system("echo 'gem \"activity_monitor_rb\", path: /app' >> Gemfile")
system("bundle install")
system("bundle exec am")

log_msg("Finished script #{Rainbow(__FILE__).fg(:lightsalmon)}")
