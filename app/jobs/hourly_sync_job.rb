require 'sidekiq-scheduler'
class HourlySyncJob 
	
	include Sidekiq::Worker

	def perform
		logger.info "Hour Sync Job Run"
	    donations = Donation.where(sync_status: false)
	    donations.each do |donation|
	    	SyncDonationJobJob.perform_later donation
	    end
	end

end