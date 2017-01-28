require 'sinatra'
require './lib/time_culc'

get '/' do
  add_min = params[:add].to_i
  add_min ||= 0
  "#{TimeCulc.new.zangyo(add_min)}"
end

get '/next' do
  "#{TimeCulc.new.zangyo(15)}"
end
