#read in datasets
myTop <- read.csv("../datasets/MyTop100.csv", sep="\t", header=TRUE, row.names=NULL)
spotifyTop <- read.csv("../datasets/SpotifyTop100.csv", sep="\t", header=TRUE, row.names=NULL)


#delete whats not goong to be used
myTop$type <-NULL
myTop$analysis_url<-NULL
myTop$track_href<-NULL
myTop$uri<-NULL
myTop$id<-NULL
spotifyTop$type <-NULL
spotifyTop$analysis_url<-NULL
spotifyTop$track_href<-NULL
spotifyTop$uri<-NULL
spotifyTop$id<-NULL

#ensuring we have no N/A OR NULL values in the dataset
sapply(myTop, function(x) sum(is.na(x)))
sapply(spotifyTop, function(x) sum(is.na(x)))

#merging data sets
#because they have the same column names I will rename them to identfy what datasset they belong to
#myTop <- setNames(myTop, c("myTop.danceability", "myTop.energy", "myTop.key", "myTop.loudness", "myTop.mode", "myTop.speechiness", "myTop.acousticness", "myTop.instrumentalness", "myTop.liveness", "myTop.valence", "myTop.tempo", "myTop.duration_ms", "myTop.time_signature", "myTop.name", "myTop.length"))
#spotifyTop <- setNames(spotifyTop, c("spotifyTop.danceability", "spotifyTop.energy", "spotifyTop.key", "spotifyTop.loudness", "spotifyTop.mode", "spotifyTop.speechiness", "spotifyTop.acousticness", "spotifyTop.instrumentalness", "spotifyTop.liveness", "spotifyTop.valence", "spotifyTop.tempo", "spotifyTop.duration_ms", "spotifyTop.time_signature","spotifyTop.name", "spotifyTop.length"))

#see what we have so far
summary(myTop)
summary(spotifyTop)

#merge & remove duplicate entries
#merge(myTop,spotifyTop)
#combined <- combined[-c(101:10000), ]
#data<-NULL
#rm(data)
#combined <- rbind(myTop, spotifyTop)
#rm(combined)
#library(dplyr)
#data<-full_join(myTop, spotifyTop, by=)
#library(data.table)
#data<-setDT(myTop,keep.rownames=T); setDT(spotifyTop,keep.rownames=T)
#myTop[spotifyTop,on="rn"]

###################################################
#                   formatting                    #      
###################################################

#myTop100
myTop$danceability<-format(round(myTop$danceability, 1), nsmall = 1)
myTop$danceability<-as.numeric(myTop$danceability)
myTop$energy<-format(round(myTop$energy, 1), nsmall = 1)
myTop$energy<-as.numeric(myTop$energy)
myTop$tempo<-format(round(myTop$tempo, 0), nsmall = 0)
myTop$tempo<-as.numeric(myTop$tempo)
myTop$loudness<-format(round(myTop$loudness, 1), nsmall = 1)
myTop$loudness<-as.numeric(myTop$loudness)
myTop$speechiness<-format(round(myTop$speechiness, 2), nsmall = 2)
myTop$speechiness<-as.numeric(myTop$speechiness)
myTop$acousticness<-format(round(myTop$acousticness, 2), nsmall = 2)
myTop$acousticness<-as.numeric(myTop$acousticness)
myTop$instrumentalness<-format(round(myTop$instrumentalness, 2), nsmall = 2)
myTop$instrumentalness<-as.numeric(myTop$instrumentalness)
myTop$liveness<-format(round(myTop$liveness, 2), nsmall = 2)
myTop$liveness<-as.numeric(myTop$liveness)
myTop$valence<-format(round(myTop$valence, 1), nsmall = 1)
myTop$valence<-as.numeric(myTop$valence)
myTop$name<- as.character(myTop$name)
#SpotifyTop100
spotifyTop$danceability<-format(round(spotifyTop$danceability, 1), nsmall = 1)
spotifyTop$danceability<-as.numeric(spotifyTop$danceability)
spotifyTop$energy<-format(round(spotifyTop$energy, 1), nsmall = 1)
spotifyTop$energy<-as.numeric(spotifyTop$energy)
spotifyTop$tempo<-format(round(spotifyTop$tempo, 0), nsmall = 0)
spotifyTop$tempo<-as.numeric(spotifyTop$tempo)
spotifyTop$loudness<-format(round(spotifyTop$loudness, 1), nsmall = 1)
spotifyTop$loudness<-as.numeric(spotifyTop$loudness)
spotifyTop$speechiness<-format(round(spotifyTop$speechiness, 2), nsmall = 2)
spotifyTop$speechiness<-as.numeric(spotifyTop$speechiness)
spotifyTop$acousticness<-format(round(spotifyTop$acousticness, 2), nsmall = 2)
spotifyTop$acousticness<-as.numeric(spotifyTop$acousticness)
spotifyTop$instrumentalness<-format(round(spotifyTop$instrumentalness, 2), nsmall = 2)
spotifyTop$instrumentalness<-as.numeric(spotifyTop$instrumentalness)
spotifyTop$liveness<-format(round(spotifyTop$liveness, 2), nsmall = 2)
spotifyTop$liveness<-as.numeric(spotifyTop$liveness)
spotifyTop$valence<-format(round(spotifyTop$valence, 1), nsmall = 1)
spotifyTop$valence<-as.numeric(spotifyTop$valence)
spotifyTop$name<- as.character(spotifyTop$name)

