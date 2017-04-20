require 'sidekiq-scheduler'
class HourlySyncJob

	include Sidekiq::Worker

	def perform
		logger.info "Hour Sync Job Run"
	    donations = Donation.where('sync_status = ? OR sync_status = ?', false, nil)
	    donations.each do |donation|
	    	SyncDonationJobJob.perform_async donation.id
	    end
	end

end
