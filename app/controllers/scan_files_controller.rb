class ScanFilesController < ApplicationController
  before_action :set_scan_file, only: [:show, :edit, :update, :destroy]

  # GET /scan_files
  # GET /scan_files.json
  def index
    @scan_files = ScanFile.all
  end

  # GET /scan_files/1
  # GET /scan_files/1.json
  def show
  end

  # GET /scan_files/new
  def new
    @scan_file = ScanFile.new
  end

  # GET /scan_files/1/edit
  def edit
  end

  # POST /scan_files
  # POST /scan_files.json
  def create
    @scan_file = ScanFile.new(scan_file_params)

    respond_to do |format|
      if @scan_file.save
        scanr = ScanrCustom.new 'YOUR_TOKEN', 'eng'
        @scan_file.result = scanr.ocr @scan_file.avatar.path.to_s
        if @scan_file.save
          format.html { redirect_to @scan_file, notice: 'Scan file was successfully created.' }
          format.json { render :show, status: :created, location: @scan_file }
        else
          format.html { render :new }
          format.json { render json: @scan_file.errors, status: :unprocessable_entity }
        end
      else
        format.html { render :new }
        format.json { render json: @scan_file.errors, status: :unprocessable_entity }
      end
    end
  end

  class ScanrCustom

    def initialize(token, lang = 'eng')
      @token = token
      @lang = lang
    end

    def ocr(path)
      @url = "https://api.scanr.xyz/ocr?token=#{@token}&lang=#{@lang}"
      params = {}
      if path.start_with?('http')
        params[:url] = path
      else
        params[:file] = File.new(path, 'rb')
      end
      JSON.parse RestClient.post(@url, params)
    end
  end

  # PATCH/PUT /scan_files/1
  # PATCH/PUT /scan_files/1.json
  def update
    respond_to do |format|
      if @scan_file.update(scan_file_params)
        format.html { redirect_to @scan_file, notice: 'Scan file was successfully updated.' }
        format.json { render :show, status: :ok, location: @scan_file }
      else
        format.html { render :edit }
        format.json { render json: @scan_file.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /scan_files/1
  # DELETE /scan_files/1.json
  def destroy
    @scan_file.destroy
    respond_to do |format|
      format.html { redirect_to scan_files_url, notice: 'Scan file was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_scan_file
      @scan_file = ScanFile.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def scan_file_params
      params.require(:scan_file).permit(:result, :avatar)
    end
end
