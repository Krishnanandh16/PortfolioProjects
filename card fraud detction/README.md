# CARD FRAUD DETECTION
# About dataset
It is important that credit card companies are able to recognize fraudulent credit card transactions so that customers are not charged for items that they did not purchase.

The dataset contains transactions made by credit cards in September 2013 by European cardholders. This dataset presents transactions that occurred in two days, where we have 492 frauds out of 284,807 transactions. The dataset is highly unbalanced, the positive class (frauds) account for 0.172% of all transactions.

It contains only numerical input variables which are the result of a PCA transformation. Unfortunately, due to confidentiality issues, we cannot provide the original features and more background information about the data. Features V1, V2, … V28 are the principal components obtained with PCA, the only features which have not been transformed with PCA are 'Time' and 'Amount'. Feature 'Time' contains the seconds elapsed between each transaction and the first transaction in the dataset. The feature 'Amount' is the transaction Amount, this feature can be used for example-dependant cost-sensitive learning. Feature 'Class' is the response variable and it takes value 1 in case of fraud and 0 otherwise.

Download link: https://www.kaggle.com/mlg-ulb/creditcardfraud

# Oversampling 
The data set is highly unbalanced and it should balance or  otherwise  the after training the dataset it will be baised towards the majority side and the model will be more biased. So here the dataset is oversampled using SMOTE which is imported from the imblearn  and made the Y_train set becommes equally split for the classes 0 and 1.That can be seen evidently seeen the y_sm

# Machine Learning
The machine learning algorithm used in here Logistic Regression and after using the SMOTE yields a better for accuracy and f1_score

f1_score before using SMOTE: 0.7204301075268817

f1_score before using SMOTE:0.9755745370936032

which indicates a better f_1 score after balancing the dataset
