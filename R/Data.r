
#Load the data from the train, test, and gender_submission files into dataframes and analize if some information is duplicated.


df_train_test  <- read.csv("data/raw/train.csv", header = TRUE, sep = ",")
df_submit      <- read.csv("data/raw/test.csv", header = TRUE, sep = ",")



#head(df_train_test,5)
#head(df_submit,5)


repetidos_submit      <- duplicated(df_submit)
repetidos_train_test  <- duplicated(df_train_test)



df_submit      <- df_submit     %>% distinct ()
df_train_test  <- df_train_test %>% distinct ()



col_name <- names(df_train_test)
#col_name

col_name <- names(df_submit)
#col_name

### Create Partitions

#The data is split in two dataframes to train and to test. In order to select the best model. 

set.seed(100)
train <- createDataPartition(y = df_train_test$Survived,p = .8, list = FALSE)
df_train    <- df_train_test[train,] 
df_test     <- df_train_test[-train,]

save(df_train, file = "train.RData") 
save(df_test, file = "test.RData") 

