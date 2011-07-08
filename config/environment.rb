require 'yaml'

# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
SuttonOpenLibrary::Application.initialize!

# Load the site-specific configuration
# http://snippets.dzone.com/posts/show/551
CONFIG = YAML::load(ERB.new((IO.read("#{RAILS_ROOT}/config/config.yml"))).result).symbolize_keys
