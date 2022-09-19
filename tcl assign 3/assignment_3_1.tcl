puts "------------------------------------"
puts "****Assignment 3.1****"
puts "**** report RTL change versions ****"
puts "------------------------------------"

set File_handle0 [open fifo_ver0.txt r+]
set file_data0 [read $File_handle0]
close $File_handle0

set File_handle1 [open fifo_ver1.txt r+]
set file_data1 [read $File_handle1]
close $File_handle1

set File_handle2 [open fifo_ver2.txt r+]
set file_data2 [read $File_handle2]
close $File_handle2

if {[string match $file_data0 $file_data1]} {
	set File_handle3 [open report.txt w+]
	puts $File_handle3 "fifo version 0 is identical to fifo version 1"
	close $File_handle3
	
	set File_handle4 [open report.txt r+]
	set file_data4 [read $File_handle4]
	puts $file_data4
	close $File_handle4

} else {
	set File_handle5 [open report.txt w+]
	puts $File_handle5 "fifo version 0 is different from fifo version 1"
	close $File_handle5
	
	set File_handle6 [open report.txt r+]
	set file_data6 [read $File_handle6]
	puts $file_data6
	close $File_handle6
}

if {[string compare $file_data0 $file_data2]} {
	set File_handle7 [open report.txt w+]
	puts $File_handle7 "fifo version 0 is identical to fifo version 2"
	close $File_handle7
	
	set File_handle8 [open report.txt r+]
	set file_data8 [read $File_handle8]
	puts $file_data8
	close $File_handle8

} else {
	set File_handle9 [open report.txt w+]
	puts $File_handle9 "fifo version 0 is different from fifo version 2"
	close $File_handle9
	
	set File_handle10 [open report.txt r+]
	set file_data10 [read $File_handle10]
	puts $file_data10
	close $File_handle10
}

if {[string compare $file_data1 $file_data2]} {
	set File_handle11 [open report.txt w+]
	puts $File_handle11 "fifo version 1 is identical to fifo version 2"
	close $File_handle11
	
	set File_handle12 [open report.txt r+]
	set file_data12 [read $File_handle12]
	puts $file_data12
	close $File_handle12

} else {
	set File_handle13 [open report.txt w+]
	puts $File_handle13 "fifo version 1 is different from fifo version 2"
	close $File_handle13
	
	set File_handle14 [open report.txt r+]
	set file_data14 [read $File_handle14]
	puts $file_data14
	close $File_handle14
}


