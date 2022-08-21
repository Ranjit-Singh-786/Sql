# ....Update data by using prepared statement..........

from multiprocessing.spawn import prepare
import mysql.connector as mc 
conn=mc.connect(host ='localhost' , user = 'root' , password = 'Jigar@975919', database='ineuron')
if(conn.is_connected()):
    print('jai ho mata Rani')
else:
    print('unable to connect')
query = "UPDATE ineuronstudent SET name = %s , age = %s WHERE stuid = %s"
param = ('Usman',26,3)
pmyc = conn.cursor(prepared = True) 
try:
    pmyc.execute(query,param)
    conn.commit()
except:
    print('unable to update')
pmyc.close()
conn.close()