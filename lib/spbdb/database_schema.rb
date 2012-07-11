class DatabaseSchema
  def initialize(&block)
    @tables = {}
    instance_eval &block
  end

  def table(name, &block)
    @tables.merge!({name.to_sym => Table.new(name, &block)})
  end

  def [](key)
    @tables[key.to_sym]
  end
end
