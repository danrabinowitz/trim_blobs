require 'trim_blobs/version'
require 'trim_blobs/active_record/connection_adapters/abstract_adapter'
require 'active_record'

#ActiveRecord::ConnectionAdapters::AbstractAdapter.extend ActiveRecord::ConnectionAdapters::AbstractAdapter

ActiveRecord::ConnectionAdapters::AbstractAdapter.class_eval do
  include TrimBlobs::ActiveRecord::ConnectionAdapters::AbstractAdapter
  alias_method :log_without_blobs_trimmed, :log
  alias_method :log, :log_with_blobs_trimmed
end
