# frozen_string_literal: true

class Components::NestedTable::Row < Phlex::HTML
	def initialize
		@cells = []
	end

	def with_cell(&blk)
		@cells << Components::NestedTable::Cell.new(&blk)
	end

	def before_template(&blk)
		capture(&blk)
		super
	end

	def view_template(&blk)
		tr do
			render @cells
		end
	end
end
