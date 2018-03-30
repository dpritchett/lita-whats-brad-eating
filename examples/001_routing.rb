# from lita-whats-brad-eating/lib/lita/handlers/whats_brad_eating.rb
route /^what's brad eating$/i,
  :brad_eats,
  command: true,
  help: {
    "what's brad eating" => "latest post from brad's food tumblr"
  }


def brad_eats(response)
  response.reply 'Actual results coming soon!'
end
