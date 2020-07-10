Aws.config.update({
  region: 'us-east-1',
  credentials: Aws::Credentials.new(ENV['BUCKETEER_AWS_ACCESS_KEY_ID'], ENV['BUCKETEER_AWS_SECRET_ACCESS_KEY']),
})

S3_BUCKET = Aws::S3::Resource.new.bucket(ENV['BUCKETEER_BUCKET_NAME'])

