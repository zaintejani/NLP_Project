### Sample Creation ###

## Reading the training sets into R
blogTrain<-readLines("./Train/en_US.blogTrain.txt")
tweeTrain<-readLines("./Train/en_US.tweeTrain.txt")
newsTrain<-readLines("./Train/en_US.newsTrain.txt")

## Sampling from the training sets to allow for effective computation. Sample still seems a bit large,
## Resulting Corpus is large and computations still somewhat slow
blogS<-sample(blogTrain, round(length(blogTrain)*0.1))
tweetS<-sample(tweeTrain, round(length(tweeTrain)*0.1))
newS<-sample(newsTrain, round(length(newsTrain)*0.1))
sample2<-c(blogS,tweetS,newS)

## Removing unused data from the environment
rm(list=c("blogTrain","tweeTrain","newsTrain"))
rm(list=c("blogS","tweetS","newS"))

## Saving the sample taken to a text file
writeLines(sample2,con="./Train/Sample/en_US.sample.txt")
