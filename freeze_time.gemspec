Gem::Specification.new do |s|
  # Project
  s.name         = 'freeze_time'
  s.summary      = "FreezeTime can freeze time in tests."
  s.description  = s.summary
  s.version      = '0.1'
  s.date         = '2009-09-28'
  s.platform     = Gem::Platform::RUBY
  s.authors      = ["Wes Oldenbeuving"]
  s.email        = "narnach@gmail.com"
  s.homepage     = "http://www.github.com/Narnach/freeze_time"

  # Files
  root_files     = %w[MIT-LICENSE readme.rdoc Rakefile freeze_time.gemspec]
  bin_files      = %w[]
  lib_files      = %w[freeze_time]
  test_files     = %w[]
  spec_files     = %w[freeze_time]
  other_files    = %w[spec/spec.opts spec/spec_helper.rb]
  s.bindir       = "bin"
  s.require_path = "lib"
  s.executables  = bin_files
  s.test_files   = test_files.map {|f| 'test/%s_test.rb' % f} + spec_files.map {|f| 'spec/%s_spec.rb' % f}
  s.files        = root_files + s.test_files + other_files + bin_files.map {|f| 'bin/%s' % f} + lib_files.map {|f| 'lib/%s.rb' % f}

  # rdoc
  s.has_rdoc         = true
  s.extra_rdoc_files = %w[ readme.rdoc MIT-LICENSE]
  s.rdoc_options << '--inline-source' << '--line-numbers' << '--main' << 'README.rdoc'

  # Requirements
  s.required_ruby_version = ">= 1.8.0"
end
