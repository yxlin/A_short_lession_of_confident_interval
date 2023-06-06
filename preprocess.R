rm(list = ls())
setwd("F:/[01]Life/[01]Jobs/[02]Leeds/job8_EPSMA1082")
pkg <- c("data.table", "ggplot2")
tmp_sink <- sapply(pkg, require, character.only = TRUE)
# Take-home message: The method to calculate confidence interval for a 
# (sample) mean
# Three pillars to understand the method:
# 1. The mean of the sampling distribution of the mean is the population mean
# 2. The standard deviation of the sampling distribution of the mean is the 
# standard error
# 3. The sampling distribution of the mean is approximately normal if the 
#sample size is large enough

n <- 100
mu <- 2
std_dev <- 4
for(i in 1:1000) {
    x <- rnorm(n, mu, std_dev)
    if( mean(x) < 1.721 & mean(x) > 1.720) {
        print("Found it!")
        output <- x
        print( mean(output) )
        break
    }
}

mean(x) - qnorm(0.975) * sqrt(std_dev/n)
mean(x) + qnorm(0.975) * sqrt(std_dev/n)

# Plot a normal distribution, using ggplot2
x <- seq(-4, 4, length = 100)
y <- dnorm(x, mean = 0, sd = 1)
df <- data.frame(x, y)
p0 <- ggplot(df, aes(x, y)) +
    geom_line(size = 5) + 
    geom_vline(xintercept = -1.96, linewidth = 1) +
    geom_vline(xintercept = 1.96, linewidth = 1) +
    
    xlab("Quantiles") + ylab("Density") +
    scale_x_continuous(breaks = c(-4, -3, -1, 0, 1,  4)) +
    theme_classic(base_size = 24)
p0

# Output pdf image file
cairo_pdf("normal2.pdf", width = 8, height = 6)
print(p0)
dev.off()
