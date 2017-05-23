class ReceiptsController < ApplicationController
  before_action :set_receipt, only: [:show, :edit, :update, :destroy]
  before_action :require_logged_in

  # GET /receipts
  # GET /receipts.json
  def index
    @receipts = Receipt.all
    respond_to do |format|
      format.html
      format.pdf do
        render :pdf => "receipts.pdf",:template => "receipts/index.html.erb"   # Excluding ".pdf" extension.
      end
    end
  end

  # GET /receipts/1
  # GET /receipts/1.json
  def show
  end

  # GET /receipts/new
  def new
    @receipt = Receipt.new
    @expense_category = ExpenseCategory.find(params[:expense_category_id])
  end

  # GET /receipts/1/edit
  def edit
    @expense_category = ExpenseCategory.find(params[:expense_category_id  ])


  end

  # POST /receipts
  # POST /receipts.json
  def create
    @expense_category = ExpenseCategory.find(params[:expense_category_id  ])

    @receipt = Receipt.new(receipt_params)
    @receipt.userid = current_user.username
    @receipt.expense_category = @expense_category


    respond_to do |format|
      if @receipt.save
        OcrTextJob.new(@receipt.id, @receipt.picture.url(:original)).enqueue
        Receipt.reindex!
        format.html { redirect_to @receipt.expense_category, notice: 'Thanks for uploading!' }
        format.json { render :show, status: :created, location: @receipt }
      else
        format.html { render :new }
        format.json { render json: @receipt.errors, status: :unprocessable_entity }
      end
    end
  end
  # PATCH/PUT /receipts/1
  # PATCH/PUT /receipts/1.json
  def update


    respond_to do |format|
      if @receipt.update(receipt_params)
        format.html { redirect_to @receipt.expense_category, notice: 'Receipt was successfully updated.' }
        format.json { render :show, status: :ok, location: @receipt }
        Receipt.reindex!
      else
        format.html { render :edit }
        format.json { render json: @receipt.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /receipts/1
  # DELETE /receipts/1.json
  def destroy
    @receipt.destroy
    respond_to do |format|
      format.html { redirect_to @receipt.expense_category, notice: 'Receipt was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_receipt
    @receipt = Receipt.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def receipt_params
    params.require(:receipt).permit(:picture, :expense_category_id, :total, :comments, :address, :store_name)

  end
end
