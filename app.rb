require "sinatra"
require "sinatra/reloader" if development?
require "better_errors" if development?
require "binding_of_caller" if development?

configure :development do
  use BetterErrors::Middleware
  BetterErrors.application_root = __dir__
  BetterErrors::Middleware.allow_ip!('0.0.0.0/0.0.0.0')
end

get("/") do
  erb(:main)
end


get("/rock") do

  @ours = "rock"
  @them = ["rock", "paper", "scissors"].sample
  determine_result
  erb(:game)
end

get("/paper") do
  @ours = "paper"
  @them = ["rock", "paper", "scissors"].sample
  determine_result
  erb(:game)
end

get("/scissors") do
  @ours = "scissors"
  @them = ["rock", "paper", "scissors"].sample
  determine_result
  erb(:game)
end

def determine_result
  if @them == @ours
    @result = "tied"
  elsif (@them == "rock" && @ours == "scissors") || (@them == "scissors" && @ours == "paper") || (@them == "paper" && @ours == "rock")
    @result = "lost"
  else
    @result = "won"
  end
end
