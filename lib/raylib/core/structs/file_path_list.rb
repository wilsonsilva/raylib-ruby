module Raylib
  # File path list
  class FilePathList < FFI::Struct
    layout(
      :capacity, :uint, # Filepaths max entries,
      :count, :uint,    # Filepaths entries count,
      :paths, :pointer, # Filepaths entries
    )

    def self.create(capacity, count, paths)
      new.tap do |instance|
        instance[:capacity] = capacity
        instance[:count] = count
        instance[:paths] = paths
      end
    end

    def to_s
      "Raylib::FilePathList##{object_id} capacity=#{capacity} count=#{count} paths=#{paths}"
    end

    # Filepaths max entries
    # @return [Integer] capacity
    def capacity = self[:capacity]

    # Sets Filepaths max entries
    def capacity=(new_capacity)
      self[:capacity] = new_capacity
    end

    # Filepaths entries count
    # @return [Integer] count
    def count = self[:count]

    # Sets Filepaths entries count
    def count=(new_count)
      self[:count] = new_count
    end

    # Filepaths entries
    # @return [Array<String>] paths
    def paths
      self[:paths].get_array_of_string(0, count)
    end

    # Sets Filepaths entries
    def paths=(new_paths)
      self[:paths] = new_paths
    end
  end
end
