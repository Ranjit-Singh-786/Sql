# ............simple retrieve data from the sql database by using python............

from logging import exception
import mysql.connector as mc 
conn=mc.connect(host ='localhost' , user = 'root' , password = 'Jigar@975919', database='ineuron')
if(conn.is_connected()):
    print('jai ho mata Rani')
else:
    print('unable to connect')
query = "select * from ineuronstudent"
try:
    myc = conn.cursor()
    myc.execute(query)
    row = myc.fetchall()
    for record in row:
        print(record)
except :
    # print(e)
    print('unable to fetch your data')
myc.close()
conn.close()



