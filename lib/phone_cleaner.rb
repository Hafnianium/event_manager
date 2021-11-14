require 'csv'

def clean_phone_number(phone_number)
  phone_number = phone_number.gsub(/[^\d]/, "")
  if phone_number.length < 10
    phone_number = 'bad'
  elsif phone_number.length > 10
    if phone_number[0] == '1'
      phone_number = phone_number[1..-1]
    else
      phone_number = 'bad'
    end
  end
  return phone_number
end

contents = CSV.open(
  'event_attendees.csv',
  headers: true,
  header_converters: :symbol
)

contents.each do |row|
  name = row[:first_name]
  phone_number = clean_phone_number(row[:homephone])

  puts "#{name} #{phone_number}"
end
