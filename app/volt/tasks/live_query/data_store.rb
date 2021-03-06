require 'mongo'

class DataStore
  def initialize
  end

  def db
    @@db ||= Volt::DataStore.fetch
  end

  def query(collection, query)
    # Extract query parts
    query, skip, limit = query

    cursor = db[collection].find(query)
    cursor = cursor.skip(skip) if skip
    cursor = cursor.limit(limit) if limit

    return cursor.to_a
  end
end
