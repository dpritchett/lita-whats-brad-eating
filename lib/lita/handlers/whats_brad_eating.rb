require 'nokogiri'

module Lita
  module Handlers
    class WhatsBradEating < Handler
      route  /^what('|’)s brad eating$/i,
        :brad_eats,
        command: true,
        help: { "what's brad eating" => "latest post from brad's food tumblr" }

      # START:blog_url
      BLOG_URL = 'https://whatsbradeating.tumblr.com'.freeze

      def response
        @_response ||= http.get(BLOG_URL)
      end
      # END:blog_url

      def parsed_response
        Nokogiri.parse(response.body)
      end

      def first_post
        parsed_response.css('section.post').first
      end

      def image
        first_post.css('.photo-wrapper img').first
      end

      def caption
        image.attributes.fetch('alt')
      end

      # START:brad_eats
      def brad_eats(response)
        # caption text had some stray newlines we don't need
        caption_text = caption.text.strip
        img_url = image.get_attribute('src')

        msg = "#{caption_text} >> #{img_url}"

        response.reply msg
      end
      # END:brad_eats

      Lita.register_handler(self)
    end
  end
end
