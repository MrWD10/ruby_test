class PortfoliosController < ApplicationController
  before_action :set_post, only: %i[ show edit update destroy ]


  layout "portfolio"
    def index
     # authorize @portfolio_item

      @portfolio_items=Portfolio.all
        #@portfolio_items = policy_scope(Portfolio).order(created_at: :desc)

    end

    def angular
      @angular_portfolio_items = Portfolio.angular
    end

    def new
        @portfolio_item = Portfolio.new
        3.times {@portfolio_item.technalogies.build}
    end

    def create
       # @portfolio_item = Portfolio.new(portfolio_params)
        
        respond_to do |format|
          if @portfolio_item.save
            current_user.add_role :creator, @portfolio_item

            format.html { redirect_to portfolios_path, notice: "Portfolio item was successfully created." }
          else
            format.html { render :new, status: :unprocessable_entity }
          end
        
    end
  end
    def edit
       # @portfolio_item = Portfolio.find(params[:id]) 
    end

    def update
       # @portfolio_item = Portfolio.find(params[:id]) 
        respond_to do |format|
          if @portfolio_item.update(portfolio_params)
            current_user.add_role :editor, @portfolio_item

            format.html { redirect_to portfolios_path, notice: "Portfolio item was successfully updated." }
          else
            format.html { render :edit, status: :unprocessable_entity }
          end
        end
    end
    
    def show
       # @portfolio_item = Portfolio.find(params[:id]) 
    end

    def destroy
       # @portfolio_item = Portfolio.find(params[:id]) 

        @portfolio_item.destroy
        current_user.add_role :destroyer, @portfolio_item

        respond_to do |format|
          format.html { redirect_to portfolios_url, notice: "Portfolio item was successfully deleted." }
        end
      end

      private
    def set_post
      @portfolio_item = Portfolio.find(params[:id])
    end

def portfolio_params
  params.require(:portfolio).permit(:title, :subtitle,
   :body, technalogies_attributes: [:name])

  end

end
