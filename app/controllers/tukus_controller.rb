class TukusController < ApplicationController
  before_action :set_tuku, only: [:show, :edit, :update, :destroy]

  # GET /tukus
  # GET /tukus.json
  def index
    @tukus = Tuku.all
  end

  # GET /tukus/1
  # GET /tukus/1.json
  def show
  end

  # GET /tukus/new
  def new
    @tuku = Tuku.new
  end

  # GET /tukus/1/edit
  def edit
  end

  # POST /tukus
  # POST /tukus.json
  def create
    @tuku = Tuku.new(tuku_params)

    respond_to do |format|
      if @tuku.save
        format.html { redirect_to @tuku, notice: 'Tuku was successfully created.' }
        format.json { render :show, status: :created, location: @tuku }
      else
        format.html { render :new }
        format.json { render json: @tuku.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tukus/1
  # PATCH/PUT /tukus/1.json
  def update
    respond_to do |format|
      if @tuku.update(tuku_params)
        format.html { redirect_to @tuku, notice: 'Tuku was successfully updated.' }
        format.json { render :show, status: :ok, location: @tuku }
      else
        format.html { render :edit }
        format.json { render json: @tuku.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tukus/1
  # DELETE /tukus/1.json
  def destroy
    @tuku.destroy
    respond_to do |format|
      format.html { redirect_to tukus_url, notice: 'Tuku was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tuku
      @tuku = Tuku.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tuku_params
      params.require(:tuku).permit(:avatar)
    end
end
