set input {2524255331
1135625881
2838353863
1662312365
6847835825
2185684367
6874212831
5387247811
2255482875
8528557131}

proc do {code while cond} {
    tailcall try $code\n[list $while $cond $code]
}

proc flash {x y buf} {

	for {set dx -1} {$dx<=1} {incr dx} {
		for {set dy -1} {$dy<=1} {incr dy} {
			if {$dx==0&&$dy==0} {continue}
			set o [lindex $buf $dy+$y $dx+$x]
			if {$o!="" && $o!=0} {
				lset buf $dy+$y $dx+$x [expr $o+1]
			}
		}
	}
	
	lset buf $y $x 0
	return $buf

}

set flashes 0
set steps 100
set oct {}
set step 1

foreach line [split $input "\n"] {
	lappend oct [split $line {}]	
}


while {$step<=$steps} {
	
	set oct [lmap line $oct {lmap o $line {expr $o+1}}]	
	
	do {
		
		set y 0
		set flashed 0
		foreach line $oct {
		
			set x 0
		
			foreach o $line {
			
				if {$o>9} {
					set flashed 1
					incr flashes
					set oct [flash $x $y $oct]
				}
			
				incr x
			}
			incr y
			
		}

	} while {$flashed!=0}

	incr step
	
}

puts $flashes