import mysql.connector as mc 
conn=mc.connect(host ='localhost' , user = 'root' , password = 'Jigar@975919', database='ineuron')
if(conn.is_connected()):
    print('jai ho mata Rani')
else:
    print('unable to connect')

myc  = conn.cursor()
qyery= "insert into ineuronstudent (name , roll , age , city) values(%s,%s,%s,%s)"
data = ('praveen' , 67 ,21 , 'prayagraj')
try:
    myc.execute(qyery, data)
    conn.commit()
    print(myc.rowcount, "row inserted")
except:
    print('unable to insert data')
    conn.rollback()
myc.close()
conn.close()