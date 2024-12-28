import mysql.connector
import configparser

config = configparser.ConfigParser()
config.read('../config.ini')

connection = mysql.connector.connect(
        host=config['mysql']['host'],
        user=config['mysql']['user'],
        password=config['mysql']['password'],
        database=config['mysql']['database']
)

def get_old_data(connection):
    with connection.cursor() as cursor:
        cursor.execute("SELECT * FROM superstars;")  # Replace with the actual old table name
        return cursor.fetchall()
    
def get_schema(connection):
    with connection.cursor() as cursor:
        cursor.execute("DESCRIBE superstars;")
        return cursor.fetchall()
    
print(get_old_data(connection))
print(get_schema(connection))