import numpy as np
from scipy.stats import norm
import matplotlib.pyplot as plt
x_array = np.linspace(-10, 10, 100)    
variance = 4
# Find the square root of variance

num_samples = 100
std_dev = variance ** 0.5
mean = 2
x = np.random.normal(mean, std_dev, num_samples)

xmean = np.mean(x)
print(xmean)

# y_pdf = norm.pdf(x_array, loc=mean, scale=std_dev)
# plt.plot(x_array, y_pdf)
# plt.show()

# quantile of the standard normal distribution
# qnorm(0.975)
U = xmean - norm.ppf(0.975) * np.sqrt(std_dev/num_samples)
V = xmean + norm.ppf(0.975) * np.sqrt(std_dev/num_samples)
print(U, V)
