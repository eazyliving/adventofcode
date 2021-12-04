set input {
1001612
19,x,x,x,x,x,x,x,x,41,x,x,x,37,x,x,x,x,x,821,x,x,x,x,x,x,x,x,x,x,x,x,13,x,x,x,17,x,x,x,x,x,x,x,x,x,x,x,29,x,463,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,23
}

lassign $input ts busses

set idx 0
set line {}

foreach in [split [lindex $input 1] ,] {
	if {$in!="x"} {
		lappend lines [list $in $idx]
	}
	incr idx
}
set lines [join $lines]
set w [llength [split [lindex $input 1] ,]]
incr w -1


set nums [regexp -inline -all {[0-9]+} $busses]

set x [expr [join $nums *]]
puts "starting at $x"
while {1} {
	
	set f 0
	if {[expr $x % 1000000]==0} {puts $x}
	 foreach {line off} $lines {
 		if {[expr ($x+$off) % $line]!=0} {
 			set f 1;break
 		}
	}
	incr x
}
puts "r $x"

exit

	puts "x $w [expr ($x+$w)%23]"
	if {[expr $x%19]==0 && [expr ($x+$w)%23]==0} {set f 1}
	puts "f $f"
	if {$f==1} {break}
	incr x