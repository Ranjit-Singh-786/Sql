import mysql.connector as mc
config={'user':'root','password':'Jan123','port':3306,'host':'localhost','database':'pdb'}
try:
    conn=mc.connect(**config)
    if(conn.is_connected()):
        print('connected')
except:
    print('unable to connect')
myc=conn.cursor()
# sql='show tables'
try:
    myc.execute('show tables')
    for i in myc:
        print(i)

except:
    print('unable to show')
myc.close()
conn.close()
