require 'curry/dynamic'

RSpec.describe Curry::Dynamic do
  subject(:curried) { described_class.new.call(input) }

  context 'nullary input' do
    let(:input) {
      -> { 3 }
    }

    it 'returns input' do
      expect(curried).to be(input)
    end
  end

  context 'unary input' do
    let(:input) {
      ->(x) { x }
    }

    it 'returns input' do
      expect(curried).to be(input)
    end
  end

  context 'input of higher arity' do
    let(:input) {
      ->(x, y, z, a, b, c) { x + y + z + a + b + c }
    }

    it 'returns a different function' do
      expect(curried).not_to be(input)
    end

    it 'returns an unary function' do
      expect(curried.arity).to be(1)
    end

    it 'returns an unary function after partial application' do
      expect(curried.(1).arity).to be(1)
    end

    it 'can be called arbitrary number of times' do
      expect {
        curried.(1).(2).(3)
      }.not_to raise_exception
    end

    it 'can be called 6 times' do
      expect {
        curried.(1).(2).(3).(4).(5).(6)
      }.not_to raise_exception
    end

    it 'can be called max 6 times' do
      expect {
        curried.(1).(2).(3).(4).(5).(6).(4)
      }.to raise_exception
    end

    it 'returns the same value' do
      expect(
        curried.("1").("2").("3").("4").("5").("6")
      ).to eql(input.call("1", "2", "3", "4", "5", "6"))
    end

    it "does not allow us to pass multiple arguments" do
      expect { curried.(1, 2) }.to raise_exception(ArgumentError)
    end
  end
end
