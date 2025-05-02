require_relative 'prettifier'
# require "bootsnap/setup"

require "rails"
require "action_controller/railtie"
require "action_view/railtie"

require 'bundler/setup'
require "phlex/rails"

# require "view_component"

# spec/rails_helper.rb
class App < Rails::Application
	config.eager_load = false
  # config.hosts.clear
	config.autoload_paths << "#{root}/app/view_components"
	config.secret_key_base = "secret-key"
	config.action_dispatch.show_exceptions = :rescuable
	config.active_support.to_time_preserves_timezone = :zone
	config.action_controller.perform_caching = true
  config.consider_all_requests_local = true

	routes.append do
		resources :posts
	end
end

class PostsController < ActionController::Base
	def index
		render Views::Posts::Index.new
	end
end

App.initialize!

require 'rspec/rails'

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups
  config.filter_run_when_matching :focus
  config.example_status_persistence_file_path = "spec/examples.txt"
  config.disable_monkey_patching!
  config.warnings = true

  config.order = :random
  Kernel.srand config.seed
end

def render(...)
	view_context.render(...)
end

def view_context
	controller.view_context
end

def controller
	@controller ||= ActionView::TestCase::TestController.new
end

def get(url, headers:)
	Rack::MockRequest.new(Rails.application).get(
		url,
		**headers.transform_keys { |key| "HTTP_#{key.to_s.upcase.tr('-', '_')}" }
	)
end

# Custom matcher for HTML comparison
RSpec::Matchers.define :be_equivalent_html do |expected|
  match do |actual|
    # Normalize whitespace and newlines
    Prettifier.prettify(actual) == Prettifier.prettify(expected)
  end

  failure_message do |actual|
    "Expected HTML to be equivalent, but got:\n#{actual}\n\nExpected:\n#{expected}"
  end
end 