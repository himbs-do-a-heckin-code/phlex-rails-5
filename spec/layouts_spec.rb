# frozen_string_literal: true

require 'spec_helper'

RSpec.describe 'Layout rendering' do
  let(:expected_output) do
    <<~HTML
      <header>
        <h1>Content for header</h1>
      </header>
      <main>
        <h1>Hello</h1>
      </main>
    HTML
  end

  it 'renders with phlex layout passed as a class' do
    output = render(template: "hello", layout: Components::Layout)
    expect(output).to be_equivalent_html expected_output
  end

  it 'renders with phlex layout passed as an instance' do
    output = render(template: "hello", layout: Components::Layout.new)
    expect(output).to be_equivalent_html expected_output
  end
end 