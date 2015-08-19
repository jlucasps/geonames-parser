require 'ostruct'

module Geonames
  class Reader
    attr_reader :line_separator
    attr_reader :column_separator
    attr_reader :file
    attr_reader :column_names

    def initialize(file_path, column_names, line_separator = "\n", column_separator = "\t")
      @file = File.open(file_path)
      @column_names = column_names
      @line_separator = line_separator
      @column_separator = column_separator
    end

    def parse
      @file.readlines(self.line_separator).map do |line|
        unless line.start_with?("#")
          hash = {}
          line.split(self.column_separator).each_with_index  do |column_value, index|
            hash[self.column_names[index]] = column_value.strip
          end
          OpenStruct.new(hash)
        end
      end
    end
  end
end
