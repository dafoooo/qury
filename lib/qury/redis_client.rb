class Qury::RedisClient < Redis
  def initialize db = Settings.redis.db
    super host: Settings.redis.host, db: db
  end
end
