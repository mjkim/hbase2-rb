# Hbase Thrift2 interface for Ruby

inspired by https://github.com/highgroove/hbase-rb

## Installation

### Bundler

Add to `Gemfile` and run `bundle install`:

```ruby
gem 'hbase2-rb'
```

### Without Bundler

Install the gem:

```bash
gem install hbase2-rb
```

Require it explicitly in your scripts:

```ruby
require "rubygems"
require "hbase2-rb"
```

## Versioning

The base version of the gem matches the version of HBase the interface was
generated against.

For instance, when using HBase 1.2.0:

```ruby
gem 'hbase-rb', '~> 1.2.0'
```

## Usage

For example:

```ruby
socket    = Thrift::Socket.new('localhost', 9090)

transport = Thrift::BufferedTransport.new(socket)
transport.open

protocol  = Thrift::BinaryProtocol.new(transport)
client    = HBase2::Client.new(protocol)
```

## Writing Rows

```ruby
# Assuming a table "mytable" and a column family "c"
column_value = HBase2::TColumnValue.new
column_value.family = 'c'
column_value.qualifier = 'foo'
column_value.value = 'bar'
put = HBase2::TPut.new row: 'abc123', columnValues: [column_value]
client.put('mytable', put)
```

## Reading Rows

```ruby
# Assuming a table "mytable" and a column family "c"
get = HBase2::TGet.new row: 'abc123'
result = client.get('mytable', get)
if result.row
  result.columnValues.each do |column|
    puts "#{column.family}:#{column.qualifier} #{column.value}"
  end
end
```

## API Reference

* [Hbase/ThriftIDL](https://github.com/apache/hbase/blob/rel/1.2.0/hbase-thrift/src/main/resources/org/apache/hadoop/hbase/thrift2/hbase.thrift)
* [Hbase/TestThriftService2Handler](https://github.com/apache/hbase/blob/rel/1.2.0/hbase-thrift/src/test/java/org/apache/hadoop/hbase/thrift2/TestThriftHBaseServiceHandler.java)
* [Hbase/ThriftService2Handler](https://hbase.apache.org/devapidocs/org/apache/hadoop/hbase/thrift2/ThriftHBaseServiceHandler.html)
