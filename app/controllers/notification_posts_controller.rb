class NotificationPostsController < ApplicationController
  before_action :set_notification_post, only: [:show, :edit, :update, :destroy]

  # GET /notification_posts
  # GET /notification_posts.json
  def index
    @notification_posts = NotificationPost.all.page params[:page]
    @notification_post = NotificationPost.new 
     @notification_post.user_id = current_administrator.id if current_administrator
     @notification_post.user_id = current_user.id if current_user
  end

  # GET /notification_posts/1
  # GET /notification_posts/1.json
  def show
  end

  # GET /notification_posts/new
  def new
    @notification_post = NotificationPost.new 
     @notification_post.user_id = current_administrator.id if current_administrator
     @notification_post.user_id = current_user.id if current_user
  end

  # GET /notification_posts/1/edit
  def edit
  end

  # POST /notification_posts
  # POST /notification_posts.json
  def create
    @notification_post = NotificationPost.new(notification_post_params)

    respond_to do |format|
      if @notification_post.save
        format.html { redirect_to @notification_post, notice: 'Se ha publicado exitosamente tu notificación' }
        format.json { render :show, status: :created, location: @notification_post }
      else
        format.html { render :new }
        format.json { render json: @notification_post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /notification_posts/1
  # PATCH/PUT /notification_posts/1.json
  def update
    respond_to do |format|
      if @notification_post.update(notification_post_params)
        format.html { redirect_to @notification_post, notice: 'Notification post was successfully updated.' }
        format.json { render :show, status: :ok, location: @notification_post }
      else
        format.html { render :edit }
        format.json { render json: @notification_post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /notification_posts/1
  # DELETE /notification_posts/1.json
  def destroy
    @notification_post.destroy
    respond_to do |format|
      format.html { redirect_to notification_posts_url, notice: 'Notification post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_notification_post
      @notification_post = NotificationPost.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def notification_post_params
      params.require(:notification_post).permit(:name, :body, :user_id)
    end
end
