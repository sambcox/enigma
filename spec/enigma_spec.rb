require './lib/enigma'

RSpec.describe Enigma do
  let(:enigma) { Enigma.new}

  it 'exists' do
    expect(enigma).to be_a Enigma
  end

  it 'can encrypt a string' do
    expect(enigma.encrypt("hello world", "02715", "040895")).to eq({
      encryption: "keder ohulw",
      key: "02715",
      date: "040895"
    })
  end

  it 'can decrypt a string' do
    expect(enigma.decrypt("keder ohulw", "02715", "040895")).to eq({
      decryption: "hello world",
      key: "02715",
      date: "040895"
    })
  end

  it 'can crack a string' do
    expect(enigma.crack("vjqtbeaweqihssi", "291018")).to eq({
      decryption: "hello world end",
      date: "291018",
      key: "08304"
    })
  end
end