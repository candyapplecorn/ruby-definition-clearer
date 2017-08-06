#!/usr/bin/env ruby
require 'byebug'

if    ARGV.empty?
	abort "\tUsage: def-clear source.rb [destination]" 			
elsif ARGV.any?{|a| a =~ /\-h|help/i}
	abort "def-clear:
\tremoves all lines of code
\tbetween 'def' and 'end',
\twriting the result to STDOUT.
\t
\tOutput will be redirected to
\tdestination if provided."    		
end

$source	= ARGV.first
# if a destination is provided, add .temp in case
# source is destation. 
$des	= ARGV.last + '.temp' if ARGV.length > 1

# Get the files and abort upon error
begin
	$sfh = File.new($source, "r")
	$dfh = File.new($des, "w") unless $des.nil?
rescue Exception => e
	abort e.to_s.sub('@ rb_sysopen ', '')
end

$flag = true

# Traverse the file, omitting method bodies
$sfh.each do |line|
	$flag = true if line =~ /^\s*end/	

	if $des.nil?
		puts line.chomp if $flag
	else
	   $dfh.puts line.chomp if $flag
	end

	$flag = false if line =~ /^\s*def/	
end

# Rename the destination file if it was provided
File.rename($des, $des.sub('.temp', '')) unless $des.nil?
