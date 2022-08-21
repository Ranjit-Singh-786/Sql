import mysql.connector as mc 
conn=mc.connect(host ='localhost' , user = 'root' , password = 'Jigar@975919', database='ineuron')
if(conn.is_connected()):
    print('jai ho mata Rani')
else:
    print('unable to connect')

query = "UPDATE ineuronstudent set  roll = %s , city = %s WHERE stuid =%s "
roll = int(input('enter the update roll number :- '))
city = input('enter your updated city name :- ')
id = int(input('enter the student id :- '))
param = (roll,city,id)
try:
    myc = conn.cursor()
    myc.execute(query , param)
    conn.commit()
except:
    print('unable to update ')
    conn.rollback()
myc.close()
conn.close()