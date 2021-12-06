set input {
#.#..###
.#....##
.###...#
..####..
....###.
##.#.#.#
..#..##.
#.....##
}

set input2 {
.#.
..#
###
}

proc actives {x y z} {
	
	global matrix
	
	set active 0
	for {set z1 [expr $z-1]} {$z1<=$z+1} {incr z1} {
		for {set x1 [expr $x-1]} {$x1<=$x+1} {incr x1} {
			for {set y1 [expr $y-1]} {$y1<=$y+1} {incr y1} {
				#puts "$x1 $y1 $z1 "

				if {$x1==$x&&$y1==$y&&$z1==$z} {continue}

				if {![info exists matrix($x1,$y1,$z1)]} {
					set matrix($x1,$y1,$z1) "."
				} else {
					if {$matrix($x1,$y1,$z1)=="#"} {
						incr active 
					}
				}
			}
		}
	}
	return $active
}


set rounds 6

set y 0
set z 0

foreach line $input {
	set x 0
	foreach status [split $line {}] {
		set matrix($x,$y,$z) $status
		incr x		
	}
	incr y
	
}

foreach {key val} [array get matrix] {
	lassign [split $key ,] x y z
	set active [actives $x $y $z]
}


for {set round 0} {$round<$rounds} {incr round} {

	array set buf [array get matrix]
	foreach {key val} [array get matrix] {
		lassign [split $key ,] x y z

		set active [actives $x $y $z]
		if {$val=="#"} {
			if {$active!=2&&$active!=3} {
				set buf($x,$y,$z) "."
			}
		} else {
			if {$active==3} {
				set buf($x,$y,$z) "#"
			}
		}
			
	}
	array set matrix [array get buf]
	
}

#puts [lsort [array names matrix *,0]]

set count 0
foreach {key val} [array get matrix] {

	if {$val=="#"} {incr count}
	
}
puts $count