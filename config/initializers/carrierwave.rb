CarrierWave.configure do |config|
  config.storage = :upyun
  config.upyun_username = "zoemorgan"
  config.upyun_password = 'zoemorgan0516'
  config.upyun_bucket = "tupian720-240"
  # upyun_bucket_domain 以后将会弃用，请改用 upyun_bucket_host
  # config.upyun_bucket_domain = "my_bucket.files.example.com"
  config.upyun_bucket_host = "http://tupian720-240.test.upcdn.net"
end
