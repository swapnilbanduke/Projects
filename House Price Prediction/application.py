import pickle
from flask import Flask,request,jsonify,render_template
import numpy as np
import pandas as pd
from sklearn.preprocessing import StandardScaler


from flask import Flask, request, render_template, jsonify
import util  # make sure util.py contains all necessary functions

application = Flask(__name__)
app=application


## import ridge regresor model and standard scaler pickle

model = pickle.load(open('model_rf.pkl', 'rb'))



@app.route('/predict_price', methods=['POST'])
def predict_price():
    # Extract data from form
    bedrooms = request.form['bed']
    bathrooms = request.form['bath']
    acre_lot = request.form['acre_lot']
    city = request.form['city']
    state = request.form['state']
    zip_code = request.form['zip_code']
    house_size = request.form['house_size']
    status_for_sale = request.form['status_for_sale']


    new_data = [Temperature, RH, Ws, Rain, FFMC, DMC, ISI, Classes, Region]
    result = ridge.predict([new_data])


    # Render the same template with the predicted price
    return render_template('home.html', predicted_price=predicted_price)

@app.route('/get_location_names')
def get_location_names():
    locations = util.get_location_names()
    return jsonify({'locations': locations})

@app.route("/")
def home():
    # Render the home page
    return render_template('your_template.html')

if __name__ == "__main__":
    app.run(host="0.0.0.0", debug=True)