####################################################
#                   mean values                     #
####################################################

#BPMS
myAvgTempo<- mean(myTop$tempo)
spotifyAvgTempo<-mean(spotifyTop$tempo)

#DANCEABILITY
myAvgDance<- mean(myTop$danceability)
spotifyAvgDance<-mean(spotifyTop$danceability)

#SONG DURATION
myAvgLen<- mean(myTop$length)
spotifyAvgLen<-mean(spotifyTop$length)

#HAPPINESS(VALENCE)
myAvgVal<-mean(myTop$valence)
spotifyAvgVal<-mean(spotifyTop$valence)

###################################################
#                   Histograms                    #      
###################################################


hist(myTop$tempo, 
     main="Histogram of my top 100 songs 2017 - Tempo(bpm)", 
     xlab="myTop.tempo", 
     border="blue", 
     col="green",
     xlim=c(20,250),
     las=1, 
     breaks=10)

hist(spotifyTop$tempo, 
     main="Histogram of spotify top 100 songs 2017 - Tempo(bpm)", 
     xlab="spotifyTop.tempo", 
     border="blue", 
     col="green",
     xlim=c(20,250),
     las=1, 
     breaks=10)

hist(myTop$length, 
     main="Histogram of spotify top 100 songs 2017 - length", 
     xlab="myTop.length", 
     border="blue", 
     col="green",
     xlim=c(0,12),
     las=1, 
     breaks=10)

hist(spotifyTop$length, 
     main="Histogram of spotify top 100 songs 2017 - length", 
     xlab="myTop.length", 
     border="blue", 
     col="green",
     xlim=c(0,12),
     las=1, 
     breaks=10)



#######################################
#               ggplot2               #
#######################################
#install.packages("ggplot2")
#load package and data
options(scipen=999)  # turn-off scientific notation like 1e+48
library(ggplot2)
theme_set(theme_bw())  # pre-set the bw theme.
# Scatterplot
loud_vs_acoustic <- ggplot(spotifyTop, aes(x=loudness, y=acousticness)) + 
  geom_point(aes(col=loudness, size=acousticness)) + 
  geom_smooth(method="loess", se=F) + 
  xlim(c(-15,1 )) + 
  ylim(c(0, 1)) + 
  labs(subtitle="loudness Vs acousticness", 
       y="acousticness", 
       x="lodness", 
       title="Scatterplot", 
       caption = "Source: Spotify top 100 tracks via Spotify API")

plot(loud_vs_acoustic)

# Scatterplot
loud_vs_acoustic2 <- ggplot(myTop, aes(x=loudness, y=acousticness)) + 
  geom_point(aes(col=loudness, size=acousticness)) + 
  geom_smooth(method="loess", se=F) + 
  xlim(c(-15,1 )) + 
  ylim(c(0, 1)) + 
  labs(subtitle="loudness Vs acousticness", 
       y="acousticness", 
       x="lodness", 
       title="Scatterplot", 
       caption = "Source: Spotify top 100 tracks via Spotify API")

plot(loud_vs_acoustic2)

# Scatterplot
tempo_vs_key <- ggplot(spotifyTop, aes(x=tempo, y=key)) + 
  geom_point(aes(col=tempo, size=key)) + 
  geom_smooth(method="loess", se=F) + 
  xlim(c(20,200 )) + 
  ylim(c(0, 15)) + 
  labs(subtitle="tempo Vs key", 
       y="key", 
       x="tempo", 
       title="Scatterplot", 
       caption = "Source: Spotify top 100 tracks via Spotify API")

plot(tempo_vs_key)

# Scatterplot
tempo_vs_key2 <- ggplot(myTop, aes(x=tempo, y=key)) + 
  geom_point(aes(col=tempo, size=key)) + 
  geom_smooth(method="loess", se=F) + 
  xlim(c(20,200 )) + 
  ylim(c(0, 15)) + 
  labs(subtitle="tempo Vs key", 
       y="key", 
       x="tempo", 
       title="Scatterplot", 
       caption = "Source: Spotify my 100 tracks via Spotify API")

