# frozen_string_literal: true

require_relative "lib/gemconfig"

Gem::Specification.new do |spec|
  spec.name = "merge_ruby_client"
  spec.version = "0.0.65"
  spec.authors = Merge::Gemconfig::AUTHORS
  spec.email = Merge::Gemconfig::EMAIL
  spec.summary = Merge::Gemconfig::SUMMARY
  spec.description = Merge::Gemconfig::DESCRIPTION
  spec.homepage = Merge::Gemconfig::HOMEPAGE
  spec.required_ruby_version = ">= 2.7.0"
  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = Merge::Gemconfig::SOURCE_CODE_URI
  spec.metadata["changelog_uri"] = Merge::Gemconfig::CHANGELOG_URI
  spec.files = Dir.glob("lib/**/*")
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
  spec.add_dependency "async-http-faraday", "~> 0.12"
  spec.add_dependency "faraday", "~> 2.7"
  spec.add_dependency "faraday-multipart", "~> 1.0"
  spec.add_dependency "faraday-retry", "~> 2.2"
  spec.add_dependency "mini_mime", "~> 1.1"
end
