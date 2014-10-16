#!/usr/bin/env ruby
# -*- coding: utf-8 -*-
print "Content-type: text/html; charset=UTF-8", "\n\n";
require "cgi"
require "pn.rb"
# input = CGI.new

# inputdata = input["sentence"]
inputdata = "今日はとても楽しかったです。"

pn = PN.new
score = pn.analyze(inputdata)

print "<html><body>"
print "<p>入力文： #{inputdata}</P>"
print "<p>感情極性実数値: #{score}</p>"

if score < -0.5 then
  image = "a0800_001016_m.jpg"
  alttext = "negative"
elsif score < 0.5 then
  image = "a0002_004890_m.jpg"
  alttext = "average"
else
  image = "a0800_001018_m.jpg"
  alttext = "positive"
end
print "<img border=\"0\" src=\"" + image + "\" width=\"80%\" alt=\"" + alttext +"\">"

print "</body></html>"
