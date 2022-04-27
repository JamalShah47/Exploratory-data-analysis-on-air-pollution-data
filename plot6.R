library("dplyr")
library("ggplot2")

NEI = readRDS("D:/Rprogramming/Exploratory data analysis/Exploratory-data-analysis-on-air-pollution-data/summarySCC_PM25.rds")

SCC = readRDS("D:/Rprogramming/Exploratory data analysis/Exploratory-data-analysis-on-air-pollution-data/Source_Classification_Code.rds")

emissions_y <- NEI %>%
  filter(fips %in% c("24510","06037") & type == "ON-ROAD") %>%
  group_by(year,fips) %>%
  summarise(total_emissions = sum(Emissions))

emissions_y$year <- as.factor(emissions_y$year)
emissions_y$county_name <- factor(emissions_y$fips, levels = c("06037","24510"), labels = c("Los Angeles County","Baltimore City"))

ggplot(emissions_y, aes(x = year, y = total_emissions))+
  geom_bar(stat = "identity", aes(fill = county_name), position = "dodge")+
  guides(fill = guide_legend(title = NULL))+
  labs(x= "Year", y = "PM2.5 Emissions")+
  ggtitle("Vehicle PM 2.5 Emissions of Baltimore City & LA County")+
  theme(legend.position = "bottom")
  
dev.copy(png,'plot6.png')
dev.off