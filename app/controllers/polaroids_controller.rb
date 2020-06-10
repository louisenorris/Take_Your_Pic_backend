class PolaroidsController < ApplicationController
    
    def index
        # polaroids = Polaroid.all
        render json: Polaroid.all
    end

    def show
        polaroid = Polaroid.find(params[:id])
        render ({json: {polaroid: PolaroidSerializer.new(polaroid)}})
    end

    def create
        polaroid = Polaroid.create( user: @current_user )
        # polaroid = Polaroid.create polaroid_params
        # polaroid.user = @current_user
        # polaroid.save
        if polaroid.valid?
            render json: {polaroid: PolaroidSerializer.new(polaroid)}, status: :created
        else
            render json: { errors: polaroid.errors.full_messages }, status: :not_accepted
        end
    end

    private

    def polaroid_params
        params.require(:polaroid).permit(:photo)
    end

end
