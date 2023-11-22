churn.df<-read.csv("LR 2.csv",header = TRUE)
churn.df$ChurnBoolean<-as.factor(churn.df$ChurnBoolean)

set.seed(2)
train<-sample(1:nrow(churn.df), (0.6)*nrow(churn.df))
train.df<-churn.df[train,]
test.df<-churn.df[-train,]

logit.reg <-glm(ChurnBoolean ~ Salary + JobSatisfaction + WorkLifeBalance + CommuteDistance + MaritalStatus + PerformanceRating + TrainingHours + OverTime + NumProjects + YearsSincePromotion, data = train.df, family = "binomial") 
summary(logit.reg)

logitPredict<-predict(logit.reg, test.df, type = "response")
logitPredictClass<-ifelse(logitPredict> 0.5, 1, 0)

#plotting
library(ggplot2)

# Plot Predicted data and original data points
ggplot(churn.df, aes(x=NumProjects, y=ChurnBoolean)) + geom_point() +
  stat_smooth(method="glm", color="red", se=FALSE, 
              method.args = list(family=binomial))

#confusion matrix
actual <- test.df$ChurnBoolean
predict <- logitPredictClass
cm <- table(predict, actual)
cm

tp<-cm[2,2]
tn<-cm[1,1]
fp<-cm[2,1]
fn<-cm[1,2]

#accuracy
logitaccuracy<-(tp+tn)/(tp+tn+fp+fn)
#TPR Recall Sensitivity
tpr<-tp/(fn+tp)
#TNR Specificity
tnr<-tn/(fp+tn)
#fpr
fpr<-fp/(fp+tn)
#fnr
fnr<-fn/(fn+tp)
