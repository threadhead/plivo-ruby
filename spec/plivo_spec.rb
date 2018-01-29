require 'spec_helper'

RSpec.describe Plivo do
  let(:auth_id) { 'SAMWFHNGFHNTJKZJDJOT' }
  let(:auth_token) { 'MGRlY2JkYWEyZDg3ZWUzZmQ0M2ZmNjI3NzdhYTA0' }

  describe 'RestAPI' do
    let(:rest_api) { Plivo::RestAPI.new(auth_id, auth_token) }

    describe '#hash_to_params' do
      let(:hash) { { a: 1, b: '2' } }

      subject { rest_api.hash_to_params(hash) }

      it 'converts a hash to html parameters' do
        expect(subject).to eq('a=1&b=2')
      end
    end

    describe '#get_message' do
      subject { rest_api.get_message('dde645c7-0c8f-4804-98a5-8b46a9089f62') }

      it 'requests the message status of passed id' do
        VCR.use_cassette("get_message", match_requests_on: [:method, :uri, :host]) do
          subject
        end
      end
    end
  end
end
