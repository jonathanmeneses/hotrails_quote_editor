class LineItemDatesController < ApplicationController
  before_action :set_quote
  before_action :set_line_item_date, only: [:edit, :update, :destroy]

  def new
    @line_item_date = @quote.line_item_dates.build
  end

  def create
    @line_item_date = @quote.line_item_dates.build(line_item_date_params)

    if(@line_item_date.save)
      respond_to do |format|
        format.html {redirect_to quote_path(@quote), notice: "Date saved successfully." }
        format.turbo_stream {
          flash.now[:notice] = "Date saved successfully"
          puts "flashing to turbo stream!"
        }
      end

    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit

  end

  def destroy

    @line_item_date.destroy
    respond_to do |format|
      format.html {redirect_to quote_path(@quote), notice: "Date deleted successfully."}
      format.turbo_stream {flash.now[:notice] = "Date deleted successfully."}
    end

  end

  def update
    if @line_item_date.update(line_item_date_params)

      respond_to do |format|
        format.html { redirect_to quote_path(@quote), notice: "Data succesfully updated"}
        format.turbo_stream { flash.now[:notice] = "Date successfully updated"}
      end

    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def set_quote
    @quote = current_company.quotes.find(params[:quote_id])
  end

  def set_line_item_date
    @line_item_date = @quote.line_item_dates.find(params[:id])
  end

  def line_item_date_params
    params.require(:line_item_date).permit(:date)
  end
end
