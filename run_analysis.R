# 1. Load libraries
library(dplyr)

# 2. Set path
path <- "UCI HAR Dataset"

# 3. Load data
features <- read.table(file.path(path, "features.txt"))
activity_labels <- read.table(file.path(path, "activity_labels.txt"))

X_train <- read.table(file.path(path, "train/X_train.txt"))
y_train <- read.table(file.path(path, "train/y_train.txt"))
subject_train <- read.table(file.path(path, "train/subject_train.txt"))

X_test <- read.table(file.path(path, "test/X_test.txt"))
y_test <- read.table(file.path(path, "test/y_test.txt"))
subject_test <- read.table(file.path(path, "test/subject_test.txt"))

# 4. Name columns
colnames(X_train) <- features$V2
colnames(X_test) <- features$V2

# 5. Combine datasets
train <- cbind(subject_train, y_train, X_train)
test  <- cbind(subject_test, y_test, X_test)

data <- rbind(train, test)

colnames(data)[1:2] <- c("subject", "activity")

# 6. Extract mean & std
data <- data %>%
  select(subject, activity, contains("mean"), contains("std"))

# 7. Use descriptive activity names
data$activity <- factor(data$activity,
                        levels = activity_labels$V1,
                        labels = activity_labels$V2)

# 8. Clean variable names
names(data) <- names(data) %>%
  gsub("\\()", "", .) %>%
  gsub("-", "_", .) %>%
  gsub("^t", "time_", .) %>%
  gsub("^f", "freq_", .)

# 9. Create tidy dataset (average per subject & activity)
tidy_data <- data %>%
  group_by(subject, activity) %>%
  summarise(across(everything(), mean), .groups = "drop")

# 10. Export
write.table(tidy_data, "tidy_data.txt", row.names = FALSE)
