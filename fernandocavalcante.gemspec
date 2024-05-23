Gem::Specification.new do |spec|
    spec.name          = "fernandocavalcante"
    spec.version       = "0.4.7"
    spec.authors       = ["Fernando P. S. Cavalcante"]
    spec.email         = ["fernando@fernandocavalcante.com"]
  
    spec.summary       = "just my personal website"
    spec.homepage      = "https://github.com/FernandoPazCavalcante/fernandocavalcante"
    spec.license       = "MIT"
  
    spec.files         = `git ls-files -z`.split("\x0").select { |f| f.match(%r!^(assets|_layouts|_includes|_sass|LICENSE|README|_config\.yml)!i) }
  
    spec.add_runtime_dependency "jekyll", "~> 3.9.0"
    spec.add_runtime_dependency "jekyll-feed", "~> 0.15.1"
    spec.add_runtime_dependency "jekyll-seo-tag", "~> 2.7.1"
  
  end