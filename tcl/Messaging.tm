package provide Messaging 1.0

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