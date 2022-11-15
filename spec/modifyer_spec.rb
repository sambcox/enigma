# frozen_string_literal: true

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
    expect(enigma.encryption_movement(%w[h s s i], 3)).to eq([14, 5, 5, 8])
  end

  it 'can find the original key given the movement and the date' do
    expect(enigma.key_recreator([14, 5, 5, 8], '291018')).to eq('08304')
  end

  it 'can find the original message given just the movement' do
    expect(enigma.code_breaker('vjqtbeaweqihssi', [14, 5, 5, 8])).to eq('hello world end')
  end

  it 'can make an encrypted string given movement and an unencrypted string' do
    expect(enigma.code_maker('hello world end', [14, 5, 5, 8])).to eq('vjqtbeaweqihssi')
  end
end
