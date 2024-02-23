class ParagraphsController < ApplicationController
  before_action :set_paragraph, only: %i[ show edit update destroy ]
  before_action :is_writer, only: %i[index show edit update destroy]

  # GET /paragraphs or /paragraphs.json
  def index
    @paragraphs = current_user.paragraphs
    @paragraph = Paragraph.new

  end

  # GET /paragraphs/1 or /paragraphs/1.json
  def show
  end

  # GET /paragraphs/new
  def new
    @paragraph = Paragraph.new
  end

  # GET /paragraphs/1/edit
  def edit
  end

  # POST /paragraphs or /paragraphs.json
  def create
    @paragraph = Paragraph.new((paragraph_params))
    @paragraph.writer_id = current_user.id
    respond_to do |format|
      if @paragraph.save
        format.html { redirect_to paragraphs_path, notice: "تم إنشاء الفقرة" }
        format.json { render :show, status: :created, location: @paragraph }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @paragraph.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /paragraphs/1 or /paragraphs/1.json
  def update
    respond_to do |format|
      if @paragraph.update(paragraph_params)
        format.html { redirect_to paragraph_url(@paragraph), notice: "Paragraph was successfully updated." }
        format.json { render :show, status: :ok, location: @paragraph }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @paragraph.errors, status: :unprocessable_entity }
      end
    end
  end

  def writers_paragraphs
    @followed_list = Follower.where(follower_id: current_user.id).pluck(:followed_id).join(',')
    @paragraphs = Paragraph.find_by_sql(
    "SELECT paragraphs.*, users.username,
    COALESCE(followers.id, 0) AS followed
    FROM paragraphs
    JOIN users ON paragraphs.writer_id = users.id
    LEFT JOIN followers ON paragraphs.writer_id = followers.followed_id AND followers.follower_id = #{current_user.id}
    WHERE paragraphs.writer_id != #{current_user.id}
    ORDER BY created_at DESC"
)
  end
  def followed_writers_paragraphs
    @followed_list = Follower.where(follower_id: current_user.id).pluck(:followed_id).join(',')
    if @followed_list.blank?
      @followed_list = []
    else
      @paragraphs = Paragraph.find_by_sql(
      "SELECT paragraphs.*, users.username,
      COALESCE(followers.id, 0) AS followed
      FROM paragraphs
      JOIN users ON paragraphs.writer_id = users.id
      LEFT JOIN followers ON paragraphs.writer_id = followers.followed_id AND followers.follower_id = #{current_user.id}
      WHERE paragraphs.writer_id != #{current_user.id}
      and followers.followed_id IN (#{@followed_list})
      ORDER BY created_at DESC"
  )
    end
  end

  def follow
    @follow = Follower.new(:followed_id => params[:id], :follower_id => current_user.id)
    @follow.save
    redirect_to writers_paragraphs_path
  end

  def unfollow
    @follow = Follower.find(params[:id]).destroy
    redirect_to writers_paragraphs_path

  end
  # DELETE /paragraphs/1 or /paragraphs/1.json
  def destroy
    @paragraph.destroy

    respond_to do |format|
      format.html { redirect_to paragraphs_url, notice: "تم حذف الفقرة" }
      format.json { head :no_content }
    end
  end

  private
    def is_writer
      if !current_user.writer?
        redirect_to root_path, alert: "لست كاتبا لست مخولا لهذه العملية"
      end
    end
    def set_paragraph
      @paragraph = Paragraph.find(params[:id])
    end

    def paragraph_params
      params.require(:paragraph).permit(:content, :content_type)
    end
end
