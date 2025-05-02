# frozen_string_literal: true

class Components::Nav < Phlex::HTML
	def view_template(&blk)
		nav(class: "special-nav", &blk)
	end

	def item(href, &blk)
		a(class: "special-nav-item", href: href, &blk)
	end

	def divider
		span(class: "special-nav-divider")
	end
end
