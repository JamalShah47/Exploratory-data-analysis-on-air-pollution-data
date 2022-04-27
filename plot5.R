library("dplyr")
library("ggplot2")

NEI = readRDS("D:/Rprogramming/Exploratory data analysis/Exploratory-data-analysis-on-air-pollution-data/summarySCC_PM25.rds")

SCC = readRDS("D:/Rprogramming/Exploratory data analysis/Exploratory-data-analysis-on-air-pollution-data/Source_Classification_Code.rds")

emissions_y <- NEI %>%
  filter(fips == "24510" & type == "ON-ROAD") %>%
  group_by(year) %>%
  summarise(total_emissions = sum(Emissions))

emissions_y$year <- as.factor(emissions_y$year)

ggplot(emissions_y, aes(x = year, y = total_emissions)) + geom_bar(stat = "identity") +
  labs(x ="Year", y = "PM2.5 Emissions")+ ggtitle("PM2.5 Emissions of Baltimore City from Vehicle Sources")

dev.copy(png,'plot5.png')
dev.off()