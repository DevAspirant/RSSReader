#!/usr/bin/ruby -Ku
# -*- coding: utf-8 -*-
# that,s for CGI 
require 'cgi'
require 'open-uri'
require 'rss'
# that for CGI 
cgi = CGI.new
puts cgi.header("type" => "text/html","chaset" => "UTF-8")
urls= ['http://headlines.yahoo.co.jp/rss/all-bus.xml','http://headlines.yahoo.co.jp/rss/all-c_int.xml']
#urls.each { |url|
url = cgi['uri']
uri = URI.parse(url)
rss = RSS::Parser.parse(uri.read)
puts "<h1>Host:" + rss.channel.title + "</h1>"
#rss.items.each_with_index { |item , i|
rss.items.each_with_index do | item,i | 
puts "<h2><a href = \" #{item.link}\"> #{i+1}. #{item.title} </a></h2>"
end 
#puts "#{i+1}.#{item.title}"
#puts "#{item.link}"
#puts "#{item.description}"
#}
#}
