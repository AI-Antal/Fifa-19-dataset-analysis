#Used Dataset: https://www.kaggle.com/karangadiya/fifa19

#Reading the dataset
dataset <- read.table("Fifa19Data.csv", header = T, sep = ",", fill = T)

#Checking if the dataset is a dataframe
class(dataset)

#Removing unnecessary columns from the dataset
dataset[ ,c('Photo', 'Flag', 'Club.Logo', 'Real.Face', 'Joined', 'Height', 'Release.Clause' )] <- list(NULL)
colnames(dataset)
class(dataset$Age)
#Converting factor into numeric. For help checkout: https://stackoverflow.com/questions/3418128/how-to-convert-a-factor-to-integer-numeric-without-loss-of-information
dataset$Age <- as.numeric(levels(dataset$Age))[dataset$Age]
class(dataset$Age)
head(dataset$Age)
plot(dataset$Age)
max(dataset$Age, na.rm = T)
min(dataset$Age, na.rm = T)
#Not sure what the index means in the plot. Will look into it later. Also players of age above 51 are probably incorrect data. Will look for ways to check if the data is correct or incorrect, and how to remove it if it's incorrect.

class(dataset$Value)
#Value was not imported correctly. Need to find way to correct the issue. Similarly, need to correct Wag as well.
dataset$Value <- as.numeric(levels(dataset$Value))[dataset$Value]
plot(dataset$Value)
max(dataset$Value, na.rm = T)
min(dataset$Value, na.rm = T)


#Figuring out the max and min value of a column with null values. na.rm = T ignores the null values of the column



#Trying to check if the available columns explain the overall rating of players using linear regression
lm.check <- lm(dataset$Overall ~. , data = dataset)
