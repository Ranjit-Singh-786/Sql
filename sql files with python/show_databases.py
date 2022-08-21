import mysql.connector as mc
try:
    conn=mc.connect(user='root',password='Jan123',host='localhost',port=3306)
    if(conn.is_connected()):
        print('connected')
except:
    print('unable to connect')
myc=conn.cursor()
sql='show databases'
try:
    myc.execute(sql)
    for i in myc:
        print(i)
except:
    print('unable to execute')
print()

sql1='drop database pdb'
myc.execute(sql1)
print('after  the deletion')

# ,,,,,,,,,,,,,,,second statement,,,,,,,,,

sql='show databases'
try:
    myc.execute(sql)
    for i in myc:
        print(i)
except:
    print('unable to execute')
print()



myc.close()
conn.close()