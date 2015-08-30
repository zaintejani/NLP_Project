### LET'S WRITE AN INPUT FUNCTION

PredictMe<-function(x){
  
  ### x is the string input, CLEAN before tokenizing! (lowecase, no punc, stem)
  
  cleaners<-function(x){
    x<-gsub("[0-9]", "",x);x<-gsub("[[:punct:]]", "",x);x<-tolower(x)
    x<-txt.to.words(x)
    x<-wordStem(x, language="english")
  }
  
  x<-cleaners(x)
  
  if(length(x)>=4) {d4<-make.ngrams(x, 4)} else d4<-NA
  if(length(x)>=3) {d3<-make.ngrams(x, 3)} else d3<-NA
  if(length(x)>=2) {d2<-make.ngrams(x, 2)} else d2<-NA
  
  tokes<-c(d4[length(d4)],d3[length(d3)],d2[length(d2)], x[length(x)])

### Writing functions per order of accuracy, idea is more=better.
  
predict5<-function(x=tokes[1]){
  a<-grep(paste("^",x," ", sep=""),PG0$PentGram);ex1<-PG0[a,]
  p5<-txt.to.words(ex1[1,1]);pred5<-p5[length(p5)]
  pred5
}

predict4<-function(x=tokes[2]){
  a<-grep(paste("^",x," ", sep=""),QG0$QuadGram);ex1<-QG0[a,]
  p4<-txt.to.words(ex1[1,1]);pred4<-p4[length(p4)]
  pred4
}

predict3<-function(x=tokes[3]){
  a<-grep(paste("^",x," ", sep=""),TG0$TriGram);ex1<-TG0[a,]
  p3<-txt.to.words(ex1[1,1]);pred3<-p3[length(p3)]
  pred3
}

predict2<-function(x=tokes[4]){
  a<-grep(paste("^",x," ", sep=""),BG0$BiGram);ex1<-BG0[a,]
  p2<-txt.to.words(ex1[1,1]);pred2<-p2[length(p2)]
  pred2 
}

finPred5<-predict5()
if(is.na(finPred5)){
  finPred4<-predict4()
  if(is.na(finPred4)){
    finPred3<-predict3()
    if(is.na(finPred3)){
      finPred2<-predict2()
      if(is.na(finPred2[1])){
        print(rbind("Precision: 1-gram",as.character(UG0$UniGram[1])))
      }
      else print(rbind("Precision: 2-gram",finPred2))
    }
    else print(rbind("Precision: 3-gram",finPred3))
  }
  else print(rbind("Precision: 4-gram",finPred4))
  } 
else print(rbind("Precision: 5-gram",finPred5))
}