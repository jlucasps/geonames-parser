require './lib/geonames/reader'

module Geonames

  COUNTRY_COLUMNS = %w(
    iso iso_3 iso_numeric fips name capital area population continent tld
    currency_code currency_name phone_code postal_code_format postal_code_regex
    languages geoname_id neighbours equivalent_fips_code
  )

  CITY_COLUMNS = %w(
    geoname_id name ascii_name alternate_names latitude longitude feature_class
    feature_code country_code cc2 admin1_code admin2_code admin3_code
    admin4_code population elevation dem timezone modification_dat
  )

  def self.parser_countries
    if File.exist?('data/countryInfo.txt')
      reader = Reader.new('data/countryInfo.txt', COUNTRY_COLUMNS)
      reader.parse
    end
  end

  def self.parse_cities
    if File.exist?('data/cities1000.txt')
      reader = Reader.new('data/cities1000.txt', CITY_COLUMNS)
      reader.parse
    end
  end
end
