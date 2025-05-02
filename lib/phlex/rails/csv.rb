# frozen_string_literal: true

module Phlex
	module Rails
		module CSV
			def each_item(&blk)
				return super unless ActiveRecord::Relation === collection
				return super unless collection.arel.orders.empty?

				collection.find_each(&blk)
			end
		end
	end
end
