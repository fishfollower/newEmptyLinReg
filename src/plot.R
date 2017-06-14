source("src/common.R")

dat <- read.table("data/linreg.dat", header=TRUE)
fit <- lm(y~x, data=dat)

plots<-function(){
  plot(dat)
  abline(coef(fit))
  stampit()
}

stamp<-gsub('-[[:digit:]]{4}$','',gsub(':','.',gsub(' ','-',gsub('^[[:alpha:]]{3} ','',date()))))
png(filename = paste(stamp,"_%03d.png", sep=''), width = 480, height = 480,
    units = "px", pointsize = 10, bg = "white")
  plots()    
dev.off()

png(filename = paste("big_",stamp,"_%03d.png", sep=''), width = 1200, height = 1200, 
    units = "px", pointsize = 20, bg = "white")
  plots()    
dev.off()

##pdf(onefile=FALSE, width = 10, height = 8)
##  plots()    
##dev.off()

cat('',file='footprint') 

