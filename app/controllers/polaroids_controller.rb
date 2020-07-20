class PolaroidsController < ApplicationController
    
    def index
        # polaroids = Polaroid.all
        render json: Polaroid.all
    end

    def show
        polaroid = Polaroid.find(params[:id])
        render ({json: {polaroid: PolaroidSerializer.new(polaroid)}})
    end

    def find_polaroid
        polaroid = Polaroid.find(params[:id])
        render ({json: {polaroid: PolaroidSerializer.new(polaroid)}})
    end

    def create
        polaroid = Polaroid.create( user_id: polaroid_params[:user_id].to_i )
        blob = ActiveStorage::Blob.create_and_upload!(
            io: StringIO.new((Base64.decode64(polaroid_params[:photo]))),
            filename: "polaroid.png",
            content_type: "image/png",
        )
        polaroid.photo.attach(blob)
        photo = url_for(polaroid.photo)
        if polaroid.valid?
            render json: {polaroid: PolaroidSerializer.new(polaroid)}, status: :created
        else
            render json: { errors: polaroid.errors.full_messages }, status: :not_accepted
        end
    end

    def destroy
        # byebug
        polaroid = Polaroid.find(params[:id])
        polaroid.destroy
    end

    private

    def polaroid_params
        params.permit(:photo, :user_id, :file, :filename, :type)
    end
end
