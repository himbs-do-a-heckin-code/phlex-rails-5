# frozen_string_literal: true

class Components::NestedTable::RowContainer < Phlex::HTML
	attr_accessor :tag

	def initialize(tag: "tbody")
		@tag = tag
		@rows = []
	end

	def with_row(&blk)
		@rows << Components::NestedTable::Row.new(&blk)
	end

	def with_content(&block)
		@rows << block
	end

	def before_template(&blk)
		capture(&blk)
		super
	end

	def view_template
		case @tag
		when "thead"
			thead { render @rows }
		when "tbody"
			tbody { render @rows }
		when "tfoot"
			tfoot { render @rows }
		end
	end
end
