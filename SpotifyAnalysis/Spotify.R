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
myTop <- setNames(myTop, c("myTop.danceability", "myTop.energy", "myTop.key", "myTop.loudness", "myTop.mode", "myTop.speechiness", "myTop.acousticness", "myTop.instrumentalness", "myTop.liveness", "myTop.valence", "myTop.tempo", "myTop.duration_ms", "myTop.time_signature", "myTop.name", "myTop.length"))
spotifyTop <- setNames(spotifyTop, c("spotifyTop.danceability", "spotifyTop.energy", "spotifyTop.key", "spotifyTop.loudness", "spotifyTop.mode", "spotifyTop.speechiness", "spotifyTop.acousticness", "spotifyTop.instrumentalness", "spotifyTop.liveness", "spotifyTop.valence", "spotifyTop.tempo", "spotifyTop.duration_ms", "spotifyTop.time_signature","spotifyTop.name", "spotifyTop.length"))



summary(myTop)
summary(spotifyTop)
combined<-merge(myTop, spotifyTop)
combined <- combined[-c(101:10000), ]


#############################################################
# DANCE VS ACOUSTIC
############################################################
#GLOBAL
scatter1 <- ggplot(global, aes(danceability, acousticness))
# Scatterplot
scatter1 + geom_point() + 
  geom_smooth(method="lm", se=F) +
  labs(subtitle="2017 - Top Streamed Tracks On Spotify : danceability vs acousticness", 
       y="danceability", 
       x="acouticness", 
       title="Scatterplot with overlapping points", 
       caption="Source: top Spotify tracks 2017(Kaggle)")

#MY TOP 2017
scatter2 <- ggplot(me, aes(me.danceability, me.acousticness))
# Scatterplot
scatter2 + geom_point() + 
  geom_smooth(method="lm", se=F) +
  labs(subtitle="2017 - My personal top stremed songs : danceability vs acousticness", 
       y="danceability", 
       x="acouticness", 
       title="Scatterplot with overlapping points", 
       caption="Source: Spotify API & Spotipy Python library")

##################################################################
#Global dance
hist(global$global.tempo, 
     main="Histogram of Spotify top songs 2017 - Danceability", 
     xlab="global.danceability", 
     border="blue", 
     col="green",
     xlim=c(20,220),
     las=1, 
     breaks=5)
globalDanceAvg<-global.avgTempo<-mean(global$global.tempo)

#Energy
hist(global$global.energy, 
     main="Histogram of Spotify top songs 2017 - Energy", 
     xlab="global.energy", 
     border="blue", 
     col="green",
     xlim=c(0,1),
     las=1, 
     breaks=5)

#Acousticness
hist(global$global.acousticness, 
     main="Histogram of Spotify top songs 2017 - Acousticness", 
     xlab="global.acousticness", 
     border="blue", 
     col="green",
     xlim=c(0,1),
     las=1, 
     breaks=5)

#Time Signature
hist(global$global.time_signature, 
     main="Histogram of Spotify top songs 2017 - Time Signature", 
     xlab="global.acousticness", 
     border="blue", 
     col="green",
     xlim=c(0,8),
     las=1, 
     breaks=5)

#Valence
hist(global$global.valence, 
     main="Histogram of Spotify top songs 2017 - Valence", 
     xlab="global.valence", 
     border="blue", 
     col="green",
     xlim=c(0,2),
     las=1, 
     breaks=5)

#Valence
hist(global$global.key, 
     main="Histogram of Spotify top songs 2017 - Valence", 
     xlab="global.valence", 
     border="blue", 
     col="green",
     xlim=c(0,15),
     las=1, 
     breaks=5)

# load package and data
library(ggplot2)
library(ggExtra)
data(global, package="ggplot2")


# Scatterplot
theme_set(theme_bw())  # pre-set the bw theme.
global_select <- global[global$global.danceability & global$global.valence, ]
g1 <- ggplot(global, aes(global$global.danceability, global$global.valence)) + 
  geom_count() + 
  geom_smooth(method="lm", se=F)

ggMarginal(g1, type = "histogram", fill="transparent")
ggMarginal(g1, type = "boxplot", fill="transparent")
# ggMarginal(g, type = "density", fill="transparent")

# Scatterplot
#No relation between acousticness being a happy song --> poplar -> acoustic is not a attribute that makes a popular song
theme_set(theme_bw())  # pre-set the bw theme.
global_select <- global[global$global.acousticness & global$global.valence, ]
g2 <- ggplot(global, aes(global$global.acousticness, global$global.valence)) + 
  geom_count() + 
  geom_smooth(method="lm", se=F)

ggMarginal(g2, type = "histogram", fill="transparent")
ggMarginal(g2, type = "boxplot", fill="transparent")
################################################
#SAM QUIGLEY TOP 2017
hist(me$me.tempo, 
     main="Histogram of Spotify top songs 2017 - Danceability", 
     xlab="global.danceability", 
     border="blue", 
     col="green",
     xlim=c(20,220),
     las=1, 
     breaks=5)
meDanceAvg<-me.avgTempo<-mean(me$me.tempo)

