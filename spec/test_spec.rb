require 'spec_helper'

RSpec.describe Application do

    it "Can run rspec!!" do
        expect(Application.new.example).to eq(true)
    end

end