# Importing flask

from flask import *


# initializing our app

app=Flask(__name__)

# Creating routes

@app.route("/api/home")

# Defining our function
def home():
    return jsonify ({"message":"Welcome to home API"})



# Endpoint for products

@app.route("/api/products")

def products():
    return jsonify({"message":"Welcome to products api"})

# Endpoint for services

@app.route("/api/services")

def services():
    return jsonify({"message":"Welcome to services api"})



# Endpoint to calculate two numbers

@app.route("/api/calc",methods=["Post"])
def calc():
    numb1=request.form["numb1"]
    numb2=request.form["numb2"]
    sum= int(numb1)+int(numb2)
    return jsonify({"Answer is":sum})


@app.route("/api/simpleintrest",methods=["POST"])

def simpleintrest():
    rate=request.form["rate"]
    principle=request.form["principle"]
    time=request.form["time"]
    simpleintrest=int(principle)*int(time)*int(rate)
    return jsonify({"simple intrest is":simpleintrest})



# Running the application 







app.run(debug=True)
