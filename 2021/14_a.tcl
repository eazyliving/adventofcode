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
foreach rule $rules {
	lappend r [list [lindex $rule 0] [lindex $rule end]]
}

set rules $r

set rounds 10
set round -1

while {[incr round]<$rounds} {
	set buf ""
	for {set i 0} {$i<[string length $chain]-1} {incr i} {
	
		if {$i==0} {append buf [string index $chain $i]}
		append buf [lindex $rules [lsearch -index 0 $rules [string range $chain $i $i+1]] 1][string index $chain $i+1]
		
	}
	set chain $buf
}

foreach letter [lsort -unique [split $chain {}]] {
	lappend sort [list $letter [llength [lsearch -all [split $chain {}] $letter]]]
}

puts [ expr [lindex [lsort -index 1 -integer $sort] end 1 ] -  [lindex [lsort -index 1 -integer $sort] 0 1 ]]