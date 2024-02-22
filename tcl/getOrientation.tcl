source Utils.tm

global DEBUG
# default value
set DEBUG false  


#-------------------------------
proc getOrientation {bBox} {
    global DEBUG
    # validate_struct mat:2:2:$bBox
    lassign [eval list {*}$bBox ] P1x P1y P2x P2y
  
    if { ! [isa_bbox $bBox] } { 
        return false
    }

    set dx [expr {$P2x - $P1x}]
    set dy [expr {$P2y - $P1y}]
    if {abs($dx) > abs($dy)} {
        dprint $DEBUG "H"
        return "H"
    } else {
        dprint $DEBUG "V"
        return "V"
    }
}

package require tcltest

#-------------------------------
proc run_test { tnum retval oval bbox } {
    global DEBUG 
    if { $DEBUG } {
        tcltest::test $tnum "getOrientation $" -body "getOrientation [list $bbox]" -result $retval -output $oval -match regexp
    } else {
        tcltest::test $tnum "getOrientation $" -body "getOrientation [list $bbox]" -result $retval -match regexp
    }
}

#-------------------------------
proc Main {} {
    set ::DEBUG true
    run_test 1 V "" { {0 0} {1 1}}
    run_test 2 H "" { {5 4} {1 1}}
    run_test 3 V "" { {4 6} {1 1}}
    run_test 4 false "-E- Wrong bbox size. Expected 4 values but has 8!" { {4 6 6 7} {1 1 2 3}}
    run_test 5 false "-E- Value in bbox provided is not an integer: 'arbol'" { {arbol a} {2 3}}
    run_test 6 false "-E- Wrong bbox size. Expected 4 values but has 0!" { {} {}}
    run_test 7 V "" { {-4 6} {-1 1}}
    run_test 8 H "" { {4 6} {-3 1}}

    tcltest::cleanupTests
}

#-------------------------------
# Run Main here 
#-------------------------------
Main