puts "****Writing Verilog Block Interface****"

set modname "Up_Dn_Counter"
set in_ports {IN Load Up Down CLK}
set in_ports_width {4 1 1 1 1}
set out_ports {High Counter Low}
set out_ports_width {1 4 1}

puts "module $modname ("

set in_len [llength $in_ports]

for {set i 0} {$i <= [expr $in_len-1]} {incr i} {
if {[expr [lindex $in_ports_width $i] != 1]} {
set in_len [expr [lindex $in_ports_width $i] - 1]
puts "input \[$in_len:0\] [lindex $in_ports $i],"
} else {
puts "input [lindex $in_ports $i],"
}
}
set out_len [llength $out_ports]

for {set i 0} {$i <= [expr $out_len-1]} {incr i} {

if {[expr $i != $out_len-1]} {

if {[expr [lindex $out_ports_width $i] != 1]} {
set in_len [expr [lindex $out_ports_width $i] - 1]
puts "output \[$out_len:0\] [lindex $out_ports $i],"
} else {
puts "output [lindex $out_ports $i],"
}

} else {
if {[expr [lindex $out_ports_width $i] != 1]} {
set in_len [expr [lindex $out_ports_width $i] - 1]
puts "output \[$out_len:0\] [lindex $out_ports $i]"
} else {
puts "output [lindex $out_ports $i]"
}

}
}

puts ");"
