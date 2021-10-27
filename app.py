from flask import Flask
from flask import render_template
from flask import send_file
from flaskext.mysql import MySQL
from flask import request
mysql = MySQL(host="localhost", user="root", password="", db="movies")
app = Flask(__name__)
mysql.init_app(app)
conn = mysql.connect()

def prepare_data(movies):

    final_movies = []

    q = """SELECT mg.idmovie, g.title FROM moviegenre AS mg 
    LEFT JOIN genre AS g 
    ON mg.idgenre = g.idgenre 
    WHERE idmovie = """

    for movie in movies:
        cursor = conn.cursor()
        query = q + str(movie[0])
        cursor.execute(query)
        results = cursor.fetchall()
        genres = list(map(lambda x: x[1], results))
        modified_movie = list(movie)
        modified_movie.append(", ".join(genres))
        final_movies.append(modified_movie)
    return final_movies

@app.route('/')
def index():
    return("Hello Wolrd!")

# /movies/from/2016/to/2018
@app.route("/movies/from/<begin>/to/<end>")
def movies_by_range(begin, end):
    filter = f"WHERE year BETWEEN {begin} AND {end}"
    pass

@app.route('/movies')
def list_movies():

    q = request.args.get('q')

    cursor = conn.cursor()
    query = "SELECT * FROM movie "

    if q != None:
        query = query + f"WHERE title LIKE '%{q}%' " 
        query = query + f"OR director LIKE '%{q}%' " 
        query = query + f"OR plot LIKE '%{q}%'" 
        
    cursor.execute(query)
    results = cursor.fetchall()
    data = prepare_data(results)
    return render_template("index.html", movies = data)

@app.route('/styles.css')
def styles():
    return send_file("./assets/styles.css")