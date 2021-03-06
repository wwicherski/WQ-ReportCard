orgList_validate = function(characteristicNames, Units, valueType, standardType, standard){
  Data <- get("Data", envir = parent.frame())
  parameterNames = unlist(strsplit(characteristicNames, split = ";")) #Retrieve all the possible parameter names
  parameterNames = parameterNames[parameterNames != ""] #Remove empty elements from the vector
  unitList = c("None", "", Units) #include 'None' and blank values as a unit to capture non-detects and unitless data like pH 
  dataSet = Data[Data$CharacteristicName %in% parameterNames & Data$ResultSampleFractionText %in% valueType & Data$ResultMeasure.MeasureUnitCode  %in% unitList,] #subset the data
  Organizations = paste(unique(as.vector(dataSet$OrganizationIdentifier)), collapse=",") #list the unique organizations
  return(Organizations)
}