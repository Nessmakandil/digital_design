puts "------------------------------------"
puts "****Assignment 3.2****"
puts "------------------------------------"

set File_handle0 [open rtl.txt r+]
set file_data0 [read $File_handle0]
close $File_handle0
set designs [join $file_data0 " "]
puts $designs


