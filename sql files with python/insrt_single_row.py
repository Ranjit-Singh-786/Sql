import mysql.connector as mc
config={'user':'root','password':'Jigar@975919','host':'localhost','port':3306,'database':'ineuron'}
try:
    conn=mc.connect(**config)
    if(conn.is_connected()):
        print('connected')
except:
    print('unable to connect')
sql='insert into ineuronstudent (name,roll,age,city) values("Ranjit Singh",68,25,"Hathras")'
myc=conn.cursor()
try:
    myc.execute(sql)
    conn.commit()
    print(myc.rowcount,'Row insearted')  # how many row inserted
except:
    conn.rollback()
    print('unable to insearted')
myc.close()
conn.close()
