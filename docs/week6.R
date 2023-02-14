###
### Purpose: Week 6 - Multiple Regression: Estimation and Inference
### Author: Ozlem Tuncel (otuncelgurlek1@gsu.edu)
### Date: 02//2023
### R version: 4.2.2 Innocent and Trusting
###

### Load necessary packages ----
# Use install.packages() if you do not have this package
library(tidyverse) # Data manipulation
library(stargazer) # Creates nice regression output tables
library(lmtest)    # Breusch-Pagan test 
library(psych)     # Histograms and correlations for a data matrix

### Load your data ----
# We are using V-Dem version 12 
my_data <- readRDS("data/vdem12.rds") 

# Let's change names of some of these variables for the sake of simplicity
# I am also subsetting it to only US
us_data <- my_data |>
  filter(country_name == "United States of America") |> 
  rename(democracy = v2x_polyarchy, 
         gdp_per_capita = e_gdppc,
         urbanization = e_miurbani)

### Bivariate OLS ----
# Let's fit a bivariate and multivariate models
simple <- lm(democracy ~ gdp_per_capita, data = us_data)
multiple <- lm(democracy ~ gdp_per_capita + urbanization, data = us_data)

# View model summary
summary(bivariate)
summary(multiple)

stargazer(simple, multiple,
          type = "text",
          title = "Factors explaining democracy in the US",
          covariate.labels = c("GDP per capita", "Urbanization"), 
          dep.var.labels = c("Democracy"),
          column.labels = c("Simple OLS", "Multiple OLS"),
          ci.level = 0.95, 
          star.cutoffs = c(0.05), 
          notes.align = "l",
          notes.append = FALSE,
          notes.label = "Notes", 
          notes = "p < 0.05. Standard errors are in parentheses.",
          p.auto = T,
          report = "vcsp*")

### Gauss-Markov assumptions using plot() ----
# Let's start with the easiest way
# plot() function will help us to understand these assumptions
par(mfrow = c(2,2)) # this helps me to plot 4 plots at the same time
plot(multiple)

# First plot (left top corner) helps us with homoscedasticity + linearity (red line)
# Second plot (left down corner) helps us with homogeneity of variance
# Third plot (right top corner) helps us with normality of residuals
# Fourth plot (right down corner) shows outliers adn high leverage points

par(mfrow = c(1,1)) # return back to single plot in a page 

### Gauss-Markov assumptions using other functions ----
# Looking for heteroskedasticity - plot residuals ~ fitted.values
multiple |> 
  ggplot(aes(x = .fitted, y = .resid)) + 
  geom_point(col = 'blue') + 
  geom_abline(slope = 0) +
  labs(x = "Fitted values", y = "Residuals") + 
  theme_bw()

# Perform Breusch-Pagan test
bptest(multiple)

# Since the p-value is less than 0.05, we reject the null hypothesis. 
# We have sufficient evidence to say that heteroscedasticity is present in the model.

# Linearity of Relationship
# Use qqnorm and qqline to examine linearity assumption
qqnorm(residuals(multiple), ylab = "Residuals")
qqline(residuals(multiple))

# Normality of Residuals 
hist(multiple$residuals)
sd(multiple$residuals)

# Testing for multicollinearity 
us_data |> 
  select(democracy, gdp_per_capita, urbanization) |> 
  pairs.panels(lm = T,
               method = "pearson")

# Serial/autocorrelation
# You can visualize or use a test
# Durbin-Watson test for autocorrelation
dwtest(multiple, data = us_data)

# Or, plot residuals for autocorrelation
stats::acf(multiple$residuals, type = "correlation")
