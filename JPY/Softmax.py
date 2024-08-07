import numpy as np
import matplotlib.pyplot as plt

x = np.arange(-6.0, 6.0, 0.1)
y = np.exp(x) / np.sum(np.exp(x))

plt.plot(x, y)
plt.title('Softmax Function')
plt.show()