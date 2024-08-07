# 필요한 라이브러리 임포트
from tensorflow import keras
import matplotlib.pyplot as plt

# MNIST 데이터셋 로드
(x_train, y_train), (x_test, y_test) = keras.datasets.mnist.load_data()

# 데이터 평탄화
x_train = x_train.reshape([60000, 28*28])
x_test = x_test.reshape([10000, 28*28])

# 레이블을 원-핫 인코딩으로 변환
y_train = keras.utils.to_categorical(y_train, 10)
y_test = keras.utils.to_categorical(y_test, 10)

# 데이터 전처리: 정규화
x_train = x_train.astype("float32") / 255.0
x_test = x_test.astype("float32") / 255.0

# 모델 구조 업데이트: 활성화 함수를 ReLU로 변경
model = keras.Sequential([
    keras.layers.Dense(128, activation="relu", input_shape=(28*28,)),
    keras.layers.BatchNormalization(),
    keras.layers.Dense(128, activation="relu"),
    keras.layers.BatchNormalization(),
    keras.layers.Dense(128, activation="relu"),
    keras.layers.BatchNormalization(),
    keras.layers.Dense(128, activation="relu"),
    keras.layers.BatchNormalization(),
    keras.layers.Dense(10, activation="softmax")  # 출력층의 활성화 함수를 softmax로 변경
])

# Adam 옵티마이저 사용
optimizer = keras.optimizers.Adam()

# 모델 컴파일: 손실 함수와 평가 지표는 동일하게 유지
model.compile(optimizer=optimizer, loss="categorical_crossentropy", metrics=["accuracy"])

# 에포크 수를 증가시킴
training_history = model.fit(x_train, y_train, batch_size=32, epochs=20, validation_data=(x_test, y_test))

# 모델 평가
evaluation = model.evaluate(x_test, y_test)

# Jupyter Notebook에서 인라인 플롯을 활성화
%matplotlib inline

# 에포크별 정확도와 손실 그래프를 출력
plt.figure(figsize=(12, 5))

# 정확도 그래프
plt.subplot(1, 2, 1)
plt.plot(training_history.history['accuracy'], label='Train Accuracy')
plt.plot(training_history.history['val_accuracy'], label='Validation Accuracy')
plt.xlabel('Epochs')
plt.ylabel('Accuracy')
plt.title('Epochs vs Accuracy')
plt.legend()

# 손실 그래프
plt.subplot(1, 2, 2)
plt.plot(training_history.history['loss'], label='Train Loss')
plt.plot(training_history.history['val_loss'], label='Validation Loss')
plt.xlabel('Epochs')
plt.ylabel('Loss')
plt.title('Epochs vs Loss')
plt.legend()

plt.tight_layout()
plt.show()

# 평가 결과 출력
evaluation
