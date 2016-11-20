Gem::Specification.new do |s|
  s.name = 'pxrowx'
  s.version = '0.1.0'
  s.summary = 'Creates a Polyrex document from a raw Polyrex RowX string.'
  s.authors = ['James Robertson']
  s.files = Dir['lib/pxrowx.rb']
  s.add_runtime_dependency('line-tree', '~> 0.5', '>=0.5.6')
  s.signing_key = '../privatekeys/pxrowx.pem'
  s.cert_chain  = ['gem-public_cert.pem']
  s.license = 'MIT'
  s.email = 'james@r0bertson.co.uk'
  s.homepage = 'https://github.com/jrobertson/pxrowx'
end