require 'rails_helper'

RSpec.describe Stop, type: :model do
  let(:stop) { build(:stop) }
  describe '#self.search' do
    it 'finds a search term by on street' do
      stop.stop_id = 1
      stop.save
      expect(Stop.search('Main').length).to eq 1
    end
    it 'finds a search term by cross street' do
      stop.stop_id = 1
      stop.save

      expect(Stop.search('Washington').length).to eq 1
    end
  end

  describe '#calculate_routes(routes, number_of_transfers)' do
    context "no transfers" do
      it 'calculates the number of routes from a given stop' do
        stop.stop_id = 2
        stop.save
        expect(stop.calculate_routes(stop.routes, '0')).to eq stop.routes
      end
    end
    context "one transfer" do
      it 'returns routes' do
        stop.stop_id = 2
        stop.save
        expect(stop.calculate_routes(stop.routes, '1')).to eq stop.routes
      end
    end
  end

  describe '#calculate_coordinates(routes)' do
    it 'returns an array of Decimals for a given route bound' do
      stop.save
      expect(stop.calculate_coordinates(stop.routes).class).to eq Array
    end
  end
end