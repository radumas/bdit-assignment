#!/usr/bin/python3
'''Copying the csv datafiles to my PostgreSQL database'''
import os
from psycopg2 import connect


con = connect(database='rad',host='localhost',user='python',password='py')
cursor = con.cursor()

for filename in os.listdir():
    if filename.endswith('.csv'):
        datafile = open(filename)
        print("Copying data from: ", datafile.name)
        cursor.copy_expert("COPY stage_table FROM STDIN WITH CSV HEADER",datafile)
        cursor.execute("INSERT INTO to_data (rx_time, startpoint, startpointname, endpoint, endpointname, "
            "minmeasuredtime, maxmeasuredtime, avgmeasuredtime, medianmeasuredtime, "
            "samplecount, accuracylevel, confidencelevel)"
            "SELECT to_timestamp(rx_time,'MM/DD/YY HH24:MI'), startpoint, startpointname, endpoint, endpointname, "
            "minmeasuredtime, maxmeasuredtime, avgmeasuredtime, medianmeasuredtime, "
            "samplecount, accuracylevel, confidencelevel "
            "FROM public.stage_table;")
        cursor.execute("TRUNCATE public.stage_table;")
        con.commit()
        datafile.close()