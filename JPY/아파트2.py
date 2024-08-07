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
#128 하나 줄인거
model = keras.Sequential([
    keras.layers.Dense(128, activation="sigmoid", input_shape=(28*28,)),
    keras.layers.BatchNormalization(),
    keras.layers.Dense(128, activation="sigmoid"),
    keras.layers.BatchNormalization(),
    keras.layers.Dense(10, activation="sigmoid")
])

# Use the Adam optimizer
optimizer = keras.optimizers.Adam()

# Compile the model with the same loss and metrics
model.compile(optimizer=optimizer, loss="categorical_crossentropy", metrics=["accuracy"])

# Increase the number of epochs
training_history = model.fit(x_train, y_train, batch_size=32, epochs=20, validation_data=(x_test, y_test))

# Evaluate the model
evaluation = model.evaluate(x_test, y_test)

evaluation
