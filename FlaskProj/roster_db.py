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

class Brand(Enum):
    SMACKDOWN = "SmackDown"
    RAW = "RAW"
    NXT = "NXT"

def get_roster_list(brand: Brand):
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

def get_all_wrestlers():
    try:
        conn = get_connection()
        with conn.cursor() as cursor:
            query = """
                SELECT id, name
                FROM roster
            """
            cursor.execute(query)
            result = cursor.fetchall()
            roster = [{"wrestler_id":entry[0], "wrestler_name":entry[1]} for entry in result]
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

def get_active_titles():
    connection = get_connection()
    try:  
        with connection.cursor() as cursor:
            query = "SELECT id, current_name FROM titles WHERE brand is NOT NULL"
            cursor.execute(query)
            result = [{"title_id": entry[0], "title_name": entry[1]} for entry in cursor.fetchall()]
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

def get_wrestlers_info():
    connection = get_connection()
    try:
        with connection.cursor() as cursor:
            query = "SELECT id, name, brand from roster"
            cursor.execute(query)
            wrestler_list = cursor.fetchall()
            wrestler_ids = [{"id": entry[0], "name": entry[1], "brand" : entry[2]}for entry in wrestler_list]
            return wrestler_ids
    except mysql.connector.Error as err:
        print(f"Database error: {err}")
        return []
    finally:
        connection.close()
        print("Database connection closed.")

def get_all_titles():
    connection = get_connection()
    try:  
        with connection.cursor() as cursor:
            query = "SELECT current_name, brand, img FROM titles"
            cursor.execute(query)
            result = [{"title": entry[0], "image": entry[1]} for entry in cursor.fetchall()]
            return result
    except mysql.connector.Error as err:
        print(f"Database error: {err}")
        return []
    finally:
        connection.close()
        print("Database connection closed.")

def get_title_url(belt): 
    connection = get_connection()
    try:  
        with connection.cursor() as cursor:
            query = "SELECT t.current_name, t.brand, t.img, r.name FROM titles as t JOIN title_holders as th ON t.id = th.title_id JOIN roster as r ON th.wrestler_id = r.id where t.img = %s"
            belt_img = belt + "_design.png"
            cursor.execute(query, (belt_img,))
            result = [{"titleImage" : entry[2], "titleName" : entry[0], "brand" : entry[1], "championName" : entry[3]} for entry in cursor.fetchall()]
            if len(result) > 1:
                result[0]["championName"] = result[0]["championName"] + " & " + result[1]["championName"]
            return result[0]
    except mysql.connector.Error as err:
        print(f"Database error: {err}")
        return []
    finally:
        connection.close()
        print("Database connection closed.")

def get_timesheld_from_database(belt):
    connection  = get_connection()
    try:
        with connection.cursor() as cursor:
            query = """SELECT r.name, count(r.name) as times_held 
                    FROM title_history as th 
                    JOIN roster as r ON th.champion_id = r.id 
                    JOIN titles as t ON th.title_id = t.id
                    WHERE t.img = %s
                    GROUP BY r.name 
                    ORDER BY times_held DESC 
                    LIMIT 3;
                    """
            belt_img = belt + "_design.png"
            cursor.execute(query, (belt_img,))
            result = cursor.fetchall()
            return result
    except mysql.connector.Error as err:
        print(f"Database error: {err}")
        return []
    finally:
        connection.close()
        print("Database connection closed.")       


def get_longestreign_from_database(belt):
    connection  = get_connection()
    try:
        with connection.cursor() as cursor:
            query = """SELECT r.name, th.reign_duration
                    FROM title_history as th 
                    JOIN roster as r ON th.champion_id = r.id 
                    JOIN titles as t ON th.title_id = t.id
                    WHERE t.img = %s
                    ORDER BY th.reign_duration DESC 
                    LIMIT 3;
                    """
            belt_img = belt + "_design.png"
            cursor.execute(query, (belt_img,))
            result = cursor.fetchall()
            return result
    except mysql.connector.Error as err:
        print(f"Database error: {err}")
        return []
    finally:
        connection.close()
        print("Database connection closed.")      

def get_combined_days_from_database(belt):
    connection  = get_connection()
    try:
        with connection.cursor() as cursor:
            query = """SELECT r.name, SUM(th.reign_duration) as combined_days
                    FROM title_history as th 
                    JOIN roster as r ON th.champion_id = r.id 
                    JOIN titles as t ON th.title_id = t.id
                    WHERE t.img = %s
                    GROUP BY r.name
                    ORDER BY combined_days DESC 
                    LIMIT 3;
                    """
            belt_img = belt + "_design.png"
            cursor.execute(query, (belt_img,))
            result = cursor.fetchall()
            return result
    except mysql.connector.Error as err:
        print(f"Database error: {err}")
        return []
    finally:
        connection.close()
        print("Database connection closed.") 

def get_title_history_from_database(belt):
    connection  = get_connection()
    try:
        with connection.cursor() as cursor:
            query = """SELECT th.reign_order, r.name, m.match_description, th.reign_duration
                    FROM title_history as th 
                    LEFT JOIN roster as r ON th.champion_id = r.id 
                    JOIN titles as t ON th.title_id = t.id
                    LEFT JOIN matches as m ON th.match_id = m.id
                    WHERE t.img = %s
                    ORDER BY th.reign_order ASC
                    """
            belt_img = belt + "_design.png"
            cursor.execute(query, (belt_img,))
            result = cursor.fetchall()
            return result
    except mysql.connector.Error as err:
        print(f"Database error: {err}")
        return []
    finally:
        connection.close()
        print("Database connection closed.") 

def get_all_titles_by_id():
    connection  = get_connection()
    try:
        with connection.cursor() as cursor:
            query = """SELECT id, current_name 
                    FROM titles
                    """
            cursor.execute(query)
            result = [{"id": entry[0], "title": entry[1]} for entry in cursor.fetchall()]
            return result
    except mysql.connector.Error as err:
        print(f"Database error: {err}")
        return []
    finally:
        connection.close()
        print("Database connection closed.") 

def get_all_events():
    connection  = get_connection()
    try:
        with connection.cursor() as cursor:
            query = """SELECT * 
                    FROM events
                    """
            cursor.execute(query)
            result = [{"id": entry[0], "event_name": entry[1], "event_month": entry[2], "event_year": entry[3], "event_season": entry[4], "event_week": entry[5]} for entry in cursor.fetchall()]
            return result
    except mysql.connector.Error as err:
        print(f"Database error: {err}")
        return []
    finally:
        connection.close()
        print("Database connection closed.") 