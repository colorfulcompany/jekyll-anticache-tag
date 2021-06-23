module Jekyll
  module Anticache
    class Error < StandardError; end

    #
    # anticache tag
    #
    class Tag < ::Liquid::Tag
      CONFIG_NAMESPACE ||= 'anticache_tag'.freeze
      
      class << self
        #
        # register tag with site config
        #
        # @param site [Object]
        #
        # :reek:DuplicateMethodCall
        def register(site)
          config = site.config[CONFIG_NAMESPACE]
          
          tag = if config && config.dig('tag') 
                  config.dig('tag')
                else
                  'acasset'
                end
          
          Liquid::Template.register_tag(tag, self)
        end
      end

      #
      # @param tag_name [String]
      # @param text [String]
      # @param tokens [Object]
      #
      def initialize(tag_name, text, tokens)
        super
        @text = text
      end

      #
      # render string with time-based cache busting number when build
      #
      # @param context [Object]
      # @return [String]
      #
      # :reek:FeatureEnvy
      def render(context)
        env = context.environments&.first['jekyll']&.environment || ENV['JEKYLL_ENV']

        text = @text.strip.gsub(/['"]/, '')

        if env != 'development'
          site = context.registers[:site]

          "#{text}?#{site.time.to_i}"
        else
          text
        end
      end
    end
  end
end

Jekyll::Hooks.register(:site, :post_read) do |site|
  Jekyll::Anticache::Tag.register(site)
end
