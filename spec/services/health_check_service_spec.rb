require 'spec_helper'
describe HealthCheckService do
  context 'can check healthcheck' do
    it 'should call accessible and avaiable on all checks' do
      expect_any_instance_of(HealthCheck::Database).to receive(:available?).and_return(true)
      expect_any_instance_of(HealthCheck::Database).to receive(:accessible?).and_return(true)

      result = HealthCheckService.new.report
      expect(result.status).to eq '200'
      expect(result.messages).to eq 'All Components OK'
    end

    it 'should collect error messages if any checks fail' do
      expect_any_instance_of(HealthCheck::Database).to receive(:available?).and_return(false)
      expect_any_instance_of(HealthCheck::Database).to receive(:accessible?).and_return(false)
      expect_any_instance_of(HealthCheck::Database).to receive(:error_messages).and_return([
                                                                                             'DB message 1', 'DB Message 2'
                                                                                           ])

      result = HealthCheckService.new.report
      expect(result.status).to eq '500'
      expect(result.messages.sort).to eq([
        "DB message 1", "DB Message 2"
      ].sort)
    end
  end
end
