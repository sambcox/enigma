require './lib/enigma'
require './lib/base_layer'
require './lib/modifyer'

RSpec.describe Modifyer do
  let(:enigma) { Enigma.new }
  it 'can find what index to make the character for an encryption' do
    expect(enigma.new_character('h', 1)).to eq('i')
    expect(enigma.new_character(' ', 23)).to eq('w')
  end

  it 'can find what index to make the character for a decryption' do
    expect(enigma.old_character('i', 1)).to eq('h')
    expect(enigma.old_character('w', 23)).to eq(' ')
  end

  it 'can find the movement amount when attempting to crack' do
    expect(enigma.encryption_movement('hssi')).to eq([14, 5, 5, 8])
  end
end