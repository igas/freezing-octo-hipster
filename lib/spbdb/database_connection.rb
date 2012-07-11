class DatabaseConnection
  def initialize(db)
    @db = db
  end

  def select(table, opt)
    table = @db[table]
    source = table.get_source
    result = []
    columns = []
    encstr = ''
    table.columns.each do |column|
      columns << [column.keys.first, column.values.first.first]
      type = column.values.first
      type[0] == :string ? tmp = "a#{type[1]}" : tmp = "q"
      encstr += tmp
    end
    if source[:type] == :file
      File.open(source[:path], "rb") do |f|
        while record = f.read(table.record_size)
          record = record.unpack(encstr)
          row = columns
          row = row.map do |value|
            val = case value[1]
              when :string then record.shift.rstrip
              when :integer then record.shift
              when :datetime then Time.at(record.shift).to_date
            end
            [value[0], val]
          end
          data = Hash[row]
          if data[opt[:where].keys.first] == opt[:where][opt[:where].keys.first]
            offset = f.pos/table.record_size-1
            result << data.merge({offset: offset})
          end
          return result if opt[:limit] && result.size >= opt[:limit]
        end
      end
    end
    result
  end
end
