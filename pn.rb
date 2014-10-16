#!/usr/bin/env ruby
# -*- coding: utf-8 -*-

# 入力した文章から感情を読み取る
# $Id:$

require "tempfile"

class PN
  
  def PN.process(args, default_io)
    pn = PN.new()
    pn.analyze
  end
  
  # SETTINGS
  def initialize()
    @chasen = 'chasen'
    #    @chasen_option = %q(-j -F "%H:%M\n")
    @chasen_option = %q(-j -r /usr/local/share/chasen/dic/ipadic/chasenrc -F "%H:%M\n")
    @dic = Hash.new
    # http://www.lr.pi.titech.ac.jp/~takamura/pndic_ja.html
    load_dic("pn_ja.txt")
  end
  
  def load_dic(filename)
    open(filename){|file|
      while line = file.gets
	line.strip!
        # 見出し語:読み:品詞:感情極性実数値
        (word, yomi, part, value) = line.split(":")
        @dic[word] = value
      end
    }
    #    @dic.each_pair{|key, value|
    #      puts "#{key}:#{value}"
    #    }
  end
  
  # analyze
  def analyze(src)
    src = "私は良かったです。"
    analyze_qn_core(src)
  end
  
  def analyze_qn_core(src)
    temp = Tempfile.new("temp")
    temp.puts src
    temp.close
    tempfilename = temp.path
    
    wc = 0.0
    score = 0.0
    
    open("| cat #{tempfilename} | \
    #{@chasen} #{@chasen_option}", "r"){|file|
      while line = file.gets
        line.strip!
	(part, word) = line.split(":")
        if @dic.key?(word) then 
          p @dic[word].to_f
          score = score + @dic[word].to_f
          p word
          wc = wc + 1
        end
      end
    }
    score = score / wc if wc != 0
    #    p score
    return score
  end
  
end

if $0 == __FILE__
  PN.process(ARGV, STDIN)
end
