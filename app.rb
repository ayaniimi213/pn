require 'sinatra'
require './pn'
require 'uri'
get '/' do
  pn = PN.new
  score = pn.analyze('今日はいい天気ですね')
  
  return "input  >> 今日はいい天気ですね<br>output << #{score.to_s}"
end

get '/:word' do
  # パラメーター日本語に変更
  word = URI.decode(params[:word])
  
  # 感情解析を実行
  pn = PN.new
  score = pn.analyze(word)
  
  return "input  >> #{word}<br>output << #{score.to_s}"
end