set input {5,3,2,2,1,1,4,1,5,5,1,3,1,5,1,2,1,4,1,2,1,2,1,4,2,4,1,5,1,3,5,4,3,3,1,4,1,3,4,4,1,5,4,3,3,2,5,1,1,3,1,4,3,2,2,3,1,3,1,3,1,5,3,5,1,3,1,4,2,1,4,1,5,5,5,2,4,2,1,4,1,3,5,5,1,4,1,1,4,2,2,1,3,1,1,1,1,3,4,1,4,1,1,1,4,4,4,1,3,1,3,4,1,4,1,2,2,2,5,4,1,3,1,2,1,4,1,4,5,2,4,5,4,1,2,1,4,2,2,2,1,3,5,2,5,1,1,4,5,4,3,2,4,1,5,2,2,5,1,4,1,5,1,3,5,1,2,1,1,1,5,4,4,5,1,1,1,4,1,3,3,5,5,1,5,2,1,1,3,1,1,3,2,3,4,4,1,5,5,3,2,1,1,1,4,3,1,3,3,1,1,2,2,1,2,2,2,1,1,5,1,2,2,5,2,4,1,1,2,4,1,2,3,4,1,2,1,2,4,2,1,1,5,3,1,4,4,4,1,5,2,3,4,4,1,5,1,2,2,4,1,1,2,1,1,1,1,5,1,3,3,1,1,1,1,4,1,2,2,5,1,2,1,3,4,1,3,4,3,3,1,1,5,5,5,2,4,3,1,4}


set fishes [split $input ,]
set days 256

foreach fish $fishes {
	incr pop($fish)
}

for {set day 0} {$day<$days} {incr day} {
	
	for {set i 1} {$i<9} {incr i} {
		if {[info exists pop($i)]} {
			puts "x $i"
			set buf([expr $i-1]) $pop($i)
		}
	}	
	
	if {[info exists pop(0)]} {
		incr buf(6) $pop(0)
		incr buf(8) $pop(0)
	}
	
		
	array unset pop
	array set pop [array get buf]
	array unset buf
}

set count 0
foreach {key val} [array get pop] {
	
	incr count $val

}

puts $count