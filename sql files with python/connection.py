import mysql.connector as mc 
### first method connection
# try:
# config={'user':'root','password':'Jigar@975919','host':'localhost','port':3306}
conn=mc.connect(host ='localhost' , user = 'root' , password = 'Jigar@975919')
if(conn.is_connected()):
    print('jai ho mata Rani')
else:
    print('unable to connect')


cur = conn.cursor()
query = "create database ineuron;"
cur.execute(query)
# except:
#     print('unable to connect')


# second method of connection create

# config={'user':'root','password':'Jan123','host':'localhost','port':3306}
# try:
#     conn=mc.connect(**config)
#     if(conn.is_connected()):
#         print('jai ho mata rani')
# except:
#     print('unable to connect @')



# #    third way create connection
# conn=mc.connect(user='root',password='Jan123')    # host and port by defaul True
# if conn.is_connected():
#     print('welcome !!')