# frozen_string_literal: true

require 'spec_helper'

RSpec.describe 'Partial rendering' do
  it 'renders a partial from phlex' do
    example = Class.new(Phlex::HTML) do
      define_method :view_template do
        div(class: "around") do
          render partial("hello")
        end
      end
    end

    expect(render(example.new)).to be_equivalent_html <<~HTML.strip
      <div class="around">
        <h1>Hello</h1>
      </div>
    HTML
  end

  it 'renders a partial with arguments and a do block' do
    example = Class.new(Phlex::HTML) do
      define_method :view_template do
        div(class: "around") do
          render partial("card", title: "Hello") do
            h3 { "Hello from inside" }
          end
        end
      end
    end

    expect(render(example.new)).to be_equivalent_html <<~HTML.strip
      <div class="around">
        <article>
          <h1>Hello</h1>
          <h3>Hello from inside</h3>
        </article>
      </div>
    HTML
  end

  it 'renders a partial with arguments and a brace block' do
    example = Class.new(Phlex::HTML) do
      define_method :view_template do
        div(class: "around") do
          render partial("card", title: "Hello") {
            h3 { "Hello from inside" }
          }
        end
      end
    end

    expect(render(example.new)).to be_equivalent_html <<~HTML.strip
      <div class="around">
        <article>
          <h1>Hello</h1>
          <h3>Hello from inside</h3>
        </article>
      </div>
    HTML
  end
end 