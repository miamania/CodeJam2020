#!/usr/bin/env python3

from imageai.Prediction.Custom import CustomImagePrediction
import os

execution_path = os.getcwd()

prediction = CustomImagePrediction()
prediction.setModelTypeAsResNet()
prediction.setModelPath("model_ex-101_acc-0.957747.h5")
prediction.setJsonPath("model_class.json")
prediction.loadModel(num_objects=15)

predictions, probabilities = prediction.predictImage("image.jpeg", result_count=3)

for eachPrediction, eachProbability in zip(predictions, probabilities):
    print(eachPrediction , " : " , eachProbability)
