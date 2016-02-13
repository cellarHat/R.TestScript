
#### generate "or" realtion format comdition of regular expression
regN = function(nameVector = vector(), patDir = "both"){
  rightD = ""; leftD = "";
  if (logicOR) operator = "|" else operator = "&"
  if (patDir == "both") {rightD = "+";leftD = "+"}else{
    if(patDir == "left") leftD = "+"
    if(patDir == "right") rightD = "+"
  }
  regN = paste(nameVector,collapse = "|") %>% paste(leftD,.,rightD,sep = "")
  return(regN)
}

#### filter the data with regular expression search
dataFilter = 
  function(x = data.frame(), dropS = T,
           keepC = vector(), keepAtt = character(),
           dropC = vector(), dropAtt = character())
  {
    cleanData = data.frame()
    if (dropS){
      eval(parse( text = paste('cleanData = x[which((!(grepl("',regN(dropC),'",dataF$',
            dropAtt,'))&(grepl("',regN(keepC),'",dataF$',
            keepAtt,")))),]",sep = "")))
    }else{
      eval(parse( text = paste('cleanData = x[which(grepl("',regN(keepC),'",dataF$',
                               keepAtt,")),]",sep = "")))
    }
    return(cleanData)
  }

#### extract all file name which fellow the path
fileNameStack = function(path = dir(), format = "csv") {
  nameList = dir(path) %>% .[grep(paste(".",format,sep = ""),.)]
}
