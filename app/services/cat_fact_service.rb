class CatFactService
  def self.generate_cat_fact
    response = RestClient.get 'https://catfact.ninja/fact'
    fact = JSON.parse(response.body)['fact']
    return fact
  rescue RestClient::ExceptionWithResponse => e
    return nil
  end
end
