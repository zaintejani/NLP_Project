## Data truncation and reformat ##

UG<-read.table("./UniGram.txt", header=TRUE)
BG<-read.table("./BiGram.txt", header=TRUE)
TG<-read.table("./TriGram.txt", header=TRUE)
QG<-read.table("./QuadGram.txt", header=TRUE)
PG<-read.table("./PentGram.txt", header=TRUE)

## Data truncation: removing unique instances, as low chance of repeatabiity
UG0<-UG[UG$Freq>1,]
BG0<-BG[BG$Freq>1,]
TG0<-TG[TG$Freq>1,]
QG0<-QG[QG$Freq>1,]
PG0<-PG[PG$Freq>1,]

## Default UniGram response, entire table not required
UGd<-head(UG0)

write.table(UG0,"./UniGramShort.txt")
write.table(BG0,"./BiGramShort.txt")
write.table(TG0,"./TriGramShort.txt")
write.table(QG0,"./QuadGramShort.txt")
write.table(PG0,"./PentGramShort.txt")

write.table(UGd,"./UniGramDefault.txt")

rm("UG","BG","TG","QG","PG")
UG0<-UGd;rm("UGd")

## Saving data session in .Rdata format, loads quicker than tables
save(list = ls(all.names = TRUE), file = "session.RData", envir = .GlobalEnv)