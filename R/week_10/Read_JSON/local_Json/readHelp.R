library(jsonlite)


# fromJSON( )  it will make dataFram automatically form the file
# readJSON( ) it just read the file and do the process 

# reading the "help" form the 'help.json' file 

# read as dataFrame and the first way 
readHelp <- fromJSON('help.json')
readHelp$menu$items$id[21]


# read as list for second way 
readAsList <- read_json('help.json')
readAsList$menu$items[[21]]$id


