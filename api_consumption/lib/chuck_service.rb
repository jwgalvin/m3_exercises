require 'faraday'
require 'json'

class ChuckService

  def conn
    @conn ||= Faraday.new(url: "https://api.chucknorris.io/jokes/")
  end

  def parse(response)
    JSON.parse(response.body)
  end

  def random
    response = conn.get("random")
    parse(response)
  end

  def random_in_category(topic)
    response = conn.get("random?={#{topic}}")
    parse(response)
  end

  def categories
    response = conn.get("categories")
    parse(response)
  end

  def search(topic)
    response = conn.get("search?query={#{topic}}")
    parse(response)
  end

end
