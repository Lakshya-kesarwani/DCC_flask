from flask import Flask, render_template, request, redirect
from flask_mysqldb import MySQL
import yaml

app = Flask(__name__)

# Configure db
db = yaml.load(open('db.yaml'),Loader=yaml.FullLoader)
app.config['MYSQL_HOST'] = db['mysql_host']
app.config['MYSQL_USER'] = db['mysql_user']
app.config['MYSQL_PASSWORD'] = db['mysql_password']
app.config['MYSQL_DB'] = db['mysql_db']

mysql = MySQL(app)

'''Implement a robust search functionality that allows users to quickly
search for specific records based on Bond Number or filter data based on
any column in the table except Sr. No. and Status (e.g., date, political
party, company name). The output should be displayed in the form of a
table which is fetched from the database for a given query.'''

@app.route('/', methods=['GET', 'POST'])
def index():
    if request.method == 'POST':
        # Fetch form data
        record = request.form
        bond = record['bond']
        cur = mysql.connection.cursor()
        cur.execute("INSERT INTO results (SrNo,ReferenceNo,JournalDate,DateOfPurchase,DateOfExpiry,PurchaserName,Prefix,BondNumber,Denominations,IssueBranchCode,IssueTeller,Status) SELECT SrNo,ReferenceNo,JournalDate,DateOfPurchase,DateOfExpiry,PurchaserName,Prefix,BondNumber,Denominations,IssueBranchCode,IssueTeller,Status FROM eb_purchase WHERE BondNumber = %s",(bond,))
        cur.fetchall()
        
        
        
        # query = """
        # insert into results2 (year,count,total value)
        #     SELECT YEAR(`Date of Purchase`) AS purchase_year,
        #            COUNT(*) AS num_bonds,
        #            SUM(Denominations) AS total_value
        #     FROM your_table_name
        #     WHERE `Name of the Purchaser` = %s
        #     GROUP BY purchase_year
        #     ORDER BY purchase_year
        #     """
        # cur.execute(query, (selected_company,))
        
        
        mysql.connection.commit()
        cur.close()
        return redirect('/users')
    return render_template('index.html')

@app.route('/users')
def users():
    cur = mysql.connection.cursor()
    resultValue = cur.execute("SELECT * FROM results")
    if resultValue > 0:
        record = cur.fetchall()
        return render_template('users.html',record=record)
    

if __name__ == '__main__':
    app.run(debug=True)
