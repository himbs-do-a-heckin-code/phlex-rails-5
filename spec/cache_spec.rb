# frozen_string_literal: true

require 'spec_helper'

RSpec.describe 'Caching' do
  it 'caches rendered content' do
    expect(render(Components::Cache.new("Original"))).to be_equivalent_html <<~HTML.strip
      <h1>Original</h1>
    HTML

    expect(render(Components::Cache.new("Something else"))).to be_equivalent_html <<~HTML.strip
      <h1>Original</h1>
    HTML
  end
end 