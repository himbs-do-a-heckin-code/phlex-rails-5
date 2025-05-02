# frozen_string_literal: true

require 'spec_helper'

RSpec.describe 'Missing helpers' do
  it 'raises error when helper is missing' do
    component = Class.new(Phlex::HTML) do
      define_singleton_method(:name) { "Components::Post" }

      define_method :view_template do
        link_to("/posts") { "Posts" }
      end
    end

    expect { render(component) }.to raise_error(NoMethodError, <<~MESSAGE)
      Try including `Phlex::Rails::Helpers::LinkTo` in Components::Post.
    MESSAGE
  end
end