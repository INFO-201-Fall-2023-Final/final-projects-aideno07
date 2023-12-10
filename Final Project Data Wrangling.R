library(dplyr)
library(stringr)
library(ggplot2)



#Grabbing data sets that can show a correlation in inflation and minimum wage.
wage_df <- read.csv("Minimum Wage Data.csv")
inflation_df <- read.csv("seriesreport.csv")

#Remove unnecessary column
wage_df$Footnote = NULL

# Remove rows where year is less than 2000
wage_df <- subset(wage_df, Year >= 2000)

#Get the average inflation (continous variable)
inflation_df$Average_Inflation <- rowMeans(inflation_df[c("HALF1", "HALF2")], na.rm = TRUE)

#Merge the data sets so that the average inflation from the inflation_df
#is applied to its specific year in wage_df and is made into a new data set df
df <- merge(wage_df, inflation_df[, c("Year", "Average_Inflation")], by = "Year", all.x = TRUE)

#Categorical variable made
#If the average percent is less than 2.0 the Inflation category column displays low inflation,
#above 2.0 displays high inflation.
df$Inflation_Category <- ifelse(df$Average_Inflation < 2.0, "Low Inflation", "High Inflation")

#This dataframe summarizes each years inflation rate by its Federal Minimum Wage and CPI Average.
sum_df <- aggregate(cbind(Average_Inflation, CPI.Average, Federal.Minimum.Wage) ~ Year, data = df, FUN = mean, na.rm = TRUE)

#Make the df into a csv file.
write.csv(sum_df, "CleanedDataOfInflationandWage.csv", row.names = FALSE)
