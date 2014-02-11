#encoding: utf-8
require 'rubygems'
require 'bundler'
require 'rake'
require 'rspec/core/rake_task'
require 'puppet-doc-lint/rake_task'

Bundler.setup
Bundler::GemHelper.install_tasks

task :default => :spec

RSpec::Core::RakeTask.new(:spec)
