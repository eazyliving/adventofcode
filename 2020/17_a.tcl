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

set matrix [list 0 $input]

proc actives {x y z} {

	for {set z1 [expr $z-1]} {$z1<=$z+1} {incr z1} {
		for {set x1 [expr $x-1]} {$x1<=$x+1} {incr x1} {
			for {set y1 [expr $x-1]} {$y1<=$y+1} {incr y1} {
				if {$x1==$x&&$y1==$y&&$z1==$z} {continue}
				puts "$x1 $y1 $z1"
	
			}
		}
	}
}

actives 0 0 0