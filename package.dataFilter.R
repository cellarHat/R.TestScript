##### this script is made for condiction choose of data in regular expression
##### only dependency is magrittr

require(magrittr)
# regN is condiction generator for regular expression
regN = function(nameVector = vector(), patDir = "both"){
#### edit:  take the regular expression in direction depend
  rightD = ""; leftD = "";
  if (logicOR) operator = "|" else operator = "&"
  if (patDir == "both") {rightD = "+";leftD = "+"}else{
    if(patDir == "left") leftD = "+"
    if(patDir == "right") rightD = "+"
  }
  regN = paste(nameVector,collapse = "|") %>% paste(leftD,.,rightD,sep = "")
  return(regN)
}

#dataFilter is determine which data is we want
#drop switch can help you skip some data not concern
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
