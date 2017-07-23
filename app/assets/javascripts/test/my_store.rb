module MyStore
  extend self
  DB = 5.times.map do |n|
    OpenStruct.new(id: n, timestamp: Time.new, title: "Random thoughts n.#{n}", body: 'Some deep stuff')
  end

  def fetch_articles
    DB
  end

  def article(id)
    id = id.to_i
    DB.find {|a| a.id == id}
  end
end
