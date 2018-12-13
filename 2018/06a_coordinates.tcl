set input {300, 90
300, 60
176, 327
108, 204
297, 303
101, 236
70, 102
336, 153
260, 265
228, 221
119, 267
310, 302
291, 164
190, 202
298, 228
292, 262
53, 251
176, 64
170, 160
71, 42
314, 51
71, 88
319, 150
192, 322
270, 88
165, 203
262, 340
301, 327
135, 324
97, 250
161, 231
305, 344
295, 213
320, 219
172, 269
151, 150
215, 128
167, 102
158, 138
307, 353
358, 335
163, 329
234, 147
58, 298
228, 50
151, 334
108, 176
335, 235
296, 263
80, 233}

proc dist {x1 y1 x2 y2} {
	return [expr abs($x1-$x2) + abs($y1-$y2)]
}

foreach {x y} [regsub -all {,} [join $input] ""] {
	lappend coords [list $x $y]
}

set minx [lindex [lsort -integer -index 0 -increasing $coords] 0 0]
set miny [lindex [lsort -integer -index 1 -increasing $coords] 0 1]
set maxx [lindex [lsort -integer -index 0 -decreasing $coords] 0 0]
set maxy [lindex [lsort -integer -index 1 -decreasing $coords] 0 1]

for {set x $minx} {$x<=$maxx} {incr x} {
	for {set y $miny} {$y<=$maxy} {incr y} {
		
		set isPoint [lsearch $coords [list $x $y]]
		
		if {$isPoint!=-1} {
			set matrix($x,$y) P
		} else {
			
			set md {}
			set idx -1
			foreach coord $coords {
				lappend md [list [incr idx] [dist $x $y [lindex $coord 0] [lindex $coord 1]]]
			}
			
			set md [lsort -increasing -integer -index 1 $md]
			#puts "$x $y :$md";puts ""
		
			if {[lindex $md {0 1}]!=[lindex $md {1 1}]} {
				set matrix($x,$y) [lindex [lsort -increasing -integer -index 1 $md] {0 0}]
			} else {
				set matrix($x,$y) X
			}
		}
	}
	
}

set infinits {}
for {set x $minx} {$x<=$maxx} {incr x} {
	lappend infinits $matrix($x,$miny);
	lappend infinits $matrix($x,$maxy);
}

for {set y $miny} {$y<=$maxy} {incr y} {
	lappend infinits $matrix($minx,$y);
	lappend infinits $matrix($maxx,$y);
}

set infinits [lsort -unique $infinits]
regsub -all "P" $infinits "" infinits
regsub -all "X" $infinits "" infinits

foreach {coord i} [array get matrix] {
	if {[lsearch $infinits $i]!=-1 || $i eq "X" || $i eq "P"} {
		unset matrix($coord)
	}
}

foreach c [array names matrix] {
	set p [lindex $matrix($c) 0]
	incr point($p)
}

puts [expr [lindex [lsort -stride 2 -integer -index 1 -decreasing [array get point]] 1] +1]