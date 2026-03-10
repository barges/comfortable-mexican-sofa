# frozen_string_literal: true

# Prevent sprockets-rails from registering sassc processor
# This must happen before sprockets-rails loads
if defined?(Sprockets::Rails)
  module Sprockets
    module Rails
      class SasscProcessor
        # Stub class to prevent errors
      end
    end
  end
end

# Prevent sprockets from processing .sass files to avoid sassc dependency
Rails.application.config.assets.configure do |env|
  begin
    # Remove any sassc processors that may have been registered
    processors = env.instance_variable_get(:@processors) rescue {}
    if processors.is_a?(Hash)
      processors.each do |mime_type, processor_list|
        if processor_list.is_a?(Array)
          processor_list.reject! { |p| p.to_s.include?("SasscProcessor") || p.to_s.include?("sassc") }
        end
      end
    end
  rescue => e
    # Ignore errors
  end
end

