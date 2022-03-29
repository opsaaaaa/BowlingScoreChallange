require 'spec_helper'

RSpec.describe BowlingGame do

  subject(:game) { BowlingGame.new }

  describe '#score' do

    subject { game.score(scores) }
    
    context 'when no special scores occur' do
      let(:scores) { [ 1, 2, 3, 4 ] }

      it { is_expected.to eq 10 }
    end

    context 'when a spare is scored' do
      let(:scores) { [ 3, 7, 5, 0 ] }

      it { is_expected.to eq 20 }
    end

    context 'when a strike is scored' do
      let(:scores) { [ 10, 5, 4 ] }

      it { is_expected.to eq 28 }
    end

    context 'when sibling scores equal 10 but are not in the same frame' do
      let(:scores) { [ 3, 3, 7, 2 ] }

      it { is_expected.to eq 15 }
    end
    
    context 'and a strike precedes a spare' do
      let(:scores) { [ 10, 3, 7, 5, 0 ] }

      it { is_expected.to eq 40 }
    end

    context 'when a perfect game is bowled' do
      let(:scores) { [ 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10 ] }

      it { is_expected.to eq 300 }
    end
    
    context 'When a maximun length game is played' do
      let(:scores) { Array.new(19,0).push(10,0,4) }

      it { is_expected.to eq 14 }
    end

  end
end




