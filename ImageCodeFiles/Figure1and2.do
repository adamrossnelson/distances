// Generate Figures 1, 2, 

set more off
clear

// Enter Hypothetical Data
set obs 4
input str50 Inst Size Cost 
	"Institution A" 19000 22000
	"Institution B" 11500  19000
	"Institution C" 7750  12000
	"Institution D" 23000 10500
list


// Generate Visual Figure 2
twoway (scatter Size Cost, mcolor(edkblue) msize(large) msymbol(lgx) mlabel(Inst) mlabsize(large) mlabcolor(edkblue) mlabangle(20)), ytitle(Lower Enrollment               Higher Enrollment) ylabel(, nolabels) xtitle(Lower Cost                                                                                                                                               Higher Cost) xlabel(, nolabels) title(Institutions A B C & D) subtitle((Charted By Size & Cost)) note(Copyright All Rights Reserved Adam Ross Nelson @adamrossnelson) legend(off)

// Save Visual
graph export "/Users/adamnelson/Library/Mobile Documents/com~apple~CloudDocs/Documents/ComparisonGroup/ImageCodeFiles/Figure1.png", as(png) name("Graph") replace


// Generate Visual Figure 2
twoway (scatter Size Cost, mcolor(edkblue) msize(large) msymbol(lgx) mlabel(Inst) mlabsize(large) mlabcolor(edkblue) mlabangle(20)) (pci 23000 10500 11500 10500 11500 10500 11500 19000, lcolor(red)) (pci 23000 10500 11500 19000, lcolor(red) lpattern(dash)) (scatteri 16000 10500 "a2" 12300 15000 "b2" 19000 13750 "c2", msymbol(none)), ytitle(Lower Enrollment               Higher Enrollment) ylabel(, nolabels) xtitle(Lower Cost                                                                                                                                               Higher Cost) xlabel(, nolabels) title(Institutions A B C & D) subtitle((Charted By Size & Cost)) note(Copyright All Rights Reserved Adam Ross Nelson @adamrossnelson) legend(off)

// Save Visual
graph export "/Users/adamnelson/Library/Mobile Documents/com~apple~CloudDocs/Documents/ComparisonGroup/ImageCodeFiles/Figure2.png", as(png) name("Graph") replace





