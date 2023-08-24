library(caret)
library(tidyverse)
library(ggplot2)
library(readr)

#Prep data/clean data

## Read the file.csv as data_frame
full_df <- read_csv("House 2017-Table 1.csv")

# Check missig values
full_df %>%
  complete.cases() %>%
  mean()

## Check distribution of price
ggplot(data = full_df, aes(full_df$Price)) +
  geom_histogram(bins = 100, 
               fill = "#6734eb", 
               alpha = 0.5) +
  theme_minimal() +  
    labs(title = "Distribution of House Price India",
         x = "Price",       
         y = "Count")

## Convert to Normal Distribution with log()
norm_clean_df <- full_df %>% 
  subset(select = -id) #Delete unused column

log_clean_df <- full_df %>% 
  mutate(log_price = log(Price)) %>%
  subset(select = -id) %>% #Delete unused column
  subset(select = -Price)

ggplot(data = log_clean_df, aes(log_price)) +
           geom_histogram(bins = 100, 
                          fill = "#6734eb") +
           theme_minimal() +  
           labs(title = "Distribution of House Price India",
                x = "Price",
                y = "Count")

# Build ML Process
## 1. split data => train test split
## split_function
split_data_norm <- function(df)
{
  set.seed(99)
  n <- nrow(df)
  id <- sample(1:n, size = 0.8 * n)
  train_df <- df[id, ]
  test_df <- df[-id, ]
  return (list(training = train_df, testing = test_df))
}

split_data_log <- function(df)
{
  set.seed(42)
  n <- nrow(df)
  id <- sample(1:n, size = 0.8 * n)
  train_df <- df[id, ]
  test_df <- df[-id, ]
  return (list(training = train_df, testing = test_df))
}

prep_data <- split_data_norm(norm_clean_df)
prep_data2 <- split_data_log(log_clean_df)


## 2. train model
# Normal Price
(lm_model <- train(Price ~ ., 
                   data=prep_data$training,
                   method="lm"))

# Take log
(lm_model_log <- train(log_price ~ ., 
                  data=prep_data2$training,
                  method="lm"))

## 3. score model aka. prediction
p_norm <- predict(lm_model, newdata=prep_data$testing)
p_log <- predict(lm_model_log, newdata=prep_data2$testing)

## 4. evaluate model
# Normal price model Evaluation
err_norm <- p_norm - prep_data$testing$Price
(mae_norm <- mean(abs(err_norm)))
(rmse_norm <- sqrt(mean(err_norm ** 2)))

# Log price model Evaluation
err_log <- exp(p_log) - exp(prep_data2$testing$log_price)
(mae_log <- mean(abs((err_log))))
(rmse_log <- sqrt(mean(err_log ** 2)))

cat(paste("MAE Norm_Price = ", 
          round(mae_norm, 1), 
          " | ", 
          "MAE Log_Price = ",
          round(mae_log,1)),
          "\n")

cat(paste("RMSE Norm_Price = ", 
          round(rmse_norm, 1), 
          " | ", 
          "RMSE Log_Price = ",
          round(rmse_log,1), 
          "\n"))

