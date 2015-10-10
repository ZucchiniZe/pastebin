require 'sinatra'
require 'redis'

# Main class for pastebin
class Paste < Sinatra::Base
  redis = Redis.new(host: ENV['REDIS_PORT_6379_TCP_ADDR'])

  configure do
    set :server, :puma
  end

  def rand_string
    o = [('a'..'z'), ('A'..'Z')].map(&:to_a).flatten
    (0...3).map { o[rand(o.length)] }.join
  end

  get '/' do
    'Hi'
  end

  post '/' do
    str = rand_string
    redis.set(str, params['p'])
    str
  end

  get '/:paste' do
    if redis.exists(params['paste'])
      redis.get(params['paste'])
    else
      'ditto, you wrong urld'
    end
  end
end
