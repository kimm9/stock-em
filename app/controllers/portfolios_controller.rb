class PortfoliosController < ApplicationController



  before_action :authenticate_user!

  def index
    @message = "This is a list of all portfolios."
    @user = current_user
    @portfolios = @user.portfolios


  end

  def new
    @message = "This is the new portfolio form."

  end


  def create

    puts "port created", params.inspect

    @new_portfolio = Portfolio.create(
    title: params[:portfolio][:title],
    user_id: params[:portfolio][:user_id]
    )

    @new_portfolio.user = User.find(current_user.id)



    if @new_portfolio
      redirect_to current_user
    else
      render 'new'
    end
  end

  def show
    @message = "Show me the info for a single portfolio."
    @portfolio = Portfolio.find(params[:id])
    @feeds = Feed.all.limit(12).order('published_at desc')
    @stocks_arr = @portfolio.stocks
    i = 0
    @called_stocks_arr = []
    @stocks_arr.each do |stock|
      @called_stocks_arr.push(instance_variable_set("@stock_#{i += 1}", StockQuote::Stock.quote(stock.ticker)))
    end


    @called_feeds_arr = []

    @stocks_arr.first(3).each do |stock|
      @called_feeds_arr.push(instance_variable_set("@feed_#{i += 1}", Feedjira::Feed.fetch_and_parse("http://finance.yahoo.com/rss/headline?s=#{stock.ticker}")))
    end


    @called_feeds_arr.each do |entry|
      @new_entries = entry.entries
    end








    puts @called_feeds_arr.inspect


  end

  def edit
    @portfolio = Portfolio.find(params[:id])
    @message = "This is the edit portfolio form for #{@portfolio.title}."
    @stocks_arr = stock.all
  end





end
