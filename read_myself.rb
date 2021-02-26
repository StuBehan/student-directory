def read_myself
  puts "this method reads its own source code"
  sauce = File.read(__FILE__)
  puts sauce
end

read_myself