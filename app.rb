require "sinatra"
require "sinatra/reloader"
require "better_errors"
require "binding_of_caller"

use(BetterErrors::Middleware)
BetterErrors.application_root = __dir__
BetterErrors::Middleware.allow_ip!('0.0.0.0/0.0.0.0')


# get("/") do
#   erb(:layout)
# end


get("/rock") do

  @ours = "rock"
  @them = ["rock", "paper", "scissors"].sample

  if @them == "rock"
    @result = "tied"
  elsif @them == "paper"
    @result = "lost"
  else
    @result = "won"
  end

  erb(:game)

end
