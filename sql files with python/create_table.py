import mysql.connector as mc


config={'user':'root','password':'Jigar@975919','port':3306,'host':'localhost','database':'ineuron'}
try:
    conn=mc.connect(**config)
    if(conn.is_connected()):
        print('connected')
except:
    print('unable to connect')
# connection has eastablished


query = 'CREATE table ineuronStudent(stuid INT not null  AUTO_INCREMENT PRIMARY KEY,name varchar(30),roll int,age int ,city varchar(30))'   # no need to specify semicolon
myc=conn.cursor()

try:
    myc.execute(query)
    conn.commit()
    print('your table has been created')
except:
    print('unable to create table')
    conn.rollback()
myc.close()
conn.close()
