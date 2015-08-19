Gem::Specification.new do |s|
  s.name          = 'geonames'
  s.version       = '0.0.1'
  s.date          = '2015-08-18'
  s.summary       = "Geo Names"
  s.description   = "A simple parser for Geonames"
  s.authors       = ['João Lucas', 'Fernando Oliveira']
  # Add your email here
  s.email         = ['fernandopso@bsi.ufla.br']
  s.files         = Dir.glob("lib/**/*.rb")
  s.homepage      = 'https://github.com/jlucasps/geonames-parser'
  s.license       = 'MIT'
  s.require_paths = ['lib']

  s.add_runtime_dependency "ostruct", "~> 0"

  s.add_development_dependency "bundler", "~> 1.10"
  s.add_development_dependency "rake", "~> 10.0"
  s.add_development_dependency "minitest", "~> 0"
end