plot(tempo_vs_key2)


# spotify top -> dance vs happy
theme_set(theme_bw())  # pre-set the bw theme.
dance_and_happy <- ggplot(spotifyTop, aes(danceability, valence))
dance_and_happy + geom_count(col="tomato3", show.legend=F) +
  labs(subtitle="spotifyTop: danceability vs valence", 
       y="valence", 
       x="danceability", 
       title="Counts Plot")

# my top -> dance vs happy
theme_set(theme_bw())  # pre-set the bw theme.
dance_and_happy <- ggplot(myTop, aes(danceability, valence))
dance_and_happy + geom_count(col="tomato3", show.legend=F) +
  labs(subtitle="myTop: danceability vs valence", 
       y="valence", 
       x="danceability", 
       title="Counts Plot")


# Plot
spotify_valence <- ggplot(spotifyTop, aes(valence))
spotify_valence + geom_density(aes(fill=factor(valence)), alpha=0.8) + 
  labs(title="Density plot", 
       subtitle="City Mileage Grouped by Number of cylinders",
       caption="Source: Spotify API",
       x="City Mileage",
       fill="# Cylinders")

# Plot
spotify_danceability <- ggplot(spotifyTop, aes(danceability))
spotify_danceability + geom_density(aes(fill=factor(danceability)), alpha=0.9) + 
  labs(title="Density plot", 
       subtitle="How much of a factor is danceability to the mostppular sings of the year?",
       caption="Source: Spotify API",
       x="danceability",
       fill="# danceability values")

#time signature
spotify_time_signature <- ggplot(spotifyTop, aes(time_signature))
spotify_time_signature + geom_density(aes(fill=factor(time_signature)), alpha=0.9) + 
  labs(title="Density plot", 
       subtitle="How much of a factor is time signature to the most popular sings of the year?",
       caption="Source: Spotify API",
       x="danceability",
       fill="# danceability values")

#keys
# Plot
spotify_key <- ggplot(spotifyTop, aes(key, tempo))
spotify_key + geom_bar(stat="identity", width = 0.5, fill="tomato2") + 
  labs(title="Bar Chart", 
       subtitle="key vs tempo", 
       caption="Source: Spotify API") +
  theme(axis.text.x = element_text(angle=65, vjust=0.6))

my_key <- ggplot(myTop, aes(key, tempo))
my_key + geom_bar(stat="identity", width = 0.5, fill="tomato2") + 
  labs(title="Bar Chart", 
       subtitle="key vs tempo", 
       caption="Source: Spotify API") +
  theme(axis.text.x = element_text(angle=65, vjust=0.6))

# valence_vs_acoustic
valence_vs_acoustic <- ggplot(spotifyTop, aes(valence, acousticness))
valence_vs_acoustic + geom_jitter(width = .5, size=1) +
  labs(subtitle="spotify: valence vs acousticness", 
       y="acousticness", 
       x="valence", 
       title="Jittered Points")

valence_and_dance <- ggplot(spotifyTop, aes(valence, danceability))
valence_and_dance + geom_jitter(width = .5, size=1) +
  labs(subtitle="spotify: valence vs dance", 
       y="danceability", 
       x="valence", 
       title="Jittered Points")


valence_and_dance2 <- ggplot(spotifyTop, aes(valence, danceability))
# Scatterplot
valence_and_dance2 + geom_point() + 
  geom_smooth(method="lm", se=F) +
  labs(subtitle="spotify API: valence vs danceability", 
       y="danceability", 
       x="valence", 
       title="Scatterplot with overlapping points", 
       caption="Source: spotify")

dance_and_time <- ggplot(spotifyTop, aes(length, danceability))
# Scatterplot
dance_and_time + geom_point() + 
  geom_smooth(method="lm", se=F) +
  labs(subtitle="spotify API: length vs danceability", 
       y="danceability", 
       x="length", 
       title="Scatterplot with overlapping points", 
       caption="Source: spotify")


#MAP REDUCE TIME
#install.packages("rio")
#library("rio")
#write.csv(myTop, "../datasets/MyTop100.csv")
#write.csv(spotifyTop, "../datasets/SpotifyTop100.csv")


write.table(myTop, "../mapreduce/MyTop100.txt",sep="\t", quote = FALSE, row.names = FALSE)
write.table(spotifyTop, "../mapreduce/SpotifyTop100.txt",sep="\t", quote = FALSE, row.names = FALSE)






