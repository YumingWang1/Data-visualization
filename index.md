## Welcome to Yuming Wang's Github Website

Summary Collection for Data Visualization

One page Summary:

After read that Video from Stanford's website named Journalism in the Age of Data, I know some current situation for journalism and how important data visulization imply on this field.

In recent years, journalists cooperate with computer scientsts, researchers and artists for data visulization. They use data visualization techniques let the data easy to know and make as news.Some journalists company start retools the staff to prepare the data medium in the future. Because the explosion of data brought a complementary need for tools to analyze it, so how to communicate with data and data visulization already become a problem.

But a lot of expert of data visualization are helping by bilding tools for these journalists.And also journalists are finding ways to explain visualization data instead of tradition data. But how to explain these visualization effectively also is a problem. Nowadays, data is become very important in our life, and will exist in everywhere. So its challenging our ability to adsorb, analyze and display. However, the good news is the technology for data visualization are in transition, its will help us to connect data and visualization together easily.

Ten bullet points of observations:

- Training eyes is very very important, you can't come up with ideas if you don't see first
- I saw some obstract graphics
- Some Cube, Bottle
- Some beautiful carved letters
- some letters draw from thin to thick
- amazing airline graphic
- color percent square
- beautiful texture
- beautiful flower
- amazing U.S. map

Review of video "Bach, Hugue in A minor, BMV904":

When I watched this video, I heard a very nice music. And I saw a lot of circles in the lines, and it's become more complicated with the flow. Then I saw a lots of squares with the flow. it's looks like piano's keyboard. this video visualized the melody use square, circles and lines. It's very amazing for me!


### Code

This is my Data Visualization Code


# Basic barplot
library(ggplot2)
p<-ggplot(data=China_data, aes(x=China_data$Year, y=China_data$`Average Wage`)) +
  geom_bar(stat="identity",width=0.5)
p
# Horizontal bar plot
p + coord_flip()


# Variable Width Column Chart
library(ggplot2)
library(hrbrthemes)
data <- data.frame(
  group=c("A ","B ","C ","D ","E","F","G","H","I","J") , 
  value=c(2009,2010,2011,2012,2013,2014,2015,2016,2017,2018) , 
  number_of_obs=c(2676,3052,3611,8228,8809,15351,9821,16298,6729,7290)
)

data$right <- cumsum(data$number_of_obs) + 3000*c(0:(nrow(data)-1))
data$left <- data$right - data$number_of_obs 
ggplot(data, aes(ymin = 2009)) + 
  geom_rect(aes(xmin = left, xmax = right, ymax=value,colour = group, fill = group)) +
  xlab("Average Wage") + 
  ylab("Year") +
  theme_ipsum() +
  theme(legend.position="none") 







### Project

This is my Project Collection
<iframe width="700" height="800" src=" https://yumingwang.shinyapps.io/FinalProject/" frameborder="0" allowfullscreen></iframe> 

### Personal Information

Name: Yuming Wang
Email: yxw190037@utdallas.edu

