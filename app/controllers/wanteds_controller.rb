class WantedsController < ApplicationController
  before_action :set_wanted, only: [:show, :edit, :update, :destroy]

  # GET /wanteds
  # GET /wanteds.json
  def index
    @q        = Wanted.includes(:credit).where(credits: {id: nil}).search(params[:q])
    @q.sorts = 'folder_name asc' if @q.sorts.empty?
    @wanteds = @q.result.page(params[:page])
  end

  # GET /wanteds/1/edit
  def edit
  end


  # PATCH/PUT /wanteds/1
  # PATCH/PUT /wanteds/1.json
  def update
    respond_to do |format|
      if @wanted.update(wanted_params)
        format.html { redirect_to @wanted, notice: 'Wanted was successfully updated.' }
        format.json { render :show, status: :ok, location: @wanted }
      else
        format.html { render :edit }
        format.json { render json: @wanted.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_wanted
      @wanted = Wanted.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def wanted_params
      params.require(:wanted).permit(:file_name, :folder_name, :extension, :lock_version)
    end
end
