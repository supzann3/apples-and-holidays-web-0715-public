require 'pry'

def second_supply_for_fourth_of_july(holiday_hash)
  # given that holiday_hash looks like this:
  # {
  #   :winter => {
  #     :christmas => ["Lights", "Wreath"],
  #     :new_years => ["Party Hats"]
  #   },
  #   :summer => {
  #     :fourth_of_july => ["Fireworks", "BBQ"]
  #   },
  #   :fall => {
  #     :thanksgiving => ["Turkey"]
  #   },
  #   :spring => {
  #     :memorial_day => ["BBQ"]
  #   }
  # }
  # return the second element in the 4th of July array
  holiday_hash[:summer][:fourth_of_july][1]
end

def add_supply_to_winter_holidays(holiday_hash, supply)
  # holiday_hash is identical to the one above 
  # add the second argument, which is a supply, to BOTH the 
  # Christmas AND the New Year's arrays
  # holiday_hash[:winter].each {|key,value| key.push(supply)}
  holiday_hash[:winter][:christmas]<<supply
  holiday_hash[:winter][:new_years]<<supply

end
 

def add_supply_to_memorial_day(holiday_hash, supply)
  # again, holiday_hash is the same as the ones above
  # add the second argument to the memorial day array
  holiday_hash[:spring][:memorial_day]<<supply
end

def add_new_holiday_with_supplies(holiday_hash, season, holiday_name, supply_array)
  # code here
  # remember to return the updated hash
  holiday_hash[season]={holiday_name => supply_array}
  holiday_hash
end

def all_winter_holiday_supplies(holiday_hash)
  # return an array of all of the supplies that are used in the winter season
   holiday_hash[:winter].values.flatten
end

def all_supplies_in_holidays(holiday_hash)
  # iterate through holiday_hash and print items such that your readout resembles:
  # Winter:
  #   Christmas: Lights, Wreath
  #   New Years: Party Hats
  # Summer:
  #   Fourth Of July: Fireworks, BBQ
  # etc.
  holiday_hash.each do |season,holiday|
  new_season=season.to_s.capitalize 
  puts "#{new_season}:"
    holiday.each do |holiday,supply|
      holiday=holiday.to_s.split("_").map(&:capitalize).join(" ")
      supply=supply.join(", ")
      puts "  #{holiday}: #{supply}"
      # holiday = holiday.to_s.split('_').map(&:capitalize).join(' ')
      #                                  .map { |word| word.capitalize }.join(' ')
  #     holiday_array=holiday.to_s
  #     new_holiday=holiday_array.split("_")
  #       new_holiday.each do |word|
  #         capital_word=word.capitalize!.to_s
  #         puts "  #{capital_word}"
  # # holiday_name.each do |holidays,supply|
  #     end
    end
  end
end

def all_holidays_with_bbq(holiday_hash)
  # return an array of holiday names (as symbols) where supply lists
  # include the string "BBQ"
  result=[]
  holiday_hash.each do |season, holiday|
     holiday.each do |holiday, supply|
        supply.select do |supply| 
          if supply=="BBQ"
             result<<holiday
          end
        end
      end
  end
  result
end

#  {
#     :winter => {
#       :christmas => ["Lights", "Wreath"],
#       :new_years => ["Party Hats"]
#     },
#     :summer => {
#       :fourth_of_july => ["Fireworks", "BBQ"]
#     },
#     :fall => {
#       :thanksgiving => ["Turkey"]
#     },
#     :spring => {
#       :memorial_day => ["BBQ"]
#     }
#   }
# }

