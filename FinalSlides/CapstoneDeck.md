Capstone App Pitch: Dumbo
========================================================
author: Zain Tejani
date: Mon Apr 27 16:19:44 2015

Introduction
========================================================

Meet Dumbo, your friendly simple backoff-model based word predictor.

Dumbo uses data from 1, 2, 3, 4, and 5-gram datasets to predict the next word in a sentence.

Given the complex nature and large amount of language data, it is impossible to train for complete accuracy. Hence, the suggestions provided by Dumbo may not be entirely contextually relevant, but definitely the most likely, and usually gramatically correct.

Features and Restrictions
==========

- Stemmed output: Dumbo might sometimes output stemmed suggestions. This helps accuracy by increasing token frequency. However, some proper nouns do not generate as intended. For instance, "Youtube" becomes "youtub".

- Profanity Recognition: Dumbo is an app with good manners, and doesn't know any bad words. Feeding Dumbo profane terms might result in the default (1-gram) response

- Limited dictionary: Dumbo is helpful, but is limited in knowledge. It recognizes approximately 40,000 distinct unigrams (not including stopwords). However, it is likely to encounter unknown words, for which the default response is the most freqent unigram terms.

About the app (technical)
========================================================

- Data: Dumbo uses 5 datasets, from unigrams to 5-grams. In order to ensure the sensibility of the tokens used, only tokens with 2 or more observations were included. The idea behind this is that a token of frequency 1 could not be expected to be repeated. Truncating the data in this manner greatly helped reduce the size of the objects.

- Other versions: Dumbo has another version, Dumbo3, which works on essentially the sampe principle as Dumbo. The only difference is that Dumbo3 provides the 3 most likely suggestions instead of just 1.

Sample Output
========================================================
Input Statement: "Hello, what a beautiful"

Sample Output: Dumbo

```
         [,1]               
         "Precision: 4-gram"
finPred4 "day"              
```

Sample Output: Dumbo3

```
       [,1]               
       "Precision: 3-gram"
pred31 "day"              
pred32 "thing"            
pred33 "weekend"          
```
