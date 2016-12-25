library(tm)
library(dplyr)
library(stringr)
library(wordcloud)
library(memoise)

books <- list ("A Mid Summer Night's Dream" = "summer",
               "The Merchant of Venice" = "merchant",
               "Romeo and Juliet" = "romeo")

getDTM <- memoise(function(book) {
        if (!(book %in% books))
                stop ("Unknown book")
        
        text <- readLines(sprintf("./%s.txt.gz", book), encoding = "UTF-8")
        
        newCorpus = Corpus (VectorSource(text))
        
        newCorpus = tm_map(newCorpus, tolower)
        newCorpus = tm_map(newCorpus, removePunctuation)
        newCorpus = tm_map(newCorpus, removeNumbers)
        newCorpus = tm_map(newCorpus, removeWords, stopwords("english"))
        newCorpus = tm_map(newCorpus, stemDocument)
        newCorpus = tm_map(newCorpus, stripWhitespace)
        newCorpus = tm_map(newCorpus, PlainTextDocument)
        newDTM = DocumentTermMatrix(newCorpus)
        return(newDTM)
}
        )