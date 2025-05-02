# frozen_string_literal: true

require 'spec_helper'

RSpec.describe 'HTML rendering' do
  it 'renders phlex component with early yield from ERB' do
    rows = [{ name: "Joel", email: "joel@example.com" }]

    output = render(template: "table", locals: { rows: rows})

    expect(output).to be_equivalent_html <<~HTML.strip
      <h1>Before</h1>
      <table>
        <thead>
          <tr>
            <th>Name</th>
            <th>Email</th>
          </tr>
        </thead>
        <tbody>
          <tr>
            <td>
              <span>Joel</span>
            </td>
            <td>
              <span>joel@example.com</span>
            </td>
        </tbody>
      </table>
      <h1>After</h1>
    HTML
  end

  it 'renders phlex component from ERB' do
    output = render(template: "nav")

    expect(output).to be_equivalent_html <<~HTML.strip
      <h1>Before</h1>
        <nav class="special-nav">
          <a class="special-nav-item" href="/">Home</a>
          <span class="special-nav-divider"></span>
          <a class="special-nav-item" href="/about"><strong>About</strong></a>
        </nav>
      <h1>After</h1>
    HTML
  end
end 