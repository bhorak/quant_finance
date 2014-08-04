## specify lookup parametes and save for
## future sessions

## get a bunch of securities time series quickly and easily
## script provided by Jeff Ryan

options(warn=-1) # will supress the warnings for this script
setSymbolLookup(YHOO='google',GOOG='yahoo')
setSymbolLookup(DEXJPUS='FRED')
setSymbolLookup(XPTUSD=list(name="XPT/USD",src="oanda"))
saveSymbolLookup(file="mysymbols.rda")

# new sessions call loadSymbolLookup(file="mysymbols.rda") 

getSymbols(c("YHOO","GOOG","DEXJPUS","XPTUSD"))

options(warn=0) # turns the warning back on