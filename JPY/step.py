import numpy as np
import matplotlib.pyplot as plt

def step(x):
    return np.array(x > 0, dtype = np.int)
x = np.arange(-6.0, 6.0, 0.1)
y = step(x)
plt.title('Step Function')
plt.plot(x, y)
plt.show()