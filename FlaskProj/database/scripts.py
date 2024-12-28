import mysql.connector
import configparser

config = configparser.ConfigParser()
config.read('config.ini')

connection = mysql.connector.connect(
        host=config['mysql']['host'],
        user=config['mysql']['user'],
        password=config['mysql']['password'],
        database=config['mysql']['database']
)

def fill_event_table():

    post_jul = ["RAW 1","RAW 2", "SmackDown 1", "SmackDown 2", "NXT 1", "NXT 2", "Main Event"]
    ppv = ["","Royal Rumble", "Fast Lane", "WrestleMania 8", "Payback", "Extreme Rules", "Money In The Bank", "Battleground", "Summerslam", "Clash of Champions", "Hell In A Cell/No Mercy", "Survivor Series", "Roadblock/TLC"]
    nxt_ppv = ["NXT TakeOver: Lisbon", "NXT TakeOver: Fânzeres"]

    #Arranjar maneira de meter os takeovers nos sitios certos as well as brand specific ppvs
    cursor = connection.cursor()
    for i in range(1,13):
        for bebo in post_jul:
            query = f"""
                INSERT INTO event (season, year, month, name)
                VALUES (3,7,{i}, '{bebo}')
                """
            cursor.execute(query)

        query = f"""
                INSERT INTO event (season, year, month, name)
                VALUES (3,7,{i}, '{ppv[i]}')
                """
        cursor.execute(query)

    connection.commit()

fill_event_table()