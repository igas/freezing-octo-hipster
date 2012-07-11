class Table
  attr_reader :columns

  def initialize(name, &block)
    @name = name
    @columns = []
    instance_eval &block
  end

  def source(type, path)
    @source = {type: type, path: path}
  end

  def column(name, *args)
    size = args[1]
    size ||= 8
    @columns << {name => [args[0], size]}
  end

  def get_source
    @source
  end

  def record_size
    @columns.inject(0) {|i,c| i += c.values[0][1]}
  end
end
