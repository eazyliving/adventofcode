set input {14,1,17,0,3,20}

set nums [split $input ,]

set pos [expr [llength $nums] -1]
while {$pos!=2019} {
	
	set last [lindex $nums $pos]
	incr pos
	set f [lsort -integer -decreasing [lsearch -all $nums $last]]
	
	if {[llength $f]==1} {
		lappend nums 0
		continue
	}
	
	set newnum [expr [join [lrange $f 0 1] -]]
	lappend nums $newnum
	
}
puts $newnum