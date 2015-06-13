require 'spider_web'

class LastTrain < ActiveRecord::Base
  attr_accessor :depature, :destination, :depature_at

  def self.ensure(depature, destination)
    lt = self.where(destination: destination, depature: depature).first
    return lt if lt.present?

    client = SpiderWeb::HtmlClient.new
    lt2 = client.get_last_routes(destination, depature)[0]
    return LastTrain.create(depature: depature, destination: destination, depature_at: lt2.limit_time)
  end

  # 終電発車までの残り時間
  def remain_min
    depature_time = DateTime.parse(depature_at + " JST")
    ((depature_time - DateTime.now) * 24 * 60).to_i
  end
end
