install.packages("sciplot")
library(sciplot)
sqrt(49)
[1] 7
> log(230)
[1] 5.438079
> log10(1000)
[1] 3
> log(1000,10)
[1] 3
> log(x=1000, base=10)
[1] 3
> y <- 5
> y 
[1] 5
> mydata <- c(5, 3, 1, 2)
> mydata
[1] 5 3 1 2
> mydata[3]
[1] 1
> mydata[4]
[1] 2
> mydata[2:3]
[1] 3 1
> mydata2 <- 5
> View(std)
> myData <- c(3, 3, 3, 3, 3)
> mean(mydata)
[1] 2.75
> sd(mydata)
[1] 1.707825
> sd(myData)
[1] 0
> sum(mydata)/ length(mydata)
[1] 2.75 
#to take notes on script 
lizarddata <- read.csv("C:/Users/Brand/OneDrive/Desktop/Biostatistics/Hornedlizards.csv")
lizarddata
head(lizarddata)
lizarddata[1,]
str(lizarddata)
mean(lizarddata$squamosalHornLength, na.rm = T) #23.90707
sd(lizarddata$squamosalHornLength, na.rm =TRUE)  #2.769862
summary(lizarddata$squamosalHornLength, na.rm = TRUE)
  #Min. 1st Qu.  Median    Mean 3rd Qu.    Max.    NA's 
  #13.10   22.40   24.15   23.91   25.73   30.30       1 

#Make histogram
hist(lizarddata$squamosalHornLength)
hist(lizarddata$squamosalHornLength, col="green") 
hist(lizarddata$squamosalHornLength, las= 1, col= "green")

#Make boxplot ((~) specifies y and x)
boxplot(lizarddata$squamosalHornLength ~ lizarddata$Survival, las =1)
  #or
boxplot(squamosalHornLength ~ Survival, data = lizarddata, las =1) 

#To make folders in R
setwd() and getwd()
