library(ggplot2)
p<-ggplot(data=growthrate, aes(x=Sectors, y=GrowthRate, fill=Country)) +
  geom_bar(stat="identity", position=position_dodge())+
  
  geom_text(aes(label=GrowthRate), vjust=1.6, color="white",
            position = position_dodge(0.9), size=3.5)+
  scale_fill_brewer(palette="Paired")+
  theme_minimal()
p