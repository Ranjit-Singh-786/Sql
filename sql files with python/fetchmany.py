# ............simple retrieve data from the sql database by using fetchmany python............

from cgi import print_arguments
from logging import exception
import mysql.connector as mc 
conn=mc.connect(host ='localhost' , user = 'root' , password = 'Jigar@975919', database='ineuron')
if(conn.is_connected()):
    print('jai ho mata Rani')
else:
    print('unable to connect')
query = "select * from ineuronstudent"
myc = conn.cursor()

# it will return 8 record but with error
# because cursor object has more than 8 record.

try:
    myc.execute(query)
    row = myc.fetchmany(size = 8)   # first 8 record
    # it will return [(),()]
    for item in row:
        print(item,'\n')
except:
    print('unable to fetch')

# it will return without error 

try:
    myc.execute(query)
    row = myc.fetchmany(size = 8)   # first 8 record
    for i in row:
        print(i,'\n')
        print()
    remaing = myc.fetchall()
    for rem in remaing:
        print(rem,'\n')
except:
    print('unable to fetch')



myc.close()
conn.close()