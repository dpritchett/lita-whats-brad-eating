pry(main)> require 'faraday'
true
pry(main)> require 'nokogiri'
true
pry(main)> raw_response = Faraday
  .get('https://whatsbradeating.tumblr.com').body;

pry(main)> parsed_response = Nokogiri.parse(raw_response)
 ... response snipped

pry(main)> parsed_response.class
Nokogiri::HTML::Document < Nokogiri::XML::Document
pry(main)> parsed_response.css('.post').first
# <Nokogiri::XML::Element:0x3fe00cd4a48c name="section"
#   attributes=[#<Nokogiri::XML::Attr:0x3fe00 name="class" value="post">]
#   children=[#<Nokogiri::XML::Text:0x3fe00a301a90 "\r\n
#   \r\n\r\n                                            \r\n
#   ">, #<Nokogiri::XML::Element:0x3fe00a3019dc name="
 ... remaining response snipped
