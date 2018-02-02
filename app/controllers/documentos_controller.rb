class DocumentosController < ApplicationController
  require 'csv'    
  before_action :set_documento, only: [:show, :edit, :update, :destroy]

  # GET /documentos
  # GET /documentos.json
  def index
    @total = params[:total]
    @documentos = Documento.all
  end

  # GET /documentos/1
  # GET /documentos/1.json
  def show
  end

  # GET /documentos/new
  def new
    @documento = Documento.new
  end

  # GET /documentos/1/edit
  def edit
  end

  # POST /documentos
  # POST /documentos.json
  def create
    @documento = Documento.new(documento_params)
    respond_to do |format|
      if @documento.save
        csv_text = File.read(@documento.file.path, )
        csv = CSV.parse(csv_text, :headers => false, :col_sep => "\t")
        linhas = csv[1..csv.count]
        @total = 0.0
        linhas.each do |row|
          store = Store.new(purchaser_name: row[0],item_description: row[1],item_price: row[2],purchase_count: row[3],merchant_address: row[4],merchant_name: row[5])  
          store.save
          @total = @total+row[2].to_f
        end
        @documento.update(total: @total)
        format.html { redirect_to documentos_path, notice: 'Documento was successfully created.' }
        format.json { render :show, status: :created, location: @documento }
      else
        format.html { render :new }
        format.json { render json: @documento.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /documentos/1
  # PATCH/PUT /documentos/1.json
  def update
    respond_to do |format|
        if @documento.update(documento_params)
        csv_text = File.read(@documento.file.path, )
        csv = CSV.parse(csv_text, :headers => false, :col_sep => "\t")
        linhas = csv[1..csv.count]
        @total = 0.0
        linhas.each do |row|
          @total = @total+row[2].to_f
        end
        @documento.update(total: @total)
        format.html { redirect_to documentos_path, notice: 'Documento was successfully updated.' }
        format.json { render :show, status: :ok, location: @documento }
      else
        format.html { render :edit }
        format.json { render json: @documento.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /documentos/1
  # DELETE /documentos/1.json
  def destroy
    @documento.destroy
    respond_to do |format|
      format.html { redirect_to documentos_url, notice: 'Documento was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_documento
      @documento = Documento.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def documento_params
      params.require(:documento).permit(:file, :total)
    end
end
