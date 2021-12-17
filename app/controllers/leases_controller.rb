class LeasesController < ApplicationController
    before_action :find_lease, only: [:destroy]

    def create
        lease = Lease.create!(lease_params)
        render json: lease, status: :created
    end

    def destroy
        @lease.destroy
        head :no_content
    end

private

    def find_lease
        @lease = Lease.find(params[:id])
    end

    def lease_params
        params.permit(:rent, :apartment_id, :tenant_id)
    end
end
end
