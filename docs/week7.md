# Week 7: Dichotomous Predictors, Non-Linearity, and Data Transformations (02/23/2023)
Ozlem Tuncel 

otuncelgurlek1@gsu.edu

> ⚠️ **CAUTION**: DO NOT SOLELY RELY ON MY NOTES. THERE MIGHT BE TYPOS AND MISTAKES.

✔️ The goal of this week is to learn about binary independent variables and data transformations. 

## Here are some key points:
- Substantive meaning: clearly describe the effect that you observe on your regression result. 
- We can use interval and ratio as DV in OLS (and if we have enough number of categories, ordinal can be also used)
- We can use factors, ordinal, interval, and ratio as independent variables. But, when using factors (binary variable), be careful about interpretation. 
- Notational D is a vector of binary variables 
- Dichotomous, dummy, factor, binary, indicator - these are all the same thing
- Since $D_l$ are mutually exclusive and exhaustive, we need to omit the "reference category" or $\beta_0$ (due to perfect multicollinearity)
- If we omit the reference the category, it becomes the baseline, and we can interpret using the comparison with the baseline. 
- 

## Some suggestions:
- Want to learn more about factors in R, [see this](https://stats.oarc.ucla.edu/r/modules/factor-variables/)
- See [Figure 15.14 in this chapter](https://livebook.manning.com/book/math-for-programmers/chapter-15/v-10/138), if you are curious about how logistic regression looks like in 3D.
- Read more about binary variables and intercept shift [here](https://rpubs.com/cyobero/dummy-variables)
