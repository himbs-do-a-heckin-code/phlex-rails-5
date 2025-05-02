# frozen_string_literal: true

require 'spec_helper'

RSpec.describe 'Content capture' do
  class Component < Phlex::HTML
    def view_template
      yield if block_given?
    end
  end

  UNSET = Object.new.freeze

  it 'capturing nothing returns an empty string' do
    output = UNSET
    view_context = ActionController::Base.new.view_context

    Component.render_in(view_context) do |c|
      output = c.capture do
        # Intentionally empty to capture nothing
      end
    end

    expect(output).to eq ""
  end
end 