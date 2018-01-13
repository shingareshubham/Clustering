# For Clustering we need numeric data
# first we need to convert catagorical data to numeric
# Remove non releted variable frome thhe model
setwd("C:/R/myworking_dir") # Set working directory

library(amap)

##Read the data in the file

cust_data<-read.csv("company.csv") #Store this csv file in working derectory

head(cust_data, 20)

tail(cust_data, 20)

names(cust_data)

dim(cust_data)

str(cust_data)

View(cust_data)

plot(cust_data$X1, cust_data$X2)

### Select the requried columns for clustering
cust_data1 <- cust_data[,c(2,3,4,5,6,7,8,9)]

names(cust_data1)


###Prepare the correlation matrix for columns in dat1
correlation <- cor(cust_data1,cust_data1)
correlation
#write.csv(correlation, "cor.csv")

library(clusterSim)
preObj <- data.Normalization (cust_data1,type="n1",normalization="column")
class(preObj)
View(preObj)

###Verify the data
names(cust_data1)
tail(cust_data1)
colnames(cust_data1)
head(cust_data1)


###Run the kmeans algorithm to generate the clusters
k1 <-kmeans(cust_data1, 3)
k1

###See the clustering results
attributes(k1)

###Fetch the group means for each variable
k1$centers

###Fetch size/n of obs for the groups
k1$size
###Fetch sum of squared  for the groups

k1$betweenss
k1$totss
k1$tot.withinss
k1$withinss



###map cluster no to rows

out <- cbind(cust_data, cluster = k1$cluster)
head(out)


write.csv(out, file="company_result.csv")
s <- read.csv("company_result.csv")
hist(s$cluster)
str(s)
