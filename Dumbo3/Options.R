### LET'S WRITE AN INPUT FUNCTION

Predict3<-function(x){
  
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
  if(nrow(ex1)>=3){
    p51<-txt.to.words(ex1[1,1]);pred51<-p51[length(p51)]
    p52<-txt.to.words(ex1[2,1]);pred52<-p52[length(p52)]
    p53<-txt.to.words(ex1[3,1]);pred53<-p53[length(p53)]
    pred5<-rbind(pred51,pred52,pred53)
  } else pred5<-NA
}

predict4<-function(x=tokes[2]){
  a<-grep(paste("^",x," ", sep=""),QG0$QuadGram);ex1<-QG0[a,]
  if(nrow(ex1)>=3){
    p41<-txt.to.words(ex1[1,1]);pred41<-p41[length(p41)]
    p42<-txt.to.words(ex1[2,1]);pred42<-p42[length(p42)]
    p43<-txt.to.words(ex1[3,1]);pred43<-p43[length(p43)]
    pred4<-rbind(pred41,pred42,pred43)
  } else pred4<-NA
  pred4
}

predict3<-function(x=tokes[3]){
  a<-grep(paste("^",x," ", sep=""),TG0$TriGram);ex1<-TG0[a,]
  if(nrow(ex1)>=3){
    p31<-txt.to.words(ex1[1,1]);pred31<-p31[length(p31)]
    p32<-txt.to.words(ex1[2,1]);pred32<-p32[length(p32)]
    p33<-txt.to.words(ex1[3,1]);pred33<-p33[length(p33)]
    pred3<-rbind(pred31,pred32,pred33)
  } else pred3<-NA
  pred3
}

predict2<-function(x=tokes[4]){
  a<-grep(paste("^",x," ", sep=""),BG0$BiGram);ex1<-BG0[a,]
  if(nrow(ex1)>=3){
    p21<-txt.to.words(ex1[1,1]);pred21<-p21[length(p21)]
    p22<-txt.to.words(ex1[2,1]);pred22<-p22[length(p22)]
    p23<-txt.to.words(ex1[3,1]);pred23<-p23[length(p23)]
    pred2<-rbind(pred21,pred22,pred23)
  } else pred2<-NA
  pred2
}

finPred5<-predict5()
if(is.na(finPred5[1])){
  finPred4<-predict4()
  if(is.na(finPred4[1])){
    finPred3<-predict3()
    if(is.na(finPred3[1])){
      finPred2<-predict2()
      if(is.na(finPred2[1])){
        print(rbind("Precision: 1-gram",as.character(UG0$UniGram[1]),as.character(UG0$UniGram[2]),as.character(UG0$UniGram[3])))
      }
      else print(rbind("Precision: 2-gram", finPred2))
    }
    else print(rbind("Precision: 3-gram",finPred3))
  }
  else print(rbind("Precision: 4-gram",finPred4))
} 
else print(rbind("Precision: 5-gram",finPred5))
}