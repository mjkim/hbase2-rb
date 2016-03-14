require 'thrift'
require File.join(File.dirname(__FILE__), 'hbase', 'hbase_types')
require File.join(File.dirname(__FILE__), 'hbase', 't_h_base_service')

module Hbase2
  Client = #::Apache::Hadoop::Hbase::Thrift::Hbase::Client
           ::Apache::Hadoop::Hbase::Thrift2::THBaseService::Client

  ::Apache::Hadoop::Hbase::Thrift2.constants.each do |constant|
    const_set(constant, ::Apache::Hadoop::Hbase::Thrift2.const_get(constant))
  end
end
HBase2 = Hbase2
