install.packages("ggplot2")
packageVersion("ggplot2")
library(ggplot2)
search()
data("midwest", package = "ggplot2")
ggplot(midwest, aes(x = area, y = poptotal)) #blank plot 
    #"aes ()" function specifies x and y axes
ggplot(midwest, aes(x = area, y = poptotal)) + geom_point()
    #scatterplot with values in it / "geom_point ()" adds values as a geom layer
ggplot(midwest, aes(x = area, y = poptotal)) + geom_point() + geom_smooth(method = "lm")
    #geom_smooth creates a smooth layer / "lm" means linear model and creates a line of best fit
#The x and y limits can be controlled in 2 ways


#method 1: deleting points outside of the range
   #changes lines of best fit and smoothing lines
g <-ggplot(midwest, aes(x = area, y = poptotal)) + geom_point() + geom_smooth(method = "lm")
g + xlim(c(0, 0.1)) + ylim(c(0, 1000000)) #deletes points outside limits / built on top of g (original)

#method 2: zooming in 
   #zooms in on region without deleting points
g1 <- g + coord_cartesian(xlim = c(0, 0.1), ylim = c(0, 1000000))
plot(g1)  #line of best fit did not change


#Changing title 
  #Method 1: 
g1 + labs(title = "Area Vs Population", subtitle = "From midwest dataset", y = "Population", x = "Area", caption = "Midwest Demographics")
  #Method 2: 
g1 + ggtitle("Area Vs Population", subtitle = "From midwest dataset") + xlab("Area") + ylab("Population")



#Changing color and size 
ggplot(midwest, aes(x = area, y = poptotal)) + geom_point(col = "steelblue", size = 3)  #point colors
ggplot(midwest, aes(x = area, y = poptotal)) + geom_smooth(method = "lm", col = "firebrick")   #line color
ggplot(midwest, aes(x = area, y = poptotal)) + coord_cartesian(xlim = c(0, 0.1), ylim = c(0, 1000000))    #changes window of coordinates
labs(title = "Area Vs Population", subtitle = "From midwest dataset", y = "Population", x = "Area", caption = "Midwest Demographics")   #titles and names
#altogether 
ggplot(midwest, aes(x = area, y = poptotal)) + geom_point(col = "steelblue", size = 3) + geom_smooth(method = "lm", col = "firebrick") + coord_cartesian(xlim = c(0, 0.1), ylim = c(0, 1000000)) + labs(title = "Area Vs Population", subtitle = "From midwest dataset", y = "Population", x = "Area", caption = "Midwest Demographics")
#multiple colors/ state sets color to vary based on state categories (IL, IN, MI, OH, WI)
ggplot(midwest, aes(x = area, y = poptotal)) + geom_point(aes (col = state), size = 3) + geom_smooth(method = "lm", col = "firebrick", size = 2) + coord_cartesian(xlim = c(0, 0.1), ylim = c(0, 1000000)) + labs(title = "Area Vs Population", subtitle = "From midwest dataset", y = "Population", x = "Area", caption = "Midwest Demographics")

g2 <- ggplot(midwest, aes(x = area, y = poptotal)) + geom_point(aes (col = state), size = 3) + geom_smooth(method = "lm", col = "firebrick", size = 2) + coord_cartesian(xlim = c(0, 0.1), ylim = c(0, 1000000)) + labs(title = "Area Vs Population", subtitle = "From midwest dataset", y = "Population", x = "Area", caption = "Midwest Demographics")
#can remove legend by or change color palette (also set colorful plot as g2)
g2 + theme(legend.position = "None")
g2 + scale_colour_brewer(palette = "Set1")  #(found in RColorBrewer package)
#library(RColorBrewer) / head(brewer.pal.info)



#Changing X/Y axis texts and tick locations
g2
g2 + scale_x_continuous(breaks = seq(0, 0.1, 0.01))
g2 + scale_x_continuous(breaks = seq(0, 0.1, 0.01), labels = letters [1:11])

g3 <- ggplot(midwest, aes(x = area, y = poptotal)) + geom_point(aes (col = state), size = 3) + geom_smooth(method = "lm", col = "firebrick", size = 2) + labs(title = "Area Vs Population", subtitle = "From midwest dataset", y = "Population", x = "Area", caption = "Midwest Demographics")
g3 + scale_x_reverse()          #??? question about removing xlimit for scale reverse and what to do with scale y
g3 + scale_y_continuous(c(0, 1000000))
g3 + scale_x_reverse(limits = c(0.1, 0)) 

#Change axis texts
g2 + scale_x_continuous(breaks = seq(0, 0.1, 0.01), labels = sprintf("%1.2f%%", seq(0, 0.1, 0.01))) + scale_y_continuous(breaks = seq(0, 1000000,2000000), labels = function(x){paste0 (x/1000, 'K')})

#Entire customization
g2
g4 <- g2 +scale_x_continuous(breaks = seq(0, 0.1, 0.01))
g4


#Themes: method 1
theme_set(theme_classic()) #not run means it sets as default for all plots after running it
#method 2: adding manually / more themes in ggthemes and ggthemr package
      #4 Themes
g4 + theme_bw() + labs(subtitle = "BW Theme")
g4 + theme_classic() + labs(subtitle = "Classic Theme")
g4 + theme_dark() + labs(subtitle = "Dark Theme")
g4 + theme_void() + labs(subtitle = "Void Theme")

#3. New ggplot figure
ggplot(midwest, aes(x = state, y = poptotal)) + geom_point()
g5 <- ggplot(midwest, aes(x = state, y = poptotal)) + geom_boxplot(aes (col = state), size = 3)
g5 
g6 <- g5 + labs(title = "State Vs Population") + coord_cartesian(xlim = c(0, 5), ylim = c(0, 1000000))
g6 
g6 + theme_classic() + labs(subtitle = "Classic Theme") 
