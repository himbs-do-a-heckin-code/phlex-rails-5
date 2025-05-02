# frozen_string_literal: true

require 'spec_helper'

RSpec.describe 'Fragment rendering' do
  it 'renders with an X-Fragments header' do
    response = get("/posts", headers: { "X-Fragments" => "post_1" })

    expect(response.status).to eq 200
    expect(response.body).to be_equivalent_html <<~HTML.strip
      <div id="post_1">
        <h1>Post 1</h1>
        <p>This is the first post.</p>
      </div>
    HTML
  end
end 