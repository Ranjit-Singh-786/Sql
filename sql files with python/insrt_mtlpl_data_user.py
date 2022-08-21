import mysql.connector as mc 
conn=mc.connect(host ='localhost' , user = 'root' , password = 'Jigar@975919', database='ineuron')
if(conn.is_connected()):
    print('jai ho mata Rani')
else:
    print('unable to connect')
while True:
    query = "INSERT INTO ineuronstudent (name, roll , age , city) values(%(name)s , %(roll)s ,%(age)s ,  %(city)s)"
    name =input('enter the name of student :-  ')
    roll =int(input('enter the roll of student :-  '))
    age =int(input('enter the age of student :-  '))
    city =input('enter the city of student :-  ')
    permission =input('do you want to exit it press Y / N :- ')
    param = {'name':name,'roll':roll,'age':age,'city':city}
    try:
        myc = conn.cursor()
        myc.execute(query,param)
        conn.commit()
    except:
        print('unable to insert')
        conn.rollback()
    if permission == 'Y':
        break
    else:
        continue
myc.close()
conn.close()

