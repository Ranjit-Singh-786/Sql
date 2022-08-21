# ...........insert multiple data by using dict parameter queris...........


import mysql.connector as mc 
conn=mc.connect(host ='localhost' , user = 'root' , password = 'Jigar@975919', database='ineuron')
if(conn.is_connected()):
    print('jai ho mata Rani')
else:
    print('unable to connect')

myc  = conn.cursor()
qyery= "insert into ineuronstudent (name , roll , age , city) values(%(name)s,%(roll)s,%(age)s,%(city)s)"
# dict Parameter query
data = [{'name':'ishita gupta' , 'roll': 24 , 'age':20 , 'city':'agra' },
{'name':'Nitin' , 'roll': 25 , 'age':24 , 'city':'aligarh' },
{'name':'Riya dixit' , 'roll': 29 , 'age':21 , 'city':'hathras' }]
try:
    myc.executemany(qyery, data)
    conn.commit()
    print(myc.rowcount, "row inserted")
except :
    # print(e)
    print('unable to insert data')
    conn.rollback()
myc.close()
conn.close()