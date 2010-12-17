begin
  c    = 0
  _16b = []

  File.new(ARGV[0]).each_byte do |byte|
    print "\n%08x:  " % c if c == 0 || (c % 16) == 0
    print "%02x " % byte
    print "  " if ((c + 1) % 8) == 0
    c += 1
    if (c % 16) == 0
      print _16b.collect{ |b| (b < 32 || b > 126) ? 46 : b }.collect{ |b| "%c" % b }.join
      _16b = []
    else
      _16b << byte
    end
  end
rescue
  puts "Error opening \"#{ARGV[0]}\"."
end
