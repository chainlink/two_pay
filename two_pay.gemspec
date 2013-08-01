Gem::Specification.new do |s|
  s.name        = 'two_pay'
  s.version     = '0.0.0'
  s.date        = '2013-07-31'
  s.summary     = "Pay with https://2pay.us/"
  s.description = "Make payments easy with 2Pay"
  s.authors     = ["Kyle White"]
  s.email       = ''
  s.files       = ["lib/two_pay.rb"]
  s.homepage    = 'http://rubygems.org/gems/two_pay'
  s.license       = 'MIT'
  s.add_runtime_dependency 'json', '~> 1.8.0'
  s.add_runtime_dependency 'rest-client', '~> 1.6.7'
  s.add_development_dependency 'rspec', '~> 2.14.1'
end