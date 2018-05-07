require 'linkedin' # gem install linkedin
require 'json'

namespace :linkedin do
  task upload: :environment do
    # get your api keys at https://www.linkedin.com/secure/developer
    client = LinkedIn::Client.new('75c24qemroem9e', 'KRU3PS6sdb1mv5ZI')
    puts client.inspect


    rtoken = 'AQVj7kuuu8yu3190H6qND6pgVg62IQ7ouQzCWJlKAvLHhiD0Eqt1lY1bLfSQbwU5Kc-TBzSp07qmWCKR79mYwdUxUBTozfHoHE7KKwx8VRBlUN_Us4wtioxcIBMG2Gr1en7suX6VuhJT6ydfcilWq5z3cuxUI5YZwmwD0nLRjJYeLE8HAC3qJmiQ-2-MASZvPIeMgbomO4NpAG4euYBDJVUXX2FUBhGij4hkW0z4HfULt0niRmj70rF9BfM4is7RFwH3ghErYJfNOp3OEnSgs8LV1Hs0vZKgNFLtV_X72k_zJjHguYWNTOApIgF4i4AAJ4rkVP03-j7AeljKqUd0iR0TjReQkA'
    rsecret = "AQQw7BM0ocpGiNGuSLslzbwSNerJkJi-48PxYHOjT44lNtLaLiF_WegAUnM05Z6GFK9WcgHAKo4sy6o0s1fuZhAOObsPSeUxYA8btJyV67K-AkRAiurroMhJCRiaqyqTQj6vqamUFc1IpwKMGrueygxx5Uv0bQ"


    response = client.add_share(:comment => 'is playing with the LinkedIn Ruby gem', 'submitted-url' => 'https://s3.amazonaws.com/apiteaser/videos/392426acaa5b667ed145ab40.mp4')

    puts response.body.inspect


    # https://www.linkedin.com/oauth/v2/accessToken?grant_type=client_credentials&client_id=93r29maplxr58u&client_secret=rA1z8zBOM3yrX123


    # create an appliation then
    # get your api keys at https://www.linkedin.com/secure/developer
    config = {
      your_consumer_key:    '75c24qemroem9e',
      your_consumer_secret:   'KRU3PS6sdb1mv5ZI',
      oauth_user_token:     rtoken,
      oauth_user_secret:    'KRU3PS6sdb1mv5ZI'
    }
    client = LinkedIn::Client.new(
                config[:your_consumer_key], 
                config[:your_consumer_secret] 
              )

    client.authorize_from_access(
        config[:oauth_user_token],
        config[:oauth_user_secret]
      )

    client.add_share(
      comment: 'Good Morning', 
      content: {'submitted-url' => 'http://www.github.com/blazeeboy' }
    )

  end
end

