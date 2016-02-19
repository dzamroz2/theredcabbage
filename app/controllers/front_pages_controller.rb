class FrontPagesController < ApplicationController
  def index
    # HEROKU_SLUG_COMMIT env var requires enabled heroku runtime-dyno-metadata
    etag = ENV['HEROKU_SLUG_COMMIT'] || 'fake_etag'
    fresh_when(etag: etag, public: true)
  end
end
