require './reader'

country_columns = [:iso, :iso_3, :iso_numeric, :fips, :name, :capital, :area, :population,
           :continent, :tld, :currency_code,  :currency_name,  :phone_code,
           :postal_code_format, :postal_code_regex, :languages, :geoname_id, :neighbours,
           :equivalent_fips_code]

reader = Reader.new('countryInfo.txt', country_columns)
puts reader.parse

# city_columns = [:geoname_id, :name, :ascii_name, :alternate_names, :latitude, :longitude,
#                 :feature_class, :feature_code, :country_code, :cc2, :admin1_code, :admin2_code,
#                 :admin3_code, :admin4_code, :population, :elevation, :dem, :timezone, :modification_date]

# reader = Reader.new('cities1000.txt', city_columns)
# puts reader.parse