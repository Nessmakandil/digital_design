puts "****Assignment 2.0****"

# \ scape new line char
set cities {cairo\
			alexandria\
			damietta\
			dakahlia\
			faiyum\
			sohag\
			aswan}

foreach x $cities {
	set element [concat [string toupper [string index $x 0]] [string range $x 1 [string length $x-1]]]
	set element [join $element ""]
	lappend Cities_New $element
}

puts "new list contents are $Cities_New"
set Cities_New {}