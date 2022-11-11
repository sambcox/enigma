require './lib/enigma'
require './lib/base_layer'
require './lib/modifyer'

RSpec.describe Modifyer do
  let(:enigma) { Enigma.new }
  it 'can find what index to make the character' do
    expect(enigma.new_character('h', 1)).to eq('i')
    expect(enigma.new_character(' ', 23)).to eq('w')
  end
end