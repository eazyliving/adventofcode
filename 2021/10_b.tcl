set fh [open "input_10.txt"]
set input [read $fh 100000000]
close $fh

regsub -all {\[} $input "a" input
regsub -all {\]} $input "b" input

regsub -all {\{} $input "c" input
regsub -all {\}} $input "d" input

regsub -all {\<} $input "e" input
regsub -all {\>} $input "f" input

regsub -all {\(} $input "g" input
regsub -all {\)} $input "h" input

set toStack {a b c d e f g h}
set points {h 1 b 2 d 3 f 4}
set completions {}

foreach line $input {
	set stack {}
	set error 0
	foreach par [split $line {}] {
		set f [lsearch $toStack $par]
		if {[expr $f % 2]==0} {
			lappend stack [lindex $toStack $f+1]
		} else {
			set fromStack [lindex $stack end]
			set stack [lreplace $stack end end]
			if {$fromStack!=$par} {
				set error 1
				break
			}
		}
	}
	if {$error==0} {lappend completions [lreverse $stack]}
}

set scorelist {}
foreach line $completions {
	set score 0
	foreach par $line {
		set sp [lindex $points [expr [lsearch $points $par]+1]]
		set score [expr $score * 5 + $sp]
	}
	lappend scorelist $score
}

puts [lindex [lsort -integer $scorelist] [expr ([llength $scorelist]-1)/2]]