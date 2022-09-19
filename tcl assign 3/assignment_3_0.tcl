puts "----------------------------------------------------"
puts "**** Reporting Files types & change files paths ****"
puts "----------------------------------------------------"

array set Files {uart_tx_top.v /users/alieltemsah/projects/rtl\
				 Serializer.v /users/alieltemsah/projects/rtl\
				 fsm_ctrl.v /users/alieltemsah/projects/rtl\
				 synth.tcl /users/alieltemsah/projects/scripts\
				 timing.rpt /users/alieltemsah/projects/reports\
				 power.rpt /users/alieltemsah/projects/reports\
				 area.rpt /users/alieltemsah/projects/reports}
set file_type [array names Files]
#puts $file_type

proc pfiletype {A} {	
	foreach x $A {		
		
		set indexofdot [string first . $x]
		set str [string range $x 0 $indexofdot-1]
		
		if {[string match *.v $x]} {
			puts "$str is a Verilog File"
		}
		if {[string match *.tcl $x]} {
			puts "$str is a TCL File"
		}
		if {[string match *.rpt $x]} {
			puts "$str is a Report File"
		}		
	}
}

pfiletype $file_type
puts "-------------------------------"
set string [array get Files]
regsub -nocase -all "alieltemsah" $string "MostafaMohamed" string
array set Files $string
parray Files

