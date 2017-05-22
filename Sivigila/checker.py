#!/usr/bin/env python
# -*- coding: utf-8 -*-

"""
para cada archivo determinar casos por semana
comparar con las fechas correctas para determinar casos atipicos
"""

import calendar
import datetime
from datetime import timedelta

aday = timedelta(days=1)
calendar.setfirstweekday(calendar.SUNDAY)

def epiyear(year):
    weeks=[]
    weeks.append([])
    theday = datetime.date(year,1,1)
    if(theday.weekday<=1):thisweek=1
    else: thisweek = 0
    while(theday<=datetime.date(year,12,31)):
        if(theday.weekday()>5):
            thisweek+=1
            weeks.append([])
        weeks[thisweek].append(theday.day)
        theday += aday
    return weeks

for z in range(2000,2015):
    data = {z:epiyear(z)}
    print data
    print len(data[z])
