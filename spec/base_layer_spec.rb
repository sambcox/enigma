require './lib/enigma'
require './lib/base_layer'

RSpec.describe BaseLayer do
  let(:enigma) { Enigma.new }

  it 'can create an alphabet' do
    expect(enigma.alphabet).to eq(["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", " "])
  end

  it 'can get the information from the date needed to encrypt' do
    expect(enigma.date_mover("052797")).to eq([3, 2, 0, 9])
  end

  it 'can get the amount to move the character for all 1 through 4' do
    expect(enigma.key_maker('52138', '052797')).to eq([1, 23, 13, 20])
  end
end