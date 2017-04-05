#!/usr/bin/env python
# -*- coding: utf-8 -*-

import calendar
import datetime
from datetime import timedelta
aday = timedelta(days=1)
calendar.setfirstweekday(calendar.SUNDAY)

def epiyear(year):
    weeks=[]
    theday = datetime.date(year,1,1)
    #print(theday)
    weeks.append([])
    if(theday.weekday<=1):thisweek=1
    else: thisweek = 0
    while(theday<=datetime.date(year,12,31)):#datetime.date(year,1,10).days):
        if(theday.weekday()>5):
            while(len(weeks[thisweek])<7):weeks[thisweek].insert(0," ")
            thisweek+=1
            weeks.append([])
        weeks[thisweek].append(theday.day)
        theday += aday
    while(len(weeks[-1])<7):weeks[-1].append(" ")
    return weeks

def helpnum(i):
    if(i<10):return "01"
    return str(i)

def printWeeks(file,weeks):
    x = [i.rjust(4) for i in ("DLMWJVS")]
    days = ""
    for w in x: days+=w
    file.write(days+"\n")
    for i in range(0,len(weeks)):
        w = ""
        for j in weeks[i]:
            w += repr(j).rjust(4)

        file.write((w + ", S{}\n").format(i))

for z in range(2015,2016):
    a = open(str(z)+".test",'w')
    printWeeks(a,epiyear(z))
