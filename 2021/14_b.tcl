set input {KFFNFNNBCNOBCNPFVKCP

PB -> F
KC -> F
OB -> H
HV -> N
FS -> S
CK -> K
CC -> V
HF -> K
VP -> C
CP -> S
HO -> N
OS -> N
HS -> O
HB -> F
OH -> V
PP -> B
BS -> N
VS -> F
CN -> B
KB -> O
KH -> B
SS -> K
NS -> B
BP -> V
FB -> S
PV -> O
NB -> S
FC -> F
VB -> P
PC -> O
VF -> K
BV -> K
OO -> B
PN -> N
NH -> H
SP -> B
KF -> O
BN -> F
OF -> C
VV -> H
BB -> P
KN -> H
PO -> C
BH -> O
HC -> B
VO -> O
FV -> B
PK -> V
KO -> H
BK -> V
SC -> S
KV -> B
OV -> S
HK -> F
NP -> V
VH -> P
OK -> S
SO -> C
PF -> C
SH -> N
FP -> V
CS -> C
HH -> O
KK -> P
BF -> S
NN -> O
OC -> C
CB -> O
BO -> V
ON -> F
BC -> P
NO -> N
KS -> H
FF -> V
FN -> V
HP -> N
VC -> F
OP -> K
VN -> S
NV -> F
SV -> F
FO -> V
PS -> H
VK -> O
PH -> P
NF -> N
KP -> S
CF -> S
FK -> P
FH -> F
CO -> H
SN -> B
NC -> H
SK -> P
CV -> P
CH -> H
HN -> N
SB -> H
NK -> B
SF -> H}

regsub "\n\n" $input "|" input
regsub -all "\n" $input "$" input

set chain [lindex [split $input "|" ] 0]

set rules [split [join [lrange [split $input "|"] 1 end] ] "$"]

foreach r $rules {
	set rule([lindex $r 0]) "[string index [lindex $r 0] 0][lindex $r end] [lindex $r end][string index [lindex $r 0] 1]"
}

set rounds 40
set round -1

for {set i 0} {$i<[string length $chain]-1} {incr i} {
	incr pairs([string range $chain $i $i+1]) 
}
	
while {[incr round]<$rounds} {
	
	foreach {key val} [array get pairs] {
		incr buf([lindex $rule($key) 0]) $val
		incr buf([lindex $rule($key) 1]) $val
	}

	array unset pairs
	array set pairs [array get buf]
	array unset buf
}

foreach {key val} [array get pairs] {
	incr letters([string index $key 0]) $val
	incr letters([string index $key 1]) $val
}

foreach {l count} [array get letters] {
	lappend sort [list $l [expr ($count-1)/2+1]]
}

puts [ expr [lindex [lsort -index 1 -integer $sort] end 1 ] -  [lindex [lsort -index 1 -integer $sort] 0 1 ]]