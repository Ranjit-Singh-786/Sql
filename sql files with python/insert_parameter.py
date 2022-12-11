from logging import exception
import mysql.connector as mc
import warnings
warnings.filterwarnings('ignore')
import seaborn as sns
df = sns.load_dataset('iris') 
df = df.drop_duplicates()
df['sepal_width'] = df['sepal_width'].astype(int)
print(df.duplicated().sum())
conn=mc.connect(host ='localhost' , user = 'root' , password = 'Jigar@975919', database='ineuron')
if(conn.is_connected()):
    print('jai ho mata Rani')
else:
    print('unable to connect')

myc  = conn.cursor()
query= "insert into iris (idd , sepal_len , sepal_width , petal_len,petal_width,species) values(%s,%s,%s,%s,%s,%s)"
values = []
for i in range(df.shape[0]):
    values.append((i,df['sepal_length'][i],df['sepal_width'][i],df['petal_length'][i],df['petal_width'][i],df['species'][i]))

print(data[0])
# myc.executemany(query,data)
# conn.commit()
# print(myc.rowcount, "row inserted")
try:
    myc.executemany(query,data)
    conn.commit()
    print(myc.rowcount, "row inserted")
except :
    # print(e)
    print('unable to insert data')
    conn.rollback()
myc.close()
conn.close()