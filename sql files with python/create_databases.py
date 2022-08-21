import mysql.connector as mc
config={'user':'root','password':'Jan123'}
try:
    conn=mc.connect(**config)
    if(conn.is_connected()):
        print('connected')
except:
    print('unable to connect')
sql='CREATE database pdb'
myc=conn.cursor()
try:
    myc.execute(sql)
except:
    print('unable to create database')
myc.close()
conn.close()