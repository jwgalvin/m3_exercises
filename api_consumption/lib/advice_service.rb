require 'faraday'
require 'json'

class AdviceService

  def conn
    @conn ||= Faraday.new(url: "https://api.adviceslip.com/")
  end

  def parse(response)
    JSON.parse(response.body)
  end

  def random
    response = conn.get("advice")
    parse(response)
  end

  def search(topic)
    response = conn.get("advice/search/#{topic}")
    parse(response)
  end

end
