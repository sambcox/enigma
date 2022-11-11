require './lib/enigma'
require './lib/base_layer'

RSpec.describe BaseLayer do
  let(:enigma) { Enigma.new }

  it 'can create an alphabet' do
    expect(enigma.alphabet).to eq(["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", " "])
  end
end