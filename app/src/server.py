# import os
import flask
import psycopg2
# import json
# import mysql.connector

# for debugging from Visual Studio Code -- turn off flask debugger first
# import ptvsd
# ptvsd.enable_attach(address=('0.0.0.0', 3000))


class DBManager:
    # def __init__(self, database='example', host="db",
    #     user="root", password_file=None):
    #     pf = open(password_file, 'r')
    #     self.connection = mysql.connector.connect(
    #         user=user,
    #         password=pf.read(),
    #         host=host,
    #         database=database,
    #         auth_plugin='mysql_native_password'
    #     )
    #     pf.close()
    #     self.cursor = self.connection.cursor()

    def __init__(self,
                 database="postgres",
                 host="db",
                 user="postgres",
                 password_file=None
                 ):
        pf = open(password_file, 'r')
        self.connection = psycopg2.connect(
            host=host,
            port=5432,
            dbname=database,
            user=user,
            password=pf.read()
        )
        pf.close()
        self.cursor = self.connection.cursor()

    def query_database_names(self):
        self.cursor.execute('SELECT datname FROM pg_database')
        dbn = []
        for c in self.cursor:
            dbn.append(c[0])
        return dbn

    def query_titles(self):
        self.cursor.execute('SELECT title FROM blog')
        rec = []
        for c in self.cursor:
            rec.append(c[0])
        return rec


server = flask.Flask(__name__)
# conn = None
conn = DBManager(password_file='/run/secrets/db-password')


@server.route('/dblist')
def dblist():
    global conn
    dblist = conn.query_database_names()
    result = []
    for c in dblist:
        result.append(c)
    return flask.jsonify({"response": result})


@server.route('/blogs')
def listBlog():
    global conn
    if not conn:
        conn = DBManager(password_file='/run/secrets/db-password')
        conn.populate_db()
    rec = conn.query_titles()

    result = []
    for c in rec:
        result.append(c)

    return flask.jsonify({"response": result})


@server.route('/')
def hello():
    return flask.jsonify({"response": "Hello from Docker!"})


if __name__ == '__main__':
    server.run(debug=True, host='0.0.0.0', port=5000)
