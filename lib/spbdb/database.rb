class Database
  @@databases = {}

  def self.define_connection(host, &block)
    @@databases.merge!({host.to_sym => DatabaseSchema.new(&block)})
  end

  def self.connect(db)
    DatabaseConnection.new(databases[db])
  end

  def self.databases
    @@databases
  end
end
