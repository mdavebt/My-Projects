#  fips      SCC Pollutant Emissions  type year
#4  09001 10100401  PM25-PRI    15.714 POINT 1999
#8  09001 10100404  PM25-PRI   234.178 POINT 1999
#12 09001 10100501  PM25-PRI     0.128 POINT 1999
#16 09001 10200401  PM25-PRI     2.036 POINT 1999
#20 09001 10200504  PM25-PRI     0.388 POINT 1999
#24 09001 10200602  PM25-PRI     1.490 POINT 1999

	install.packages("reshape2")
	library(reshape2)
	install.packages("ggplot2")
	library(ggplot2)

plot3 <- function(){
	NEI <- readRDS("summarySCC_PM25.rds")
	
SCC <- readRDS("Source_Classification_Code.rds")

	summary(as.numeric(NEI$Emissions))
	mean(is.na(NEI$Emissions))

	NEI_baltimore <- subset(NEI,NEI$fips =="24510")  

	png(file = "plot3.png",width =1020,height = 480,bg="white")
	g <- qplot(year,Emissions,data=NEI_baltimore,facets=.~type,color=type)+geom_smooth(method="lm")+labs(title="PM25 Emissions in tons for each type in Baltimore",y="PM25 Emissions (tons)")+coord_cartesian(ylim=c(0,150))

	print(g)
	dev.off()
}