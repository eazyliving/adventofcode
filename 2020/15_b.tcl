set input {14,1,17,0,3,20}

set nums [split $input ,]

set pos 0
foreach num $nums {
	
	lappend mem($num) $pos
	incr pos
	
}

set pos [expr [llength $nums] -1]
set last [lindex $nums 0]

while {$pos!=[expr 30000000 -1]} {
	
	incr pos
	
	if {[llength $mem($last)]==1} {
		set last 0
		lappend mem(0) $pos
		continue
	}
	set le [lindex $mem($last) end]
	set lbe [lindex $mem($last) end-1]
	set last [expr $le -$lbe]
	lappend mem($last) $pos
	
	
}
puts $last