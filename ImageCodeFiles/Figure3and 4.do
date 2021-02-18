// Figure 3, 4

set more off
clear

set obs 4
input str50 Inst IsBig IsExpensive 
	"Institution A" 1 1
	"Institution B" 0 1
	"Institution C" 0 0
	"Institution D" 1 0
list



clear

set obs 4
input str50 Inst IsBig IsExpensive isSelect
	"Institution A" 1 1 1
	"Institution B" 0 1 0
	"Institution C" 0 0 0
	"Institution D" 1 0 1
list
