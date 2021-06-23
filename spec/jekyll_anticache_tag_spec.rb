require 'spec_helper'

describe Jekyll::Anticache::Tag do
  before {
    Liquid::Template.register_tag('acasset', Jekyll::Anticache::Tag)
  }

  #
  # @param literal [String]
  # @return [String]
  #
  # :reek:UtilityFunction
  def template(literal)
    template = Liquid::Template.parse(literal)
    template.root.nodelist.first
  end

  #
  # @param time [Time]
  # @return [Jekyll::Site]
  #
  # :reek:UtilityFunction
  def context(time: Time.now)
    Liquid::Context.new(
      {},
      {},
      {
        site: Jekyll::Site.new(
          {
            'source' => File.join(__dir__, 'dummy_jekyll/source'),
            'destination' => File.join(__dir__, 'dummy_jekyll/_site'),
            'permalink' => 'http://example.com',
            'liquid' => { 'error_mode' => 'warn' },
            'limit_posts' => 0,
            'plugins' => [],
            'time' => time
          }
        )
      }
    )
  end

  describe '#render' do
    describe 'development' do
      before { ENV['JEKYLL_ENV'] = 'development' }
      after { ENV.delete 'JEKYLL_ENV' }

      it 'thru' do
        assert {
          template('{% acasset foo.png %}').render(context) == 'foo.png'
        }
      end
    end

    describe 'production' do
      before { ENV['JEKYLL_ENV'] = 'production' }
      after { ENV.delete 'JEKYLL_ENV' }

      it 'timestamped' do
        assert {
          template('{% acasset foo.png %}').render(context(time: Time.parse('2021-06-22T09:00:00Z'))) == 'foo.png?1624352400'
        }
      end
    end
  end
end
