require "spec_helper"

describe Lita::Handlers::WhatsBradEating, lita_handler: true, vcr: true do
  let(:robot) { Lita::Robot.new(registry) }

  subject { described_class.new(robot) }
  
  describe ':double' do
    use_vcr_cassette

    it { is_expected.to route("Lita what's brad eating") }
    it { is_expected.to route("Lita what's BRAD eating") }

    it { is_expected.to_not route("Lita brad") }

    it 'responds with a caption and an image URL' do
      send_message "Lita what's brad eating"
      expect(replies.last).to match(/\w+ >> http/i)
    end
  end
end
