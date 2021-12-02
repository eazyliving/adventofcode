set input {
1001612
19,x,x,x,x,x,x,x,x,41,x,x,x,37,x,x,x,x,x,821,x,x,x,x,x,x,x,x,x,x,x,x,13,x,x,x,17,x,x,x,x,x,x,x,x,x,x,x,29,x,463,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,23
}


lassign $input ts busses
set lines [regexp -inline -all {[0-9]+} $busses]
set waits ""

foreach line $lines {

	set div [expr $ts / $line.0]
	lappend waits [list [expr round(ceil($div)*$line) - $ts] $line]
}

set waits [lsort -integer -index 0 $waits]

puts [expr [lindex $waits 0 0]*[lindex $waits 0 1]]