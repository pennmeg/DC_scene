class PhotosController < ApplicationController
    def index
      @photos = Photo.order('created_at')
    end
    def show
        puts"\n******* show *******"
    end
    def new
      @photo = Photo.new
    end
    def create
      @photo = Photo.new(photo_params)
      if @photo.save
        flash[:success] = "The photo was added!"
        redirect_to photos_path
      else
        render 'new'
      end
    end
    def destroy
        puts"\n******* destroy *******"
        puts"** params: #{params.inspect}"
        @photo = Photo.find(params[:id])
        @photo.destroy
        respond_to do |format|
            format.html { redirect_to photos_path, notice: 'photo was successfully destroyed.' }
        end
    end
    private
		def photo_params
			params.require(:photo).permit(:image, :title, :user_id)
		end
end
