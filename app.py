# Impor4ting flask
from flask import *
import pymysql
import pymysql.cursors
import os

# Initialize your app
app=Flask(__name__)

# Configure your project to save the image to our folder

app.config["UPLOAD_FOLDER"]='static/images'

# Creating a route
@app.route("/api/signup",methods=["POST"])

# Extarcting user inputs from a form
def signup():
    username=request.form["username"] 
    email=request.form["email"]
    password=request.form["password"]
    phone=request.form["phone"]

    # Conecting to our database

    connection=pymysql.connect(user="root",host="localhost",password="",database="simbasokogarden")

    # Executing sql queries
    cursor=connection.cursor()

    sql="insert into users(username,password,email,phone)values(%s,%s,%s,%s)"

    # define our data
    data=(username,password,email,phone)

    # Execute our data

    cursor.execute(sql,data)

    # save to database

    connection.commit()

    return jsonify({"message":"Thank you for joining"})



# sign in

@app.route("/api/signin",methods=["POST"])

def signin():
    email=request.form["email"]
    password=request.form["password"]

    connection=pymysql.connect(user="root",host="localhost",password="", database="simbasokogarden")

    cursor=connection.cursor(pymysql.cursors.DictCursor)

    sql="select * from users where email=%s and password=%s"

    data=(email,password)

    cursor.execute(sql,data)

    if cursor.rowcount==0:
            return jsonify({"message":"login failed"})
    else:
         user=cursor.fetchone()
         return jsonify({"message":"login successful","user":user})
    

    # Upload products


# Creating routes

@app.route("/api/addproducts", methods=["POST"])

def addproducts():
     
    #  Extracting product details from a form

     product_name=request.form["product_name"]
     product_description=request.form["product_description"]
     product_cost=request.form["product_cost"]
     product_photo=request.files["product_photo"]


    #  Extracting the file name from the product photo
     filename=product_photo.filename

    #  specify he path to our static folder tha contains images folder

     photopath=os.path.join(app.config["UPLOAD_FOLDER"],filename)

     product_photo.save(photopath)



     connection=pymysql.connect(user="root",host="localhost",password="",database="simbasokogarden")


     cursor=connection.cursor()

     sql="insert into product_details(product_name,product_description,product_cost,product_photo)values(%s,%s,%s,%s)"

     data=(product_name,product_description,product_cost,filename)

     cursor.execute(sql,data)

     connection.commit()

     return jsonify ({"message":"Product details added sucessfully"})


    #  Get products endpoint
@app.route("/api/getproductdetails")
def getproductdetais():
     
     connection=pymysql.connect(user="root", host="localhost", password="", database="simbasokogarden")

     cursor=connection.cursor(pymysql.cursors.DictCursor)

     cursor.execute("select * from product_details")

    #  Fetch the products from the database
     productdetails=cursor.fetchall()
     
     return jsonify(productdetails)


import requests
import datetime
import base64
from requests.auth import HTTPBasicAuth

@app.route('/api/mpesa_payment', methods=['POST'])
def mpesa_payment():
    if request.method == 'POST':
    # Extract POST Values sent
        amount = request.form['amount']
        phone = request.form['phone']

        # Provide consumer_key and consumer_secret provided by safaricom
        consumer_key = "GTWADFxIpUfDoNikNGqq1C3023evM6UH"
        consumer_secret = "amFbAoUByPV2rM5A"

        # Authenticate Yourself using above credentials to Safaricom Services, and Bearer Token this is used by safaricom for security identification purposes - Your are given Access
        api_URL = "https://sandbox.safaricom.co.ke/oauth/v1/generate?grant_type=client_credentials" # AUTH URL
        # Provide your consumer_key and consumer_secret
        response = requests.get(api_URL, auth=HTTPBasicAuth(consumer_key, consumer_secret))
        # Get response as Dictionary
        data = response.json()
        # Retrieve the Provide Token
        # Token allows you to proceed with the transaction
        access_token = "Bearer" + ' ' + data['access_token']

        # GETTING THE PASSWORD
        timestamp = datetime.datetime.today().strftime('%Y%m%d%H%M%S') # Current Time
        passkey = 'bfb279f9aa9bdbcf158e97dd71a467cd2e0c893059b10f78e6b72ada1ed2c919' # Passkey(Safaricom Provided)
        business_short_code = "174379" # Test Paybile (Safaricom Provided)
        # Combine above 3 Strings to get data variable
        data = business_short_code + passkey + timestamp
        # Encode to Base64
        encoded = base64.b64encode(data.encode())
        password = encoded.decode()

        # BODY OR PAYLOAD
        payload = {
        "BusinessShortCode": "174379",
        "Password":password,
        "Timestamp": timestamp,
        "TransactionType": "CustomerPayBillOnline",
        "Amount": '1', # use 1 when testing
        "PartyA": phone, # change to your number
        "PartyB": "174379",
        "PhoneNumber": phone,
        "CallBackURL": "https://coding.co.ke/api/confirm.php",
        "AccountReference": " simba SokoGarden Online",
        "TransactionDesc": "Payments for Products"
        }

        # POPULAING THE HTTP HEADER, PROVIDE THE TOKEN ISSUED EARLIER
        headers = {
        "Authorization": access_token,
        "Content-Type": "application/json"
        }

        # Specify STK Push Trigger URL
        url = "https://sandbox.safaricom.co.ke/mpesa/stkpush/v1/processrequest"
        # Create a POST Request to above url, providing headers, payload
        # Below triggers an STK Push to the phone number indicated in the payload and the amount.
        response = requests.post(url, json=payload, headers=headers)
        print(response.text) #
        # Give a Response
        return jsonify({"message": "An MPESA Prompt has been sent to Your Phone, Please Check & Complete Payment"})





     


app.run(debug=True)
