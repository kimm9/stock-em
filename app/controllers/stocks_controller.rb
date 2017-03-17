class StocksController < ApplicationController
  before_action :authenticate_user!

  def update
    stock = Stock.find_by(params[:id])
    stock.company_name = params[:company_name]
    stock.ticker = params[:ticker]
  	stock.quote = params[:quote]
  	stock.price_change = params[:price_change]
  	stock.percentage_change = params[:percentage_change]
    stock.save
    redirect_to root_url
  end

  def edit
    @stock = Stock.find_by(params[:id])
  end

  def new
	 @stock = Stock.new
  end

  def create

    puts "stock created", params.inspect

    @new_stock = Stock.create(
    company_name: params[:stock][:company_name],
    ticker: params[:stock][:ticker]

    )

    puts "newstock", @new_stock

  	@portfolio = Portfolio.find(params[:stock][:portfolios])
  	@portfolio.stocks << @new_stock

    if @new_stock
      redirect_to "/portfolios/#{@portfolio.id}"
    else
      render 'new'
    end
  end

  def index
    @user = current_user
    @portfolios = @user.portfolios

  end

  def show
    @stock = Stock.find(params[:id])
    @symbol = @stock.ticker

    @called_stock = StockQuote::Stock.quote(@symbol)
  end


  def destroy
    puts 'hello fizal'
    @portStock = Stock.find(params[:id])
    @portfolio = Portfolio.find(params[:stock][:port_id])
    @portStock.destroy
    redirect_to "/portfolios/" + @portfolio.id.to_s
  end

end
