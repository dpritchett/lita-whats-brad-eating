require 'nokogiri'

module Lita
  module Handlers
    class WhatsBradEating < Handler

      route /^what's brad eating$/i,
        :brad_eats,
        command: true,
        help: { "what's brad eating" => "latest post from brad's food tumblr" }


      def brad_eats(response)
        blog_url = 'https://whatsbradeating.tumblr.com'

        res = http.get(blog_url)
        noked = Nokogiri.parse(res.body)

        post = noked.css("#posts .post").first

        caption = post.css(".caption").first
        img = post.css(".photo-wrapper img").first

        caption_text = caption.text.strip
        img_url = img.get_attribute('src')

        msg = "#{caption_text} >> #{img_url}"

        response.reply msg
      end

      Lita.register_handler(self)
    end
  end
end
