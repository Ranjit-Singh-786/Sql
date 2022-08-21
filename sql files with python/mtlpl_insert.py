import mysql.connector as mc 
conn=mc.connect(host ='localhost' , user = 'root' , password = 'Jigar@975919', database='ineuron')
if(conn.is_connected()):
    print('jai ho mata Rani')
else:
    print('unable to connect')

myc  = conn.cursor()
qyery= "insert into ineuronstudent (name , roll , age , city) values(%s,%s,%s,%s)"
data = [('shivam' , 69 ,22 , 'nenital'),('padmesh' , 70 ,26 , 'hyderabad'),('aman' ,19 ,20 , 'devariya')]         
# multiple data
try:
    myc.executemany(qyery, data)     # function changed for multiple record
    conn.commit()
    print(myc.rowcount, "row inserted")
except:
    print('unable to insert data')
    conn.rollback()
myc.close()
conn.close()