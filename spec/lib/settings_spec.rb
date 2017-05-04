require 'spec_helper'

describe Settings do
  context 'settings file values' do
    describe 'non existent config key' do
      it 'should raise NoMethodError' do
        expect {Settings.unknown_config_key}.to raise_error NoMethodError,
                                                            "undefined method `unknown_config_key' for Settings:Module"
      end
    end

    describe '.excepted_from_ssl' do
      it 'should return an array from the file' do
        expect(Settings.excepted_from_ssl).to eq ['ping.json']
      end
    end
  end
end