#Energy
hist(me$me.energy, 
     main="Histogram of Sam Quigley top songs 2017 - Energy", 
     xlab="global.energy", 
     border="blue", 
     col="green",
     xlim=c(0,1),
     las=1, 
     breaks=5)

#Acousticness
hist(me$me.acousticness, 
     main="Histogram of Sam Quigley top songs 2017 - Acousticness", 
     xlab="global.acousticness", 
     border="blue", 
     col="green",
     xlim=c(0,1),
     las=1, 
     breaks=5)

#Time Signature
hist(me$me.time_signature, 
     main="Histogram of Sam Quigley top songs 2017 - Time Signature", 
     xlab="global.acousticness", 
     border="white", 
     col="blue",
     xlim=c(0,8),
     las=1, 
     breaks=5)

#Valence
hist(me$me.valence, 
     main="Histogram of Spotify top songs 2017 - Valence", 
     xlab="me.valence", 
     border="white", 
     col="blue",
     xlim=c(0,2),
     las=1, 
     breaks=5)

#key
hist(me$me.key, 
     main="Histogram of Sam Quigley top songs 2017 - Valence", 
     xlab="me.key", 
     border="white", 
     col="blue",
     xlim=c(0,14),
     las=1, 
     breaks=5)

#loudness
hist(me$me.loudness, 
     main="Histogram of Sam Quigley top songs 2017 - Valence", 
     xlab="me.loudness", 
     border="white", 
     col="blue",
     xlim=c(-30,14),
     las=1, 
     breaks=5)


######################################################

ggplot(global, aes(x=global.energy, y=global.valence)) + 
  geom_point(size=3) + 
  geom_segment(aes(x=global.energy, 
                   xend=global.energy, 
                   y=0, 
                   yend=global.valence)) + 
  labs(title="Lollipop Chart", 
       subtitle="energy Vs valence", 
       caption="source: Top 2017 tracks - Spotify") + 
  theme(axis.text.x = element_text(angle=65, vjust=0.6))

ggplot(me, aes(x=me.energy, y=me.valence)) + 
  geom_point(size=3) + 
  geom_segment(aes(x=me.energy, 
                   xend=me.energy, 
                   y=0, 
                   yend=me.valence)) + 
  labs(title="Lollipop Chart", 
       subtitle="energy Vs valence", 
       caption="source: SPOTIFY API") + 
  theme(axis.text.x = element_text(angle=65, vjust=0.6))

library(ggplot2)
library(scales)
theme_set(theme_classic())

# Plot
ggplot(combined, aes(x=combined$me.danceability, y=combined$global.danceability)) + 
  geom_point(col="tomato2", size=3) +   # Draw points
  geom_segment(aes(x=me.danceability, 
                   xend=me.danceability, 
                   y=min(global.danceability), 
                   yend=max(global.danceability)), 
               linetype="dashed", 
               size=0.1) +   # Draw dashed lines
  labs(title="Dot Plot", 
       subtitle="My dance Vs global dance", 
       caption="source: spotify") +  
  coord_flip()

#map reduce formatting
combined$me.tempo<-format(round(combined$me.tempo, 0), nsmall = 0)
combined$me.energy<-format(round(combined$me.energy, 2), nsmall = 2)
combined$me.acousticness<-format(round(combined$me.acousticness, 2), nsmall = 2)
combined$me.danceability<-format(round(combined$me.danceability, 1), nsmall = 2)
combined$global.tempo<-format(round(combined$global.tempo, 0), nsmall = 0)
combined$global.energy<-format(round(combined$global.energy, 2), nsmall = 2)
combined$global.danceability<-format(round(combined$global.danceability, 1), nsmall = 2)
combined$global.acousticness<-format(round(combined$global.acousticness, 2), nsmall = 2)

combined$global.danceability <- as.numeric(combined$global.danceability)
combined$me.danceability <- as.numeric(combined$.danceability)
# Plot
ggplot(combined, aes(x=combined$me.danceability, y=combined$global.danceability)) + 
  geom_point(col="tomato2", size=3) +   # Draw points
  geom_segment(aes(x=me.danceability, 
                   xend=me.danceability, 
                   y=min(global.danceability), 
                   yend=max(global.danceability)), 
               linetype="dashed", 
               size=0.1) +   # Draw dashed lines
  labs(title="Dot Plot", 
       subtitle="My dance Vs global dance", 
       caption="source: spotify") +  
  coord_flip()

# me vs global -> using lolipop graphs
ggplot(combined, aes(x=me.danceability, y=global.danceability)) + 
  geom_point(size=3) + 
  geom_segment(aes(x=me.danceability, 
                   xend=me.danceability, 
                   y=0, 
                   yend=global.valence)) + 
  labs(title="Lollipop Chart", 
       subtitle="does my music taste have the same aount of danceability as the most popluar songs of 201
       ", 
       caption="source: Top 2017 tracks - Spotify & My personal top streamed songs on spotify in 2017") + 
  theme(axis.text.x = element_text(angle=65, vjust=0.6))



#MAP REDUCE TIME
#install.packages("rio")
library("rio")
write.csv(combined, "C:/Users/samq2/Desktop/college/Data Application Development/project/mapReduce/Spotify.csv")






