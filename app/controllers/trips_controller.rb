class TripsController < ApplicationController
  before_action :check_for_lockup
  # http_basic_authenticate_with :name => "german", :password => "4wpeumayen", only: :index
  before_action :authenticate_user!, only: [:show, :edit, :update, :destroy]
  before_action :set_trip, only: [:show, :edit, :update, :destroy]

  # GET /trips
  # GET /trips.json
  def index
    @trips = Trip.all
    @trips = Trip.joins(:locations).where('locations.id = ?', params[:location_id]) if params[:location_id]
  end

  def article
    if params[:trip_id]
      @trip = Trip.where(:trip_id => params[:trip_id])
    elsif
      @trips = Trip.all
    end
  end


  def search
    @trips = Trip.where('name like  ?', "#{params[:name]}%") if params[:name]
    #aca esto guarda el nombre guardado de la ultima busqueda
    @name = params[:name] if params[:name]
    render partial: 'trips/list'
  end
  # GET /trips/1
  # GET /trips/1.json
  def show
  end

  # GET /trips/new
  def new
    @trip = Trip.new
  end

  # GET /trips/1/edit
  def edit
  end

  # POST /trips
  # POST /trips.json
  def create
    @trip = Trip.new(trip_params)

    respond_to do |format|
      if @trip.save
        format.html { redirect_to @trip, notice: 'Trip was successfully created.' }
        format.json { render :show, status: :created, location: @trip }
      else
        format.html { render :new }
        format.json { render json: @trip.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /trips/1
  # PATCH/PUT /trips/1.json
  def update
    respond_to do |format|
      if @trip.update(trip_params)
        format.html { redirect_to @trip, notice: 'Trip was successfully updated.' }
        format.json { render :show, status: :ok, location: @trip }
      else
        format.html { render :edit }
        format.json { render json: @trip.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /trips/1
  # DELETE /trips/1.json
  def destroy
    @trip.destroy
    respond_to do |format|
      format.html { redirect_to trips_url, notice: 'Trip was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_trip
      @trip = Trip.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def trip_params
      params.require(:trip).permit(:image, :name, :summary)
    end
end
