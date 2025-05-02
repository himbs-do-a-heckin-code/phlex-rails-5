# frozen_string_literal: true

class Phlex::Rails::FormBuilder < Phlex::Rails::Decorator
	define_method :__caller_locations__, ::Object.instance_method(:caller_locations)

	def id(...); @object.id(...); end
	def to_model(...); @object.to_model(...); end
	def field_id(...); @object.field_id(...); end
	def field_name(...); @object.field_name(...); end
	def to_partial_path(...); @object.to_partial_path(...); end

	def multipart=(value)
		@object.multipart = value
	end

	output def button(...); nil; end
	output def check_box(...); nil; end
	output def checkbox(...); nil; end
	output def collection_select(...); nil; end
	output def color_field(...); nil; end
	output def date_field(...); nil; end
	output def date_select(...); nil; end
	output def datetime_field(...); nil; end
	output def datetime_local_field(...); nil; end
	output def datetime_select(...); nil; end
	output def email_field(...); nil; end
	output def file_field(...); nil; end
	output def grouped_collection_select(...); nil; end
	output def hidden_field(...); nil; end
	output def month_field(...); nil; end
	output def number_field(...); nil; end
	output def password_field(...); nil; end
	output def phone_field(...); nil; end
	output def radio_button(...); nil; end
	output def range_field(...); nil; end
	output def rich_text_area(...); nil; end
	output def rich_textarea(...); nil; end
	output def search_field(...); nil; end
	output def select(...); nil; end
	output def submit(...); nil; end
	output def telephone_field(...); nil; end
	output def text_area(...); nil; end
	output def text_field(...); nil; end
	output def textarea(...); nil; end
	output def time_field(...); nil; end
	output def time_select(...); nil; end
	output def time_zone_select(...); nil; end
	output def url_field(...); nil; end
	output def week_field(...); nil; end
	output def weekday_select(...); nil; end

	def collection_check_boxes(*args, **kwargs, &block)
		output = if block
			@object.collection_check_boxes(*args, **kwargs) do |builder|
				yield ::Phlex::Rails::CheckboxBuilder.new(builder, component: @component)
			end
		else
			@object.collection_check_boxes(*args, **kwargs)
		end

		@component.raw(output)
	end

	def collection_checkboxes(*args, **kwargs, &block)
		output = if block
			@object.collection_checkboxes(*args, **kwargs) do |builder|
				yield ::Phlex::Rails::CheckboxBuilder.new(builder, component: @component)
			end
		else
			@object.collection_checkboxes(*args, **kwargs)
		end

		@component.raw(output)
	end

	def collection_radio_buttons(*args, **kwargs, &block)
		output = if block
			@object.collection_radio_buttons(*args, **kwargs) do |builder|
				yield ::Phlex::Rails::RadioButtonBuilder.new(builder, component: @component)
			end
		else
			@object.collection_radio_buttons(*args, **kwargs)
		end

		@component.raw(output)
	end

	def fields(*args, **kwargs, &block)
		output = if block
			@object.fields(*args, **kwargs) do |builder|
				yield ::Phlex::Rails::FormBuilder.new(builder, component: @component)
			end
		else
			@object.fields(*args, **kwargs)
		end

		@component.raw(output)
	end

	def fields_for(*args, **kwargs, &block)
		output = if block
			@object.fields_for(*args, **kwargs) do |builder|
				yield ::Phlex::Rails::FormBuilder.new(builder, component: @component)
			end
		else
			@object.fields_for(*args, **kwargs)
		end

		@component.raw(output)
	end

	def label(*args, **kwargs, &block)
		output = if block
			@object.label(*args, **kwargs) do |builder|
				yield ::Phlex::Rails::LabelBuilder.new(builder, component: @component)
			end
		else
			@object.label(*args, **kwargs)
		end

		@component.raw(output)
	end
end
