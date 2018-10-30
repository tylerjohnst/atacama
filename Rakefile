require 'bundler/gem_tasks'
require 'rake/testtask'

Rake::TestTask.new(:test) do |t|
  t.libs << 'test'
  t.libs << 'lib'
  t.test_files = FileList['test/**/*_test.rb']
end

task default: :test

task :watch do
  exec 'docker run -v `pwd`:/app:cached -it spatialnetworks/alpine bash -l -c "gem install rerun && bundle && rerun -x rake"'
end
