
require 'ostruct'
gem 'minitest'
require "minitest/autorun"
require './reader'

class TestReader < Minitest::Test

  def setup
    @country_columns = [:iso, :iso_3, :iso_numeric, :fips, :name, :capital, :area, :population,
           :continent, :tld, :currency_code,  :currency_name,  :phone_code,
           :postal_code_format, :postal_code_regex, :languages, :geoname_id, :neighbours,
           :equivalent_fips_code]
  end

  

  def test_default_file
    
    country_reader = Reader.new('countryInfo_test.txt', @country_columns)

    entries = [OpenStruct.new({:iso=>"AT", :iso_3=>"AUT", :iso_numeric=>"040", :fips=>"AU", :name=>"Austria",
                    :capital=>"Vienna", :area=>"83858", :population=>"8205000", :continent=>"EU",
                    :tld=>".at", :currency_code=>"EUR", :currency_name=>"Euro", :phone_code=>"43",
                    :postal_code_format=>"####", :postal_code_regex=>"^(\\d{4})$", :languages=>"de-AT,hr,hu,sl",
                    :geoname_id=>"2782113", :neighbours=>"CH,DE,HU,SK,CZ,IT,SI,LI", :equivalent_fips_code=>""}),
              OpenStruct.new({:iso=>"BR", :iso_3=>"BRA", :iso_numeric=>"076", :fips=>"BR", :name=>"Brazil",
                    :capital=>"Brasilia", :area=>"8511965", :population=>"201103330", :continent=>"SA",
                    :tld=>".br", :currency_code=>"BRL", :currency_name=>"Real", :phone_code=>"55",
                    :postal_code_format=>"#####-###", :postal_code_regex=>"^(\\d{8})$", :languages=>"pt-BR,es,en,fr",
                    :geoname_id=>"3469034", :neighbours=>"SR,PE,BO,UY,GY,PY,GF,VE,CO,AR", :equivalent_fips_code=>""}),
              OpenStruct.new({:iso=>"AN", :iso_3=>"ANT", :iso_numeric=>"530", :fips=>"NT", :name=>"Netherlands Antilles",
                    :capital=>"Willemstad", :area=>"960", :population=>"136197", :continent=>"NA", :tld=>".an",
                    :currency_code=>"ANG", :currency_name=>"Guilder", :phone_code=>"599", :postal_code_format=>"",
                    :postal_code_regex=>"", :languages=>"nl-AN,en,es", :geoname_id=>"", :neighbours=>"GP", :equivalent_fips_code=>""})
            ]
    assert entries, country_reader.parse
  end

  def test_file_with_empty_lines
    country_reader = Reader.new('countryInfo_empty_lines_test.txt', @country_columns)

    entries = [OpenStruct.new({:iso=>"AT", :iso_3=>"AUT", :iso_numeric=>"040", :fips=>"AU", :name=>"Austria",
                    :capital=>"Vienna", :area=>"83858", :population=>"8205000", :continent=>"EU",
                    :tld=>".at", :currency_code=>"EUR", :currency_name=>"Euro", :phone_code=>"43",
                    :postal_code_format=>"####", :postal_code_regex=>"^(\\d{4})$", :languages=>"de-AT,hr,hu,sl",
                    :geoname_id=>"2782113", :neighbours=>"CH,DE,HU,SK,CZ,IT,SI,LI", :equivalent_fips_code=>""}),
              OpenStruct.new({:iso=>"BR", :iso_3=>"BRA", :iso_numeric=>"076", :fips=>"BR", :name=>"Brazil",
                    :capital=>"Brasilia", :area=>"8511965", :population=>"201103330", :continent=>"SA",
                    :tld=>".br", :currency_code=>"BRL", :currency_name=>"Real", :phone_code=>"55",
                    :postal_code_format=>"#####-###", :postal_code_regex=>"^(\\d{8})$", :languages=>"pt-BR,es,en,fr",
                    :geoname_id=>"3469034", :neighbours=>"SR,PE,BO,UY,GY,PY,GF,VE,CO,AR", :equivalent_fips_code=>""}),
              OpenStruct.new({:iso=>"AN", :iso_3=>"ANT", :iso_numeric=>"530", :fips=>"NT", :name=>"Netherlands Antilles",
                    :capital=>"Willemstad", :area=>"960", :population=>"136197", :continent=>"NA", :tld=>".an",
                    :currency_code=>"ANG", :currency_name=>"Guilder", :phone_code=>"599", :postal_code_format=>"",
                    :postal_code_regex=>"", :languages=>"nl-AN,en,es", :geoname_id=>"", :neighbours=>"GP", :equivalent_fips_code=>""})
            ]
    assert entries, country_reader.parse
  end

end
