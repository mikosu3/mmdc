class AuthorsController < ApplicationController
  before_action :set_author, only: [:show, :edit, :update, :destroy]

  # GET /authors
  # GET /authors.json
  def index
    @q        = Author.search(params[:q])
    @q.sorts = 'name asc' if @q.sorts.empty?
    @authors = @q.result.page(params[:page])
  end

  # GET /authors/new
  def new
    @author = Author.new
  end

  # GET /authors/1/edit
  def edit
  end

  # POST /authors
  # POST /authors.json
  def create
    @author = Author.new(author_params)

    respond_to do |format|

      @author.updated_by = get_user_id

      if @author.save
        format.html { redirect_to authors_url, notice: '作者情報を登録しました。' }
        format.json { render :index, status: :created, location: @author }
      else
        format.html { render :new }
        format.json { render json: @author.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /authors/1
  # PATCH/PUT /authors/1.json
  def update
    respond_to do |format|

      @author.updated_by = get_user_id

      if @author.update(author_params)
        format.html { redirect_to authors_url, notice: '作者情報を更新しました。' }
        format.json { render :show, status: :ok, location: @author }
      else
        format.html { render :edit }
        format.json { render json: @author.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_author
      @author = Author.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def author_params
      params.require(:author).permit(:credit_id, :name, :url, :twitter, :pixiv, :email, :lock_version, :nico, :disp_name)
    end
end
