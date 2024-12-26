module Api
    module V1
      class DevicesController < ApplicationController
        before_action :set_device, only: [:upload_log]
        skip_before_action :verify_authenticity_token, only: [:upload_log]

        # PUT /api/v1/devices/:id/log
        def upload_log
          puts params.inspect

          if params[:file].present?
            @device.log_file.attach(params[:file])
            if @device.save
              render json: { message: 'File uploaded successfully' }, status: :ok
            else
              render json: { errors: @device.errors.full_messages }, status: :unprocessable_entity
            end
          else
            render json: { error: 'No file provided' }, status: :bad_request
          end
        end

        private

        def set_device
          @device = Device.find_by(id: params[:device_id])
          if @device.nil?
            render json: { error: 'Device not found' }, status: :not_found
          end
        end
      end
    end
  end