from enum import Enum
import mysql.connector
import configparser

config = configparser.ConfigParser()
config.read('config.ini')

def get_connection():
        return mysql.connector.connect(
        host=config['mysql']['host'],
        user=config['mysql']['user'],
        password=config['mysql']['password'],
        database=config['mysql']['database']
)

class Roster(Enum):
    SMACKDOWN = "SmackDown"
    RAW = "RAW"
    NXT = "NXT"

def get_roster_list(brand: Roster):
    try:
        conn = get_connection()
        with conn.cursor() as cursor:
            query = """
                SELECT name
                FROM roster
                WHERE brand = %s AND status = 'ACTIVE'
                ORDER BY gender
            """
            cursor.execute(query, (brand.value,))
            result = cursor.fetchall()
            if not result:
                print(f"No results found for brand {brand.value}")
            roster = [x[0] for x in result]
        return roster
    except mysql.connector.Error as err:
        print(f"Error: {err}")
        return []
    finally:
        conn.close()


def get_champions():
    connection = get_connection()
    try:
        print("Fetching champions from database...")
        with connection.cursor() as cursor:
            query = """
                SELECT 
                    titles.current_name AS title,
                    roster.name AS superstar,
                    titles.img AS image
                FROM 
                    title_holders
                INNER JOIN 
                    titles ON title_holders.title_id = titles.id
                INNER JOIN 
                    roster ON title_holders.wrestler_id = roster.id
                ORDER BY 
                    titles.brand, titles.title_type, titles.current_name
            """
            print(f"Executing query: {query}")
            cursor.execute(query)
            
            result = [{"title": entry[0], "name": entry[1], "image" : entry[2]} for entry in cursor.fetchall()]
            print(f"Query result: {result}")
        return result
    except mysql.connector.Error as err:
        print(f"Database error: {err}")
        return []
    finally:
        connection.close()
        print("Database connection closed.")

def get_retired_titles():
    connection = get_connection()
    try:  
        with connection.cursor() as cursor:
            query = "SELECT current_name, img FROM titles WHERE brand is NULL"
            cursor.execute(query)
            result = [{"title": entry[0], "image": entry[1]} for entry in cursor.fetchall()]
            print("Retired titles: ", result)
            return result
    except mysql.connector.Error as err:
        print(f"Database error: {err}")
        return []
    finally:
        connection.close()
        print("Database connection closed.")

def get_wrestler_id_names():
    connection = get_connection()
    try:
        with connection.cursor() as cursor:
            query = "SELECT id, name, brand from roster"
            cursor.execute(query)
            wrestler_list = cursor.fetchall()

            """ for id_name in wrestler_list:
                wrestler_ids.append(id_name) """
            wrestler_ids = [{"id": entry[0], "name": entry[1], "brand" : entry[2]}for entry in wrestler_list]
            return wrestler_ids
    except mysql.connector.Error as err:
        print(f"Database error: {err}")
        return []
    finally:
        connection.close()
        print("Database connection closed.")