# frozen_string_literal: true

module Phlex::Rails::Helpers::PreloadLinkTag
	extend Phlex::Rails::HelperMacros

	# [Rails Docs](https://api.rubyonrails.org/classes/ActionView/Helpers/AssetTagHelper.html#method-i-preload_link_tag)
	register_output_helper def preload_link_tag(...); nil; end
end
