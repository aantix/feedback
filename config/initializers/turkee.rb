# Go to this page https://aws-portal.amazon.com/gp/aws/developer/account/index.html?action=access-key
# to retrieve your AWS/Mechanical Turk access keys.

AWSACCESSKEYID      = 'AKIAJGZCVJTKAPA7IKQQ'
AWSSECRETACCESSKEY  = 'sg86uBttqU6v5FjwcOx6XLwuMYocY/PpGe8ShDrH'

RTurk::logger.level = Logger::DEBUG
RTurk.setup(AWSACCESSKEYID, AWSSECRETACCESSKEY, :sandbox => (Rails.env == 'production' ? false : true))