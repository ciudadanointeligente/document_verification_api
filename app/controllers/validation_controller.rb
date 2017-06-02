class ValidationController < ApplicationController
  def validate
    p "ValidationController < ApplicationController"
    unless params[:rut].nil?
       found = Rut.find_by_rut(params[:rut]).present?
       if found
         render json: { validated: true }, status: :ok
       else
         render json: { validated: false }, status: :ok
       end
    else
      render json: { error: 'Rut parameter not found'}, status: :bad_request
    end
  end
end
