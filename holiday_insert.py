#!/usr/bin/python3
'''Inserting Ontario holidays into the database in order to exclude them from "regular" days'''

from workalendar.canada import Ontario
from psycopg2 import connect

cal = Ontario()

con = connect(database='rad',host='localhost',user='python',password='py')
cursor = con.cursor()

cursor.executemany("INSERT INTO holidays (holidate, holiday) VALUES(%s, %s)", cal.holidays(2015))
con.commit()