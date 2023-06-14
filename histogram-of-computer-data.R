library(tidyverse)
library(ggplot2)

survey <- read.csv("/Users/kristianolsson/Downloads/2023-06-13-survey.csv")

survey1 <- survey

survey1$Timestamp <- substring(survey$Timestamp, 11)

datetime <- mdy_hms(survey$Timestamp)
datetime1 <- as.data.frame(datetime)
datetime1 <- as.data.frame(datetime)
datetime2 <- minute(datetime)
datetime3 <- hour(datetime)
datetime4 <- paste(datetime3,"_",datetime2)
datetime4 <- as.data.frame(datetime4)

p <- ggplot(datetime4, aes(x = datetime)) + 
  geom_histogram(color="black", fill="white", bins=33) + 
  geom_vline(aes(xintercept=mean(datetime)), color="blue", linetype="dashed", size=1) +
  labs(title = "Histogram of Survey Submission Timestamp",
       subtitle = "on 06-13-2023") +
  xlab("Time") +
  ylab("Count of Submissions")

