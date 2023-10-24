class RandomUserService
  def self.fetch_random_user
    response = RestClient.get 'https://randomuser.me/api/'
    JSON.parse(response.body)['results'][0]
  end
end