package provide Utils 1.0

#-----------------------------------------------------------------
# check if var is an integer
#-----------------------------------------------------------------
proc isa_int {foo} {
    if {[string is double -strict $foo]} {
        return true
    }
    return false
}

#-----------------------------------------------------------------
# check if var has 4 values and that all of them are integers
#-----------------------------------------------------------------
proc isa_bbox { bBox } {
    lassign [eval list {*}$bBox ] P1x P1y P2x P2y

    set num_vals [llength [eval list {*}$bBox] ] 
    if { $num_vals != 2*2 } {
        eprint "Wrong bbox size. Expected 4 values but has $num_vals!"
        return false
    }
    foreach coord [eval list {*}$bBox]  {
        if { ! [isa_int $coord] } {
            eprint "Value in bbox provided is not an integer: '$coord'"
            return false
        }
    }
    return true
}

#-----------------------------------------------------------------
# informational print:
# normal print with '-I- ' prefix and log it
#-----------------------------------------------------------------
proc iprint {msg} {
    puts "-I- $msg "
}

#-----------------------------------------------------------------
# warning print:
# print in yellow with '-W- ' prefix and log it
#-----------------------------------------------------------------
proc wprint {msg} {
    puts "-W- $msg "
}

#-----------------------------------------------------------------
# error print:
# print in red with '-E- ' prefix and log it
#-----------------------------------------------------------------
proc eprint {msg} {
    puts "-E- $msg "
}

#-----------------------------------------------------------------
# dprint:
# normal print with '-D- ' prefix and log it
#-----------------------------------------------------------------
proc dprint {debug msg} {
    if { $debug } { 
       puts "-D- $msg "
    }
}
