require 'rack'

app = Proc.new do |env|
  req = Rack::Request.new(env)
  res = Rack::Response.new
  res['Content-Type'] = 'text/html'
  res.write(req.fullpath) #method to take all path after base_url
  res.finish
end

Rack::Server.start(app: app, Port: 3000)
