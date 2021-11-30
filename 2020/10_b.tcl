set input {115
134
121
184
78
84
77
159
133
90
71
185
152
165
39
64
85
50
20
75
2
120
137
164
101
56
153
63
70
10
72
37
86
27
166
186
154
131
1
122
95
14
119
3
99
172
111
142
26
82
8
31
53
28
139
110
138
175
108
145
58
76
7
23
83
49
132
57
40
48
102
11
105
146
149
66
38
155
109
128
181
43
44
94
4
169
89
96
60
69
9
163
116
45
59
15
178
34
114
17
16
79
91
100
162
125
156
65}

set input {16
10
15
5
1
11
7
19
6
12
4}
set input {1 4 5 6 7}
set max [lindex [lsort -integer $input] end]
incr max 3

set input [join [list 0 [lsort -integer $input] $max]]
puts $input
set idx 0
set all {}

foreach in $input {
	incr idx
	set adapters 0
	foreach in2 [lrange $input $idx end] {
		if {[expr $in2 - $in<4]} {
			incr adapters 
		}
	}
	if {$adapters!=0} {
		lappend all $adapters
		puts "$in has $adapters"


	}
}

puts $all
set all [lrange $all 1 end-1]
regsub -all "1" $all "" all
puts $all
puts [expr [join $all +] +1]