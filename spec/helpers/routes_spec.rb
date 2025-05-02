# frozen_string_literal: true

require 'spec_helper'

RSpec.describe 'Routes helper' do
  it 'generates _path helpers' do
    component = Class.new(Phlex::HTML) do
      include Phlex::Rails::Helpers::Routes

      define_method :view_template do
        a(href: posts_path) { "Posts" }
      end
    end

    output = render(component)

    expect(output).to be_equivalent_html <<~HTML.strip
      <a href="/posts">Posts</a>
    HTML
  end

  it 'generates _url helpers' do
    component = Class.new(Phlex::HTML) do
      include Phlex::Rails::Helpers::Routes

      define_method :view_template do
        a(href: posts_url) { "Posts" }
      end
    end

    output = render(component)

    expect(output).to be_equivalent_html <<~HTML.strip
      <a href="http://test.host/posts">Posts</a>
    HTML
  end
end 