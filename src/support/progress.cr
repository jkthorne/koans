# Progress tracking for Crystal Koans
#
# Tracks which koans have been completed and caches results
# to skip unchanged tests on subsequent runs.

require "json"
require "digest/md5"

module Koans
  class Progress
    CACHE_FILE = ".koans_progress.json"

    class Entry
      include JSON::Serializable

      property passed_at : String
      property file_hash : String

      def initialize(@passed_at : String, @file_hash : String)
      end
    end

    @data : Hash(String, Entry)

    def initialize
      @data = load_or_create
    end

    def passed?(koan : String, file_path : String) : Bool
      return false unless entry = @data[koan]?
      return false unless File.exists?(file_path)
      entry.file_hash == file_hash(file_path)
    end

    def record_pass(koan : String, file_path : String) : Nil
      @data[koan] = Entry.new(
        passed_at: Time.utc.to_s,
        file_hash: file_hash(file_path)
      )
      save
    end

    def clear(koan : String) : Nil
      @data.delete(koan)
      save
    end

    def clear_all : Nil
      @data.clear
      save
    end

    def total_passed : Int32
      @data.size
    end

    private def load_or_create : Hash(String, Entry)
      if File.exists?(CACHE_FILE)
        begin
          Hash(String, Entry).from_json(File.read(CACHE_FILE))
        rescue
          {} of String => Entry
        end
      else
        {} of String => Entry
      end
    end

    private def save : Nil
      File.write(CACHE_FILE, @data.to_pretty_json)
    end

    private def file_hash(path : String) : String
      Digest::MD5.hexdigest(File.read(path))
    end
  end
end
