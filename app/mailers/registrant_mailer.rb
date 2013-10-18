class RegistrantMailer < ActionMailer::Base
	default from: "no-reply@koala.com"

	def registrant_email(registrant)
		@registrant = registrant

		mail to: registrant.email, subject: "Confirm your new Koala account"
	end
end