## Corpus creation, cleaning functions, and table setup ##
library(tm);library(stylo);library(SnowballC)

Corp2<-VCorpus(DirSource("./Train/Sample"))

Corp2<-tm_map(Corp2, content_transformer(tolower))

## Profanity filter
BLEEP<-readLines("./profanity.txt");Corp2<-tm_map(Corp2, removeWords, BLEEP)

Corp2<-tm_map(Corp2, stripWhitespace)
Corp2<-tm_map(Corp2, removeNumbers)
Corp2<-tm_map(Corp2, removePunctuation)
Corp2<-tm_map(Corp2, stemDocument)

## Removing stopwords from the unigram dataset
Corp1<-tm_map(Corp2, removeWords,stopwords("english"))

## Converting from class VCorpus to class character for easier data manipulation
tCorp<-txt.to.words(Corp2)
UniGram<-txt.to.words(Corp1)

BiGram<-make.ngrams(tCorp,ngram.size=2)
TriGram<-make.ngrams(tCorp,ngram.size=3)
QuadGram<-make.ngrams(tCorp,ngram.size=4)
PentGram<-make.ngrams(tCorp,ngram.size=5)

UG<-as.data.frame(table(UniGram));UG<-UG[order(UG$Freq, decreasing=TRUE),]
BG<-as.data.frame(table(BiGram));BG<-BG[order(BG$Freq, decreasing=TRUE),]
TG<-as.data.frame(table(TriGram));TG<-TG[order(TG$Freq, decreasing=TRUE),]
QG<-as.data.frame(table(QuadGram));QG<-QG[order(QG$Freq, decreasing=TRUE),]
PG<-as.data.frame(table(PentGram));PG<-PG[order(PG$Freq, decreasing=TRUE),]

write.table(UG,"./UniGram.txt")
write.table(BG,"./BiGram.txt")
write.table(TG,"./TriGram.txt")
write.table(QG,"./QuadGram.txt")
write.table(PG,"./PentGram.txt")
