## @knitr Practice1
### Generate data
set.seed(20120518)
{
x = runif(30, -10, 10)
eps = rnorm(30)
}
beta0 = 1
beta1 = 2
y = beta0 + beta1*x + eps

### Calculate beta
meanx = mean(x)
meany = mean(y)
temp1 = x - meanx
temp2 = y - meany
Sxy = sum(temp1 * temp2)
Sxx = sum(temp1^2)
beta1hat = Sxy/Sxx
beta0hat = meany - beta1hat*meanx
beta0hat; beta1hat

### Calculate the confidence interval
n = length(x)
yhat = beta0hat + beta1hat*x
sigmahat = sum((y - yhat)^2)/(n - 2)
varbeta0 = sigmahat*(1/n + meanx^2/Sxx)
varbeta1 = sigmahat/Sxx
sdbeta0 = sqrt(varbeta0)
sdbeta1 = sqrt(varbeta1)
sdbeta0; sdbeta1
c(beta0hat + qt(0.025, df = n-2)*sdbeta0, beta0hat + qt(0.975, df = n-2)*sdbeta0)
c(beta1hat + qt(0.025, df = n-2)*sdbeta1, beta1hat + qt(0.975, df = n-2)*sdbeta1)

### Comparison with lm function
lm.res = lm(y ~ x)
summary(lm.res)
confint(lm.res)
