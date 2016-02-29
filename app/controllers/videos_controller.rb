class VideosController < ApplicationController
  before_action :set_video, only: [:show, :edit, :update, :destroy]

  # GET /videos
  # GET /videos.json
  def index
    @videos = Video.where(user_id: get_user_id, is_show: true).order(id: :desc).page(params[:page])

    # 子データの集計を行う
    @videos.each do | video |
      Video.set_total video
    end
  end

  # GET /videos/1
  # GET /videos/1.json
  def show
  end

  # GET /videos/new
  def new
    @video = Video.new
  end

  # GET /videos/1/edit
  def edit
  end

  # POST /videos
  # POST /videos.json
  def create

    #動画基本情報
    @video = Video.new(video_params)
    @video.user_id = get_user_id

    upload_file = params[:file]

    respond_to do |format|
      if @video.save

        EmmRegistService.save(upload_file, @video)

        format.html { redirect_to videos_url, notice: '動画情報を登録しました。' }
        format.json { render :show, status: :created, location: @video }
      else
        format.html { render :new }
        format.json { render json: @video.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /videos/1
  # PATCH/PUT /videos/1.json
  def update
    respond_to do |format|
      if @video.update(video_params)
        format.html { redirect_to @video, notice: 'Video was successfully updated.' }
        format.json { render :show, status: :ok, location: @video }
      else
        format.html { render :edit }
        format.json { render json: @video.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /videos/1
  # DELETE /videos/1.json
  def destroy

    #論理削除
    @video.is_show = false
    @video.save
    respond_to do |format|
      format.html { redirect_to videos_url, notice: '動画情報を削除しました' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_video
      @video = Video.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def video_params
      params.require(:video).permit(:name)
    end
end
