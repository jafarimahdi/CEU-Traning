library(jsonlite)
# readk a local json file 

# 2- read the webApp.json file 
readWebApp <- fromJSON('webApp.json', simplifyDataFrame = F)
readWebApp$`web-app`$servlet[[5]]$`sevlet-name`
readWebApp$`web-app`$servlet[[5]]


