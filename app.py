from flask import Flask, request, jsonify
from flask_cors import CORS
import pickle  # Import for loading models

app = Flask(__name__)
CORS(app)
# Function to load models (replace with your actual loading logic)
def load_model(model_name):
  model_file = f"{model_name}_model.pkl"  # Assuming model files named accordingly
  return pickle.load(open(model_file, 'rb'))

# API Endpoints for each model
@app.route('/knn-predict', methods=['POST'])
def knn_predict():
  data = request.get_json()
  scores = data['scores']
  gender = data['gender']
  
  if gender == 'male':
    gender = 0
  else:
    gender = 1

  knn_model = load_model("knn")  # Use load_model function

  # Make prediction using KNN model (replace with your specific model usage)
  prediction = knn_model.predict([[scores['A1'], scores['A2'], scores['A3'], scores['A4'], scores['A5'], scores['A6'], scores['A7'], scores['A8'], scores['A9'], scores['A10'], gender]])[0]
  
  if prediction == 0:
    prediction = 'NO ASD'
  else:
    prediction = 'ASD Likely'
  return jsonify({'prediction': str(prediction)})

@app.route('/rf-predict', methods=['POST'])
def rf_predict():
  data = request.get_json()
  scores = data['scores']
  gender = data['gender']
  
  if gender == 'male':
    gender = 0
  else:
    gender = 1

  rf_model = load_model("rf")  # Use load_model function

  # Make prediction using KNN model (replace with your specific model usage)
  prediction = rf_model.predict([[scores['A1'], scores['A2'], scores['A3'], scores['A4'], scores['A5'], scores['A6'], scores['A7'], scores['A8'], scores['A9'], scores['A10'], gender]])[0]
  
  if prediction == 0:
    prediction = 'NO ASD'
  else:
    prediction = 'ASD Likely'
    
  return jsonify({'prediction': str(prediction)})

@app.route('/dt-predict', methods=['POST'])
def dt_predict():
  data = request.get_json()
  scores = data['scores']
  gender = data['gender']
  
  if gender == 'male':
    gender = 0
  else:
    gender = 1

  dt_model = load_model("dt")  # Use load_model function

  # Make prediction using KNN model (replace with your specific model usage)
  prediction = dt_model.predict([[scores['A1'], scores['A2'], scores['A3'], scores['A4'], scores['A5'], scores['A6'], scores['A7'], scores['A8'], scores['A9'], scores['A10'], gender]])[0]
  
  if prediction == 0:
    prediction = 'NO ASD'
  else:
    prediction = 'ASD Likely'
  return jsonify({'prediction': str(prediction)})

@app.route('/logistic-predict', methods=['POST'])
def logistic_predict():
  data = request.get_json()
  scores = data['scores']
  gender = data['gender']
  
  if gender == 'male':
    gender = 0
  else:
    gender = 1

  logistic_model = load_model("logistic")  # Use load_model function

  # Make prediction using KNN model (replace with your specific model usage)
  prediction = logistic_model.predict([[scores['A1'], scores['A2'], scores['A3'], scores['A4'], scores['A5'], scores['A6'], scores['A7'], scores['A8'], scores['A9'], scores['A10'], gender]])[0]
  
  if prediction == 0:
    prediction = 'NO ASD'
  else:
    prediction = 'ASD Likely'
  return jsonify({'prediction': str(prediction)})

if __name__ == '__main__':
  app.run(debug=False)  # Set debug=False for production
