class QiandaosController < ApplicationController
  before_action :set_qiandao, only: [:show, :edit, :update, :destroy]

  # GET /qiandaos
  # GET /qiandaos.json
  def index
    @qiandaos = Qiandao.all
  end

  # GET /qiandaos/1
  # GET /qiandaos/1.json
  def show
  end

  # GET /qiandaos/new
  def new
    @qiandao = Qiandao.new
  end

  # GET /qiandaos/1/edit
  def edit
  end

  # POST /qiandaos
  # POST /qiandaos.json
  def create
    @qiandao = Qiandao.new(qiandao_params)

    respond_to do |format|
      if @qiandao.save
        format.html { redirect_to @qiandao, notice: 'Qiandao was successfully created.' }
        format.json { render :show, status: :created, location: @qiandao }
      else
        format.html { render :new }
        format.json { render json: @qiandao.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /qiandaos/1
  # PATCH/PUT /qiandaos/1.json
  def update
    respond_to do |format|
      if @qiandao.update(qiandao_params)
        format.html { redirect_to @qiandao, notice: 'Qiandao was successfully updated.' }
        format.json { render :show, status: :ok, location: @qiandao }
      else
        format.html { render :edit }
        format.json { render json: @qiandao.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /qiandaos/1
  # DELETE /qiandaos/1.json
  def destroy
    @qiandao.destroy
    respond_to do |format|
      format.html { redirect_to qiandaos_url, notice: 'Qiandao was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_qiandao
      @qiandao = Qiandao.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def qiandao_params
      params.fetch(:qiandao, {})
    end
end
