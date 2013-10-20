$: << File.dirname(__FILE__)
$: << File.join($:.last, '..', 'lib')

require 'bundler'
Bundler.setup

require 'rspec'
require 'pry'

def run(*args)
  output = Struct.new(:pid, :stdout, :stderr)

  status = Open4.popen4(*args) do |pid, stdin, stdout, stderr|
    output = output.new pid, stdout.read, stderr.read
  end

  [status, output]
end
