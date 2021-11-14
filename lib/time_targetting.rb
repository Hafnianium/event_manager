require 'csv'
require 'time'

def time_targeter(reg_date)
  parsed_time = DateTime.strptime(reg_date,"%m/%d/%y %H:%M")
  return parsed_time.hour
end

contents = CSV.open(
  'event_attendees.csv',
  headers: true,
  header_converters: :symbol
)

time_hash = Hash.new(0)
contents.each do |row|
  name = row[:first_name]
  time = time_targeter(row[:regdate])
  time_hash[time_targeter(row[:regdate])] += 1

  puts "#{name} #{time}"
end

puts time_hash