# frozen_string_literal: true
require 'delegate'

class AutosafeBuffer < SimpleDelegator
  def initialize(obj)
    super
    # Create explicit delegation methods for all methods on the wrapped object
    # for performance vs method_missing
    create_delegator_methods(obj)
  end
  
  def <<(str)
    escaped = if str.html_safe?
      str
    else
      str.html_safe
    end
    
    __getobj__ << escaped
  end
  
  private
  
  def create_delegator_methods(obj)
    # Get all methods of the object minus methods we already have
    obj.methods.each do |method_name|
      # Skip if we already defined this method
      next if self.class.method_defined?(method_name)
      
      # Define the method to explicitly delegate to the wrapped object
      self.class.class_eval do
        define_method(method_name) do |*args, &block|
          __getobj__.send(method_name, *args, &block)
        end
      end
    end
  end
end

module Phlex::Rails::SGML::State
	def buffer
		AutosafeBuffer.new(@user_context[:capture_context]&.output_buffer) || super
	end

	def capture
		if (capture_context = @user_context[:capture_context])
			original_capturing = @capturing
			original_fragments = @fragments

			capture_context.capture do
				@capturing = true
				@fragments = nil
				yield
			ensure
				@capturing = original_capturing
				@fragments = original_fragments
			end || ""
		else
			super
		end
	end
end
