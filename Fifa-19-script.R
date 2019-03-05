#Used dataset.unclean: https://www.kaggle.com/karangadiya/fifa19

# Reading data to dataset.unclean
dataset.unclean <- read.csv("Fifa19Data.csv", header = T, fill = T)
str(dataset.unclean)

#Checking if the dataset.unclean is a dataframe
class(dataset.unclean)

#PART 1: CLEANING dataset.unclean
str(dataset.unclean)

#Removing unnecessary columns from the dataset.unclean
dataset.unclean[, c(
  'Photo',
  'Flag',
  'Club.Logo',
  'Real.Face',
  'Joined',
  'Height',
  'Release.Clause',
  'LS',
  'Loaned.From',
  'Contract.Valid.Until',
  'ST',
  'RS',
  'LW',
  'LF',
  'CF',
  'RF',
  'RW',
  'LAM',
  'CAM',
  'RAM',
  'LM',
  'LCM',
  'CM',
  'RCM',
  'RM',
  'LWB',
  'LDM',
  'CDM',
  'RDM',
  'RWB',
  'LB',
  'LCB',
  'CB',
  'RCB',
  'RB'
)] <- list(NULL)
# colnames(dataset.unclean)

# class(dataset.unclean$Age)
# str(dataset.unclean)

#Converting factor into numeric. For help checkout: https://stackoverflow.com/questions/3418128/how-to-convert-a-factor-to-integer-numeric-without-loss-of-information
# dataset.unclean$age.clean <-
#   suppressWarnings(as.numeric(levels(dataset.unclean$Age))[dataset.unclean$Age])
# class(dataset.unclean$age.clean)
# head(dataset.unclean$age.clean)
plot(dataset.unclean$Age)

#Figuring out the max and min value of a column with null values. na.rm = T ignores the null values of the column
max(dataset.unclean$Age, na.rm = T)
min(dataset.unclean$Age, na.rm = T)

#Not sure what the index means in the plot. Will look into it later. Also players of age above 51 are probably incorrect data. Will look for ways to check if the data is correct or incorrect, and how to remove it if it's incorrect.

str(dataset.unclean)
head(dataset.unclean$Value, n = 20)
#Value was not imported correctly. Need to find way to correct the issue. Similarly, need to correct Wage as well.
#Fixing the value column by removing unwanted characterns and converting the column to numeric variables

#Main problem: figuring out how to remove "." from the dataset and then replace "M" or "k" with zeroes.
#https://stackoverflow.com/questions/30180281/how-can-i-check-if-multiple-strings-exist-in-another-string


dataset.unclean$Value.clean <-
  suppressWarnings(gsub('[â‚¬]', '', dataset.unclean$Value))

head(dataset.unclean$Value.clean, n = 50)

# str.m <- c("M", ".")
# str.k <- c("k", ".")
# stuff <- dataset.unclean$Value
# for (i in 0:nrow(dataset.unclean)) {
#   if (all(sapply(str.m, grepl, dataset.unclean$Value[i])) == TRUE) {
#       stuff <-
#         suppressWarnings(gsub('[.]', '', stuff[i]))
#       stuff.clean <-
#         suppressWarnings(gsub('[M]', '00000', stuff[i]))
#     }
# }
# if (all(sapply(str.m, grepl, dataset.unclean$Value))) {
#   dataset.unclean$value.clean <-
#     suppressWarnings(gsub('[.]', '', dataset.unclean$Value))
#   dataset.unclean$value.clean <-
#     suppressWarnings(gsub('[M]', '00000', dataset.unclean$Value))
# } else if (all(sapply(str.k, grepl, dataset.unclean$Value))) {
#   dataset.unclean$value.clean <-
#     suppressWarnings(gsub('[.]', '', dataset.unclean$Value))
#   dataset.unclean$value.clean <-
#     suppressWarnings(gsub('[k]', '00', dataset.unclean$Value))
# } else {
#   dataset.unclean$value.clean <-
#     suppressWarnings(gsub('[M]', '000000', dataset.unclean$Value))
#   dataset.unclean$value.clean <-
#     suppressWarnings(gsub('[k]', '000', dataset.unclean$Value))
# }


head(dataset.unclean$Value)
plot(dataset.unclean$Value)
max(dataset.unclean$Value, na.rm = T)
min(dataset.unclean$Value, na.rm = T)
dataset.unclean$Value




#Trying to check if the available columns explain the overall rating of players using linear regression
lm.check <- lm(dataset.unclean$Overall ~ . , data = dataset.unclean)
