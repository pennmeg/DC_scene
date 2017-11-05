class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # include Google_places

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  def home
  end
  # GET /users/1
  def show
    puts "@user: #{@user.inspect}"
    @photo = @user.photo
    puts "@photo: #{@photo.inspect}"
    @hobby = @user.hobby
    puts "@hobby: #{@hobby.inspect}"
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit

  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  # ======= local_places_json =======
  def local_places_json
    puts "\n******* local_places_json *******"
    puts "params #{params.inspect}"
    search_places = build_query_string(params[:neighborhood], params[:type])
    json_data = Google_places.places_api_response(search_places)
    # @place_data_array << json_data['results']
    @place_data_array = json_data['results']
    puts "@place_data_array[0]: #{@place_data_array[0].inspect}"

    respond_to do |format|
        format.json {
          render json: {:place_data_array => @place_data_array}
        }
    end

  end

  # ======= get_lat_lon =======
  def get_places_data
    puts "\n******* get_places_data *******"
  end

  # ======= search_local_places =======
  def search_local_places
      puts "\n******* search_local_places *******"
  end

  # ======= show_local_places =======
  def show_local_places
      puts "\n******* show_local_places *******"
      puts "params: #{params.inspect}"

      # lat_lon = get_lat_lon(params[:neighborhood])
      # puts "lat_lon: #{lat_lon.inspect}"
      # @place_data_array = [lat_lon]

      search_places = build_query_string(params[:neighborhood])
      json_data = Google_places.places_api_response(search_places)
      @place_data_array = json_data['results']
      puts "@place_data_array[0]: #{@place_data_array[0].inspect}"

      respond_to do |format|
          format.js { render :show_local_places }
      end

  end

  # ======= build_query_string =======
  def build_query_string(neighborhood, type)
      puts "\n******* build_query_string *******"
      # == search for food locations within 500' of nycda
      location = get_lat_lon(neighborhood)
      radius = "500"
      key = GOOGLE_PLACES_KEY

      search_places = "location=" + location
      search_places += "&radius=" + radius
      search_places += "&types=" + type
      search_places += "&key=" + key
      return search_places
  end

  # ======= get_lat_lon =======
  def get_lat_lon(neighborhood)
      puts "\n******* get_lat_lon *******"
      if neighborhood == "Adams Morgan"
          loc = { latitude: 38.921242, longitude: -77.043493}
      elsif neighborhood == "American University Park"
          loc = { latitude: 38.945505, longitude: -77.088103}
      elsif neighborhood == "Anacostia"
          loc = { latitude: 38.863055, longitude: -76.983028}
      elsif neighborhood == "Benning Heights"
          loc = { latitude: 38.881779, longitude: -76.936085}
      elsif neighborhood == "Brentwood"
          loc = { latitude: 38.919090, longitude: -76.990228}
      elsif neighborhood == "Brightwood"
          loc = { latitude: 38.966147, longitude: -77.027634}
      elsif neighborhood == "Brookland"
          loc = { latitude: 38.933842, longitude: -76.984468}
      elsif neighborhood == "Buena Vista"
          loc = { latitude: 38.851149, longitude: -76.968627}
      elsif neighborhood == "Capitol Hill"
          loc = { latitude: 38.886043, longitude: -76.999525}
      elsif neighborhood == "Capitol View"
          loc = { latitude: 38.889927, longitude: -76.925413}
      elsif neighborhood == "Cathedral Heights"
          loc = { latitude: 38.933473, longitude: -77.079835}
      elsif neighborhood == "Chevy Chase"
          loc = { latitude: 38.964001, longitude: -77.067619}
      elsif neighborhood == "Chinatown"
          loc = { latitude: 38.899834, longitude: -77.021741}
      elsif neighborhood == "Cleveland Park"
          loc = { latitude: 38.936343, longitude: -77.063642}
      elsif neighborhood == "Columbia Heights"
          loc = { latitude: 38.928770, longitude: -77.030539}
      elsif neighborhood == "Downtown"
          loc = { latitude: 38.903741, longitude: -77.036297}
      elsif neighborhood == "Dupont Circle"
          loc = { latitude: 38.909694, longitude: -77.043339}
      elsif neighborhood == "Fairfax Village"
          loc = { latitude: 38.863887, longitude: -76.950623}
      elsif neighborhood == "Foggy Bottom"
          loc = { latitude: 38.900692, longitude: -77.051825}
      elsif neighborhood == "Fort Totten"
          loc = { latitude: 38.948155, longitude: -77.008945}
      elsif neighborhood == "Friendship Heights"
          loc = { latitude: 38.956571, longitude: -77.083787}
      elsif neighborhood == "Georgetown"
          loc = { latitude: 38.909706, longitude: -77.065357}
      elsif neighborhood == "Glover Park"
          loc = { latitude: 38.920945, longitude: -77.077200}
      elsif neighborhood == "Greenway"
          loc = { latitude: 38.883572, longitude: -76.959985}
      elsif neighborhood == "Hillcrest"
          loc = { latitude: 38.863346, longitude: -76.962866}
      elsif neighborhood == "Howard U"
          loc = { latitude: 38.922684, longitude: -77.019438}
      elsif neighborhood == "Ivy City"
          loc = { latitude: 38.914751, longitude: -76.985908}
      elsif neighborhood == "Judiciary Square"
          loc = { latitude: 38.898723, longitude: -77.016365}
      elsif neighborhood == "Knox Hill"
          loc = { latitude: 38.853446, longitude: -76.966919}
      elsif neighborhood == "Lincoln Heights"
          loc = { latitude: 38.895717, longitude: -76.931176}
      elsif neighborhood == "Logan Circle"
          loc = { latitude: 38.909641, longitude: -77.029637}
      elsif neighborhood == "Michigan Park"
          loc = { latitude: 38.945229, longitude: -76.983028}
      elsif neighborhood == "Mt. Vernon Square"
          loc = { latitude: 38.902956, longitude: -77.023063}
      elsif neighborhood == "Navy Yard"
          loc = { latitude: 38.876465, longitude: -77.000555}
      elsif neighborhood == "NoMa"
          loc = { latitude: 38.900498, longitude: -77.007505}
      elsif neighborhood == "Pleasant Hill"
          loc = { latitude: 38.863839, longitude: 76.989412}
      elsif neighborhood == "Shaw"
          loc = { latitude: 38.910946, longitude: -77.020462}
      elsif neighborhood == "Takoma"
          loc = { latitude: 38.972546, longitude: -77.020462}
      elsif neighborhood == "Tenleytown"
          loc = { latitude: 38.945982, longitude: -77.080909}
      elsif neighborhood == "U Street"
          loc = { latitude: 38.917000, longitude: -77.025328}
      elsif neighborhood == "Woodley Park"
          loc = { latitude: 38.927994, longitude: -77.057885}
      else neighborhood == "Woodridge"
          loc = { latitude: 38.933334, longitude: -76.968627}
      end
      return "#{loc[:latitude]},#{loc[:longitude]}"
    end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:primary_lang_id, :secondary_lang_id, :sender_id, :receiver_id,
        :fullname, :username, :password, :age, :gender, :country, :us_state, :bio, :admin)
    end
end
