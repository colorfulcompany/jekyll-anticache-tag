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
        # [param] Object site
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

      def initialize(tag_name, text, tokens)
        super
        @text = text
      end
      
      def render(context)
        text = @text.strip.gsub(/['"]/, '')

        if ENV['JEKYLL_ENV'] != 'development'
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
