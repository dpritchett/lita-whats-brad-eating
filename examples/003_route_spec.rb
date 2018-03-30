# from lita-whats-brad-eating/spec/lita/handlers/whats_brad_eating_spec.rb

describe 'routes' do
  it { is_expected.to route("Lita what's brad eating") }
  it { is_expected.to route("Lita what's BRAD eating") }
end
