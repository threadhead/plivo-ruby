require 'spec_helper'

RSpec.describe Plivo do
  let(:auth_id) { 'auth_id' }
  let(:auth_token) { 'auth_token' }

  describe 'RestAPI' do
    let(:rest_api) { Plivo::RestAPI.new(auth_id, auth_token) }

    describe '#hash_to_params' do
      let(:hash) { { a: 1, b: '2' } }

      subject { rest_api.hash_to_params(hash) }

      it 'converts a hash to html parameters' do
        expect(subject).to eq('a=1&b=2')
      end
    end
  end
end
