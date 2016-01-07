class ConcertsController < ApplicationController

  def index
    #today`s concert
    @today_concert = Concert.today_concert
    #later this month
    @month_concerts = Concert.month_concerts
  end

  def show
    @concert = Concert.find(params[:id])
    # @comment = Comment.new
  end

  def new
    @concert = Concert.new
  end

  def create
    @concert = Concert.new(strong_params)
    if @concert.save
      flash[:notice] = 'Concert created successfully!'
      redirect_to action: 'index', controller: 'concerts' #redirije a esa accion sin llevarse
      #nada de info desde aqui, no nos llevamos las variables iniciadas aqui como @concert 
      # !!! a no ser que nos lo llevemos como parametro al final del redirect
      # redirect_to action: 'show', controller: 'concert', id: @concert
    else
      flash[:alert] = 'Concert creation failed!'
      render 'new' # render se lleva la info definida en este metodo, por eso vuelven 
      # a aparecer los campo alli, nos llevarimaos @concert = Concert.new(strong_params)
    end
  end

  private
    def strong_params
      params.require(:concert).permit(:band, :venue, :city, :date, :price, :description)
    end

end





