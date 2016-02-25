class CreditsController < ApplicationController
  before_action :set_credit, only: [:show, :edit, :update, :destroy]
  autocomplete :author, :name, :full => true

  # GET /credits
  # GET /credits.json
  def index
    @credits = Credit.all.page(params[:page])
  end

  # GET /credits/1
  # GET /credits/1.json
  def show
  end

  # GET /credits/new
  def new
    @credit = Credit.new
    @wanted = Wanted.find(params[:wanted_id])
  end

  # GET /credits/1/edit
  def edit
    @wanted = Wanted.find(@credit.wanted)
    @credit.author_name = @credit.author.name
  end

  # POST /credits
  # POST /credits.json
  def create
    @credit = Credit.new(credit_params)

    @credit.screen_name = get_screen_name
    @credit.user_id = get_user_id

    respond_to do |format|
      if @credit.save
        format.html { redirect_to credits_path, notice: 'クレジット情報を登録しました。' }
        format.json { render :index, status: :created, location: @credit }
      else
        @wanted = Wanted.find(@credit.wanted_id)
        format.html { render :new }
        format.json { render json: @credit.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /credits/1
  # PATCH/PUT /credits/1.json
  def update

    respond_to do |format|
      if @credit.update(credit_params)
        format.html { redirect_to credits_path, notice: 'クレジット情報を更新しました。' }
        format.json { render :show, status: :ok, location: @credit }
      else
        @wanted = Wanted.find(@credit.wanted_id)
        format.html { render :edit }
        format.json { render json: @credit.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /credits/1
  # DELETE /credits/1.json
  def destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_credit
      @credit = Credit.find(params[:id])
      @credit.screen_name = get_screen_name
      @credit.user_id = get_user_id
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def credit_params
      params.require(:credit).permit(:id, :wanted_id, :name, :author_name, :distribution, :url)
    end
end
