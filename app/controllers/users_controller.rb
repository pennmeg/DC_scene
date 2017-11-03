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
      if neighborhood == "Downtown"
          loc = { latitude: 38.904706, longitude: -77.034715}
      elsif neighborhood == "U St"
          loc = { latitude: 38.916965, longitude: -77.029642}
      elsif neighborhood == "Bloomingdale"
          loc = { latitude: 38.915730, longitude: -77.012186}
      elsif neighborhood == "Columbia Heights"
          loc = { latitude: 38.930178, longitude: -77.032753}
      elsif neighborhood == "Petworth"
          loc = { latitude: 38.937189, longitude: -77.021885}
      elsif neighborhood == "11th St"
          loc = { latitude: 38.931806, longitude: -77.028258}
      else
          loc = { latitude: 38.904706, longitude: -77.034715}
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
