# adventofcode
my tcl stuff for AoC 2018-2021 - just fun

This are no good examples for tcl coding, not at all, please don't expect too much.

In case anybody reads this: My approach, my takeaway, is to keep the solutions as quick and dirty as possible. I do not want to create educational examples good for a tutorial.

Tcl is my language of choice for over 25 years now for quick solutions on more complex tasks in a shell. 

So you won't find things like that:

´´´

set b [lindex c 1]
set a [lreplace $a $b $b "newval"]

#would be

set a [lreplace $a [lindex c 1] [lindex c 1] "newval"]

´´´

Thanks for reading!