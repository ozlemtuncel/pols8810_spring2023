
# Week 6: Multiple Regression and Inference (02/16/2023)
Ozlem Tuncel 

otuncelgurlek1@gsu.edu

> ⚠️ **CAUTION**: DO NOT SOLELY RELY ON MY NOTES. THERE MIGHT BE TYPOS AND MISTAKES. ALWAYS TAKE YOUR NOTES!

✔️ The goal of this week is to learn multiple OLS and inference. 

## Here are some key points:
- Just like bivariate regression, now we have multiple independent variables. 
- $\beta = ({X^\prime} X)^-1 {X^\prime}Y$ - knowing this by heart will help you with proofs
- **Gauss-Markov Assumptions**
  1. **Linearity** - our parameters (our betas) are linear! 
  2. **No Perfect Multicollinearity** (Full Rank) (perfect multicollinearity is when your variables are strongly correlated) and **N>K** (number of observations should be bigger than number of variables. 
  3. **E(u)=0** Conditional Mean Zero assumption - so our average error term should be zero. Xs are exogenous => E(u|X) = 0. This assumption fails if X and u are correlated.
  4. **Spherical Disturbances (Homoskedasticity and Autocorrelation)** autocorrelation mostly deals with time and homoskedasticity mostly deals with space. Our error terms are not correlated with each other under homoskedasticity (within-group correlation will cause heteroskedasticity). And, there is no correlation between the error term and independent variables. 
  5. **Non-stochastic Regressors** - we are measuring things that vary but we assume that they are fixed. $Cov(X, u) = 0$. This assumption also assumes that we do not have measurement error. 
  6. **Normality** or $u \sim N[0, \sigma^2 I]$
- Violations of most assumptions, won't bias our coefficient estimates, but we will have no clue about the precision of our estimates because our standard errors will be way off. 
- Consistencty is asymptotic (aka large sample size) characteristics. 
- 


## Some recommendations: 
- Further, explanation of linearity in parameters. [See here](https://mgkim.blog/2017/06/19/linearity-in-parameters/)
- If you are curious about visual guide to spherical disturbances, [see here](https://kaomorphism.com/socraticregression/ols.html)
