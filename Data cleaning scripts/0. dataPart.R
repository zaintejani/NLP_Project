### TASK 0: Set up data partition###

## Loading raw data into R
blogs<-readLines("./final/en_US/en_US.blogs.txt", encoding="UTF-8")
tweets<-readLines("./final/en_US/en_US.twitter.txt", encoding="UTF-8")
news<-readLines("./final/en_US/en_US.news.txt", encoding="UTF-8")

## Separating data into test and training sets
set.seed(28391)
blogBin<-rbinom(length(blogs), 1, 0.6)
tweetBin<-rbinom(length(tweets), 1, 0.6)
newsBin<-rbinom(length(news), 1, 0.6)

blogTrain<-blogs[blogBin==1];blogTest<-blogs[blogBin==0]
tweeTrain<-tweets[tweetBin==1];tweeTest<-tweets[tweetBin==0]
newsTrain<-news[newsBin==1];newsTest<-news[newsBin==0]

## Saving Training and Testing Sets
writeLines(blogTrain, con="./Train/en_US.blogTrain.txt")
writeLines(tweeTrain, con="./Train/en_US.tweeTrain.txt")
writeLines(newsTrain, con="./Train/en_US.newsTrain.txt")

writeLines(blogTest, con="./Test/en_US.blogTest.txt")
writeLines(tweeTest, con="./Test/en_US.tweeTest.txt")
writeLines(newsTest, con="./Test/en_US.newsTest.txt")