# ............simple fetchone retrieve data from the sql database by using python............


import mysql.connector as mc 
conn=mc.connect(host ='localhost' , user = 'root' , password = 'Jigar@975919', database='ineuron')
if(conn.is_connected()):
    print('jai ho mata Rani')
else:
    print('unable to connect')
query = "select * from ineuronstudent"
myc = conn.cursor()
try:
    myc.execute(query)
    row = myc.fetchone()
    while row is not None:
        print(row)
        row = myc.fetchone()
except:
    print('unable to fetch')
myc.close()
conn.close()