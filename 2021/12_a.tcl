set input {start-kc
pd-NV
start-zw
UI-pd
HK-end
UI-kc
pd-ih
ih-end
start-UI
kc-zw
end-ks
MF-mq
HK-zw
LF-ks
HK-kc
ih-HK
kc-pd
ks-pd
MF-pd
UI-zw
ih-NV
ks-HK
MF-kc
zw-NV
NV-ks}

set input {start-A
start-b
A-c
A-b
b-d
A-end
b-end}

proc room {this to} {

	global cave
	lappend cave($this) [list $to]
	set cave($this) [lsort -unique $cave($this)]
	
}


foreach line $input {

	lassign [split $line "-"] start end
	lappend cave($start) [list $end]
	lappend cave($end) [list $start]
}

unset cave(end)

foreach {key val} [array get cave] {
	if ($key=="start") {continue}
	# Höhle mit nur einem Ein/Ausgang löschen, wenn der klein ist
	if {[llength $val]>1} {continue}
	puts "$key $val"
	# Muss die Höhle auch klein sein? Überprüfen!

	if {[string tolower $val]==$val} {
		unset cave($key)
		foreach {key2 val2} [array get cave] {
			set f [lsearch $val2 $key]
			if {$f!=-1} {
				set cave($key2) [lreplace $val2 $f $f]
			}
		}
	}
}

puts "----"
puts [array get cave]

set pathes {}

set point start
array set buf [array get cave]
array set original [array get cave]

while {$point!="end"} {
	puts "p $point"
	lappend path $point
	set point [lindex $buf($point) end]
	if {$point=="end"} {break}
	set buf($point) [lreplace $buf($point) end end]
}

lappend path end
puts $path