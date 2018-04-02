class QuotesController < ApplicationController


  def search_form_yahoo_yql
  # display form for searching omdb db
  end

  def index
    @message = "yahoo yql"

    @company_ticker = params["get_quote"]

    @response = HTTParty.get("https://query.yahooapis.com/v1/public/yql?q=select%20*%20from%20yahoo.finance.quotes%20where%20symbol%20in%20(%22#{@company_ticker}%22)&format=json&env=store%3A%2F%2Fdatatables.org%2Falltableswithkeys&callback=")
    puts @response
    @user = current_user
    @portfolios = @user.portfolios
    @symbol = @response['query']['results']["quote"]['symbol']
    @company_name = @response['query']['results']["quote"]['Name']
    @stock = StockQuote::Stock.quote(@symbol)
  end


end
