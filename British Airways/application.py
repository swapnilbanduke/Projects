from flask import Flask, request, render_template
import pickle
import pandas as pd
import bz2

app = Flask(__name__)

def decompress_pickle(file):
 data = bz2.BZ2File(file, 'rb')
 data = pickle.load(data)
 return data

model = decompress_pickle('models/modelForprediction.pkl.pbz2')

# Load the scaler
scaler = pickle.load(open("models/standardScalar.pkl", "rb"))
model = pickle.load(open('models/modelForprediction.pkl', "rb"))

# Assuming the scaler is saved in a file named 'scaler.pkl'
# Uncomment and modify the path if you have a scaler file
# scaler = pickle.load(open("scaler.pkl", "rb"))

@app.route('/')
def index():
    return render_template('index.html')

@app.route('/predictdata', methods=['GET', 'POST'])
def predict_datapoint():
    if request.method == 'POST':
        # Extracting form data
        num_passengers = int(request.form.get('num_passengers'))
        purchase_lead = float(request.form.get('purchase_lead'))
        length_of_stay = float(request.form.get('length_of_stay'))
        flight_hour = float(request.form.get('flight_hour'))
        flight_day = float(request.form.get('flight_day'))
        wants_extra_baggage = int(request.form.get('wants_extra_baggage'))
        wants_preferred_seat = int(request.form.get('wants_preferred_seat'))
        wants_in_flight_meals = int(request.form.get('wants_in_flight_meals'))
        flight_duration = float(request.form.get('flight_duration'))
        internet = int(request.form.get('Internet')) # Assuming this is a binary value
    
        round_trip = int(request.form.get('RoundTrip')) # Assuming this is a binary value
        one_way_trip = int(request.form.get('OneWayTrip')) # Assuming this is a binary value
        circle_trip = int(request.form.get('CircleTrip')) # Assuming this is a binary value

        # Preprocess data and make prediction
        new_data = pd.DataFrame([[num_passengers, purchase_lead, length_of_stay, flight_hour, flight_day, 
                                  wants_extra_baggage, wants_preferred_seat, wants_in_flight_meals, 
                                  flight_duration, internet, round_trip, one_way_trip, circle_trip]])

        # If using scaler, uncomment the next line
        # new_data = scaler.transform(new_data)

    
        scaled_data=scaler.transform(new_data)
        prediction = model.predict(new_data)

        if prediction[0] == 1:
            result = 'Booking is done with British Airways'
        else:
            result = 'Booking is not done with British Airways'

        return render_template('single_prediction.html', prediction_result=result)

    else:
        return render_template('home.html')

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000, debug=True)
