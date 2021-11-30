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

set input2 {28
33
18
42
31
14
46
20
48
47
24
23
49
45
19
38
39
11
1
32
25
35
8
17
7
9
4
2
34
10
3}

set max [lindex [lsort -integer $input] end]
incr max 3

set input [join [list 0 [lsort -integer $input] $max]]

set idx 0

foreach in $input {
	incr idx
	set diff [expr [lindex $input $idx] -$in]
	if {$diff<1} {break}
	incr diffs($diff)		
	puts $diff
	
	
}

puts [array get diffs]
puts [expr $diffs(1)*$diffs(3)]