# frozen_string_literal: true

class Components::NestedTable < Phlex::HTML
	def with_head(&blk)
		@head = Components::NestedTable::RowContainer.new(tag: "thead", &blk)
	end

	def with_body(&blk)
		@bodies << Components::NestedTable::RowContainer.new(tag: "tbody", &blk)
	end

	def with_foot(&blk)
		@foot = Components::NestedTable::RowContainer.new(tag: "tfoot", &blk)
	end

	def initialize
		@head = nil
		@bodies = []
		@foot = nil
	end

	def before_template(&blk)
		capture(&blk)
		super
	end

	def view_template(&blk)
		div do
			table(border: 2) do
				render @head if @head
				render @bodies
				render @foot if @foot
			end
		end
	end
end
