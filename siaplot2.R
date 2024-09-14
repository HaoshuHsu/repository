#Basic operation
  
getwd()
setwd("D:/同位素")

sia2<-read.table("SIA2.txt", TRUE, "\t", '_')
sia2<-read.table(file.choose(),header = T)


library(ggplot2)

#C13與N15作圖
plot(d15N~d13C, data=sia2)  

#每種物種N15的四分位圖
ggplot(sia2, aes(x=reorder(Species,d15N,na.rm = TRUE), y=d15N))+
  geom_boxplot()+
  theme_bw()+
  theme(axis.title = element_text(size=rel(2.0)),
        axis.text = element_text(size=rel(1.0)),axis.text.x=element_text(angle=-90))


#C13與N15棲位重疊
ggplot(sia2, aes(x=d13C,y=d15N,colour=Species))+
  geom_point()+
  stat_ellipse(level=0.4)+
  theme_bw()+
  theme(axis.title = element_text(size=rel(2.0)),
        axis.text = element_text(size=rel(1.5)))