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
set points {h 3 b 57 d 1197 f 25137}
set errors {}

foreach line $input {
	set stack {}
	foreach par [split $line {}] {
		set f [lsearch $toStack $par]
		if {[expr $f % 2]==0} {
			lappend stack [lindex $toStack $f+1]
		} else {
			set fromStack [lindex $stack end]
			set stack [lreplace $stack end end]
			if {$fromStack!=$par} {
				lappend errors $par
				break
			}
		}
	}
}

set score 0
foreach error $errors {
	incr score [lindex $points [expr [lsearch $points $error]+1]]
}
puts $score