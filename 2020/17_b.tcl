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

proc actives {x y z w} {
	
	global matrix
	
	set active 0
	for {set z1 [expr $z-1]} {$z1<=$z+1} {incr z1} {
		for {set x1 [expr $x-1]} {$x1<=$x+1} {incr x1} {
			for {set y1 [expr $y-1]} {$y1<=$y+1} {incr y1} {
				for {set w1 [expr $w-1]} {$w1<=$w+1} {incr w1} {

					if {$x1==$x&&$y1==$y&&$z1==$z&&$w1==$w} {continue}

					if {![info exists matrix($x1,$y1,$z1,$w1)]} {
						set matrix($x1,$y1,$z1,$w1) "."
					} else {
						if {$matrix($x1,$y1,$z1,$w1)=="#"} {
							incr active 
						}
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
set w 0

foreach line $input {
	set x 0
	foreach status [split $line {}] {
		set matrix($x,$y,$z,$w) $status
		incr x		
	}
	incr y
	
}

foreach {key val} [array get matrix] {
	lassign [split $key ,] x y z w
	set active [actives $x $y $z $w]
}


for {set round 0} {$round<$rounds} {incr round} {
	array set buf [array get matrix]
	foreach {key val} [array get matrix] {
		lassign [split $key ,] x y z w

		set active [actives $x $y $z $w]
		if {$val=="#"} {
			if {$active!=2&&$active!=3} {
				set buf($x,$y,$z,$w) "."
			}
		} else {
			if {$active==3} {
				set buf($x,$y,$z,$w) "#"
			}
		}
			
	}
	array set matrix [array get buf]
	
}

set count 0
foreach {key val} [array get matrix] {

	if {$val=="#"} {incr count}
	
}
puts $count