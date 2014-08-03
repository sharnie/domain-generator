class HomeController < ApplicationController
  get '/' do
    @domains = generator(keyword: params[:keyword].to_s, result: 100, word_length: 4)
    erb :"home/index"
  end

  def generator result: 30, word_length: nil, keyword: "", tld: "com"
    list = []
    (1..result.to_i).each do |n|
      domain =  ""
      domain += RandomWordGenerator.word if word_length.nil?
      domain += RandomWordGenerator.of_length(word_length) unless word_length.nil?
      domain += keyword
      domain += "."
      domain += tld
      list   << domain
    end
    list.uniq!
  end
end