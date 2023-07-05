from flask import Flask, render_template
import sqlite3
import os
import os.path

cwd = os.getcwd()
os.chdir('BugTracker')
# BASE_DIR = os.path.dirname(os.path.abspath(__file__))
# db_path = os.path.join(BASE_DIR, "testDB.db")
# with sqlite3.connect(db_path) as db:

app = Flask(__name__)

@app.route('/main')


def index():
    # Connect to the SQLite database
    conn = sqlite3.connect('testDB.db')
    cursor = conn.cursor()
    print("Current working directory: {0}".format(cwd))
    # Retrieve data from the database
    cursor.execute('SELECT ratings_description FROM Ratings')
    ratings = cursor.fetchall()
    # Close the database connection
    cursor.close()
    conn.close()

    # Pass the retrieved data to the HTML template
    return render_template('bugpage1.html', ratings=ratings)

if __name__ == '__main__':
    app.run()