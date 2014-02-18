# Go to this feedback_page https://aws-portal.amazon.com/gp/aws/developer/account/index.html?action=access-key
# to retrieve your AWS/Mechanical Turk access keys.

AWSACCESSKEYID      = ENV['AWS_KEY']
AWSSECRETACCESSKEY  = ENV['AWS_SECRET']

RTurk::logger.level = Logger::DEBUG
RTurk.setup(AWSACCESSKEYID, AWSSECRETACCESSKEY, :sandbox => (Rails.env == 'production' ? false : true))