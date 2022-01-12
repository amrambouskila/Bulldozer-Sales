# import libraries
library(earth)
library(dplyr)

# Set Working Directory
getwd()

# ETL
df <- read.csv('marketing_data.csv') 
head(df)
df <- df[complete.cases(df), ]
colnames(df)

df$Income <- gsub("\\$", "", df$Income)
df$Income <- gsub(",", "", df$Income)
df$Income <- as.numeric(df$Income)

df1 <- df
df1$Dt_Customer <- NULL
df1 <- df1[complete.cases(df1), ]

# MARS Model
lm <- earth(Income~., data = df1, degree=2)
summary(lm)
plotmo(lm, ngrid2=662)
lm





str_split(string, pattern, n = Inf, simplify = FALSE)
