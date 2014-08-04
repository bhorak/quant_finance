## function will use quantmod to download series of time series data
## save it to the global enviroment as xts objects
## it will also output this data into either an .csv format or
## the xlts format in a specified file and location


fin_get_series<-function(tickers,file_type="csv") {
    require(quantmod,quietly=True)
    
    ## gets the xts numbers and spits them out to the global env.
    ## the normal source is yhoo finance i believe
    ## I specify globalenv assuming, otherwise this meghod does not work
    ## maybe explore the lex scoping methods using "<<-"
    getSymbols(tickers,env=globalenv(),warnings = FALSE)
    
    ## checks wether the preffered format is csv 
    if (file_type=="csv") {
        require(zoo, quietly=True)
        write_csv(tickers)
        
    }
    
}
## writes the xts time series objects into an csv file
## use the zoo package to convert xts object into a
## zoo so I can use the write.zoo function bc
## xts package still has no write method


write_csv<-function(tickers) {
    ## iterates over the tickers vector and prints out the 
    ## corresponding csv  file
    for (i in 1:length(tickers)) {
        ## I turn the ticker string in the vector into 
        ## a corresponding variable name
        name<-get(tickers[i])
        series<-as.zoo(name)
        write.zoo(series,file=paste(tickers[i],"csv",sep="."),sep=",")
        
    }    
    
}
