# -----------------------------
# Load libraries
# -----------------------------
library(readxl)
library(randomForest)
library(ggplot2)
library(caret)
library(pROC)

# -----------------------------
# 1. Load dataset
# -----------------------------
df <- read_excel("C://Users//HP//Downloads//anything excel data analysis//DataCo.xlsx")

# -----------------------------
# 2. Create df_clean with only pre-delivery predictors
# -----------------------------
df_clean <- data.frame(
  Late_delivery_risk = as.factor(df$Late_delivery_risk),
  Benefit.per.order = df$`Benefit per order`,
  Sales.per.customer = df$`Sales per customer`,
  Category.Name = as.factor(df$`Category Name`),
  Customer.Country = as.factor(df$`Customer Country`),
  Order.Item.Discount = df$`Order Item Discount`,
  Order.Item.Discount.Rate = df$`Order Item Discount Rate`,
  Order.Item.Product.Price = df$`Order Item Product Price`,
  Order.Item.Profit.Ratio = df$`Order Item Profit Ratio`,
  Order.Item.Quantity = df$`Order Item Quantity`,
  Order.Item.Total = df$`Order Item Total`,
  Product.Price = df$`Product Price`,
  Shipping.Mode = as.factor(df$`Shipping Mode`)
)

# -----------------------------
# 3. Remove missing values
# -----------------------------
df_clean <- na.omit(df_clean)

# -----------------------------
# 4. Train/Test split
# -----------------------------
set.seed(123)
train_index <- createDataPartition(df_clean$Late_delivery_risk, p = 0.8, list = FALSE)
train <- df_clean[train_index, ]
test  <- df_clean[-train_index, ]

# -----------------------------
# 5. Train Random Forest
# -----------------------------
model <- randomForest(
  Late_delivery_risk ~ .,
  data = train,
  ntree = 200,
  importance = TRUE
)

# -----------------------------
# 6. Confusion Matrix
# -----------------------------
pred <- predict(model, test)
cm <- confusionMatrix(pred, test$Late_delivery_risk)
print(cm)

# -----------------------------
# 7. ROC Curve
# -----------------------------
prob <- predict(model, test, type = "prob")[,2]  # probability of class "1"
roc_obj <- roc(test$Late_delivery_risk, prob)
plot(roc_obj, main = "ROC Curve - Random Forest")
auc(roc_obj)  # prints AUC score

# -----------------------------
# 8. Feature Importance Plot
# -----------------------------
importance_df <- data.frame(
  Feature = rownames(model$importance),
  Importance = model$importance[, "MeanDecreaseGini"]
)

ggplot(importance_df, aes(x = reorder(Feature, Importance), y = Importance)) +
  geom_bar(stat = "identity", fill = "steelblue") +
  coord_flip() +
  labs(
    title = "Reasons for high late delivery percent",
    x = "Features",
    y = "Importance "
  ) +
  theme_minimal()
