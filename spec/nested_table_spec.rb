# frozen_string_literal: true

require 'spec_helper'

RSpec.describe 'Nested table rendering' do
  it 'renders nested table correctly' do
    html = render template: "nested_table"

    expect(html).to be_equivalent_html <<~HTML
      <div>
        <table border="2">
          <tbody>
            <tr>
              <td>
                HELLO WORLD
              </td>
            </tr>
          </tbody>
        </table>
      </div>
    HTML
  end
end 