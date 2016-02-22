class EmmsController < ApplicationController
  before_action :set_emm, only: [:show, :edit, :update, :destroy]

  # GET /emms
  # GET /emms.json
  def index
    @emms = Emm.all
  end

  # GET /emms/1
  # GET /emms/1.json
  def show
  end

  # GET /emms/new
  def new
    @emm = Emm.new
  end

  # GET /emms/1/edit
  def edit
  end

  # POST /emms
  # POST /emms.json
  def create

    @emm = Emm.new(emm_params)
    upload_file = params[:file]

    respond_to do |format|
      if EmmRegistService.save(upload_file, emm_params, getUserId)
        format.html { redirect_to emms_url, notice: 'Emm情報を登録しました。' }
        format.json { render :show, status: :created, location: @emm }
      else
        format.html { render :new }
        format.json { render json: @emm.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /emms/1
  # PATCH/PUT /emms/1.json
  def update
    respond_to do |format|
      if @emm.update(emm_params)
        format.html { redirect_to @emm, notice: 'Emm was successfully updated.' }
        format.json { render :show, status: :ok, location: @emm }
      else
        format.html { render :edit }
        format.json { render json: @emm.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /emms/1
  # DELETE /emms/1.json
  def destroy
    @emm.destroy
    respond_to do |format|
      format.html { redirect_to emms_url, notice: 'Emm was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_emm
      @emm = Emm.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def emm_params
      params.require(:emm).permit(:video_name)
    end
end
