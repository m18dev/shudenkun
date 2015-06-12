require 'net/http'
require 'uri'
require 'json'

class Station

  attr_accessor :name, :x, :y, :line, :distance

  def initialize(name,x,y,line,distance)
    @name = name
    @x = x
    @y = y
    @line = line
    @distance = distance
  end

  def self.search_near_station
    uri = URI.parse(assemble_url("135.0","35.0"))
    json = Net::HTTP.get(uri)
    response = JSON.parse(json)["response"]["station"]

    stations = []
    response.each do |r|
      stations.push Station.new(r["name"],r["x"],r["y"],r["line"],r["distance"])
    end

    return stations
  end

  def self.assemble_url(x, y)
    return 'http://express.heartrails.com/api/json?method=getStations&x=' + x + '&y' + y
  end
end