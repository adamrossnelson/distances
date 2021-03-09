
set more off
clear all

capture program drop ndist
program ndist
    syntax varlist(min=2 numeric) [if] [in], center(varname) ofint(varname)

    assert `center' != `ofint'  if `center' == `1'
    assert `ofint'  != `center' if `ofint'  == `1'

    tokenize `varlist'

    local nv : word count `varlist'
    di `nv'

    forvalues nvar = 2/`nv' {
        di `nvar'
    }
end

sysuse auto, clear
gen my_center = _n == 1
gen my_int = _n == 10

ndist length weight mpg price, center(my_center) ofint(my_int)

tab my_center my_int

capture program drop ndist
program ndist
    matrix input p = (5,4,9)
    matrix input q = (18,11,12)
    matrix diffs = p - q
    forval i = 1/`= colsof(diffs)' {
        matrix diffs[1, `i'] = diffs[1, `i'] * diffs[1, `i']
    }
    local sumsof = 0
    forval i = 1/`= colsof(diffs)' {
        local sumsof = `sumsof' + diffs[1, `i']
    }
    di sqrt(`sumsof')
end

ndist
