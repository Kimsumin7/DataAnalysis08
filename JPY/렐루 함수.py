import numpy as np
import matplotlib.pyplot as plt

# ReLU 함수 정의
def relu(x):
    return np.maximum(0, x)

# x 값 생성
x = np.arange(-6.0, 6.0, 0.1)
y = relu(x)

# ReLU 함수 플롯
plt.plot(x, y, label='ReLU')

# x = 0 선 (y축) 플롯
plt.axvline(0, color='orange', linestyle=':')

plt.title('ReLU Function')
plt.xlabel('x')
plt.ylabel('ReLU(x)')
plt.legend()
plt.show()
