set input {class: 1-3 or 5-7
row: 6-11 or 33-44
seat: 13-40 or 45-50

your ticket:
7,1,14

nearby tickets:
7,3,47
40,4,50
55,2,20
38,6,12}

regsub -all "\n\n" $input "|" input
lassign [split $input "|"] fields myticket tickets

set tickets [lmap t [lrange $tickets 2 end] {split $t ,}]
set myticket [split $myticket ,]

set fields [split $fields "\n"]
foreach field $fields {
	set name [string range $field 0 [string first ":" $field]-1]
	set one [split [lindex $field end-2] -]
	set two [split [lindex $field end] -]
	set f($name) [list $one $two]
	
}

set invalid {}
foreach ticket $tickets {

	foreach num $ticket {
		set found 0
		foreach {name ranges} [array get f] {
		
			foreach range $ranges {
				if {$num>=[lindex $range 0] && $num<=[lindex $range 1]} {
					set found 1
				}
			}
		}
		if {$found==0} {lappend invalid $num}
	
	}

}

puts [expr [join $invalid +]]