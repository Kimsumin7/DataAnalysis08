# Importing necessary libraries
from tensorflow import keras

# Load the MNIST dataset
(x_train, y_train), (x_test, y_test) = keras.datasets.mnist.load_data()

# Flatten the data
x_train = x_train.reshape([60000, 28*28])
x_test = x_test.reshape([10000, 28*28])

# Convert labels to one-hot encoding
y_train = keras.utils.to_categorical(y_train, 10)
y_test = keras.utils.to_categorical(y_test, 10)

# Data Preprocessing: Normalize the data
x_train = x_train.astype("float32") / 255.0
x_test = x_test.astype("float32") / 255.0

# Update Model Structure
#128 하나 더 추가
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

evaluation
