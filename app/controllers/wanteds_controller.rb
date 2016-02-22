class WantedsController < ApplicationController
  before_action :set_wanted, only: [:show, :edit, :update, :destroy]

  # GET /wanteds
  # GET /wanteds.json
  def index
    @wanteds = Wanted.all
  end

  # GET /wanteds/1
  # GET /wanteds/1.json
  def show
  end

  # GET /wanteds/new
  def new
    @wanted = Wanted.new
  end

  # GET /wanteds/1/edit
  def edit
  end

  # POST /wanteds
  # POST /wanteds.json
  def create
    @wanted = Wanted.new(wanted_params)

    respond_to do |format|
      if @wanted.save
        format.html { redirect_to @wanted, notice: 'Wanted was successfully created.' }
        format.json { render :show, status: :created, location: @wanted }
      else
        format.html { render :new }
        format.json { render json: @wanted.errors, status: :unprocessable_entity }
      end
    end
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

  # DELETE /wanteds/1
  # DELETE /wanteds/1.json
  def destroy
    @wanted.destroy
    respond_to do |format|
      format.html { redirect_to wanteds_url, notice: 'Wanted was successfully destroyed.' }
      format.json { head :no_content }
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
