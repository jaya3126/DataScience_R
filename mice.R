library("mice")
input_data <- nhanes
View(input_data)
input_data$hyp <- as.factor(input_data$hyp)
summary(input_data)
input_data$bmi[which(is.na(input_data$bmi))] <- mean(input_data$bmi,na.rm = TRUE)
which(is.na(input_data$chl))
input_data$chl[which(is.na(input_data$chl))] <- mean(input_data$chl,na.rm = TRUE)
input_da2 <- nhanes
input_da2$hyp <- as.factor(input_da2$hyp)
my_imp <- mice(input_da2,m=5,method = c("","pmm","logreg","pmm"),maxit = 20)
summary(input_da2$bmi)
my_imp$imp$bmi
final_cl_ds <- complete(my_imp,5)
