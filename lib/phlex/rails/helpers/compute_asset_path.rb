# frozen_string_literal: true

module Phlex::Rails::Helpers::ComputeAssetPath
	extend Phlex::Rails::HelperMacros

	# [Rails Docs](https://api.rubyonrails.org/classes/ActionView/Helpers/AssetUrlHelper.html#method-i-compute_asset_path)
	register_value_helper def compute_asset_path(...); nil; end
end
