if Rails.env.production?
  s3 = Fog::Storage.new(provider: 'AWS', region: 'ap-northeast-1')
  CarrierWave.configure do |config|
    config.fog_provider = 'fog/aws'
    config.fog_credentials = {
      # Amazon S3用の設定
      :provider              => 'AWS',
      :region                => ENV['AWS_REGION'],     # 例: 'ap-northeast-1'
      :aws_access_key_id     => ENV['AWS_ACCESS_KEY'],
      :aws_secret_access_key => ENV['AWS_SECRET_KEY']
    }
    config.fog_directory     =  ENV['AWS_BUCKET']
  end
end
