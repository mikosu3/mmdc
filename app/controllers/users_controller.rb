class UsersController < ApplicationController
  before_filter :check_admin
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
    @q        = User.search(params[:q])
    @q.sorts = 'id asc' if @q.sorts.empty?
    @users = @q.result.page(params[:page])
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/1/edit
  def edit
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to users_path, notice: 'ユーザー情報を更新しました。' }
        format.json { render :index, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.is_ban = true
    @user.save
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'ユーザーをバンしました。' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:id, :uid, :screen_name,:is_ban, :is_admin, :name)
    end
end
