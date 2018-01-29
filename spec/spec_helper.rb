require 'plivo'
require 'vcr'

VCR.configure do |config|
  config.cassette_library_dir = "spec/fixtures/vcr_cassettes"
  config.hook_into :webmock

  config.before_record do |interaction|
    interaction.request['uri'].sub!(/(\/Account\/)(.+?)\//, '\1<account_id>/')
    interaction.response.body.sub!(/(\/Account\/)(.+?)\//, '\1<account_id>/')
    interaction.request.headers['Authorization'] = ['Basic blah==']
  end

end
