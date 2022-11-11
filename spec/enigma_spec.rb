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
end