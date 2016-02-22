require "sinatra/base"
require "active_support/all"

class Calendar < Sinatra::Base
	get "/" do 
		today = DateTime.now
		redirect "#{today.year}/#{today.month}/#{today.day}"
	end

	# get "/:year/:month/:day" do
	# 	"Hello! The current date is #{params[:year]}/ #{params[:month]}/#{params[:day]}"
	# end

	get "/:year/:month/:day" do |year, month, day|
		@date = DateTime.new(year.to_i, month.to_i, day.to_i)
		@begin_date = @date.beginning_of_month.beginning_of_week(:sunday)
		@end_date = @date.end_of_month.end_of_week(:sunday)
		erb :calendar
	end

	def class_for_date(date)
		classes = []
			if date == @date
				classes << "selected"
			end
			if date.month != @date.month
				classes << "fade"
			end
			return classes.join(" ")
		end

end

