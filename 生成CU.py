# -*- coding: utf-8 -*-
"""
Created on Fri Jan 17 15:24:28 2020

@author: Y
"""

import pandas as pd
data = pd.read_excel("CU.xlsx",converters={0:str,1:str,10:str,13:str,15:str,16:str})
 
print("wire R_type=~|Inst;")
for i in range(len(data)):
    Inst=str(data.loc[i][0])
    func=str(data.loc[i][1])
    instruction=data.loc[i][3]

    if func == '-':
#        print(Inst)
        print("wire "+ "I_",instruction," = ",end="",sep="")
        for j in range(len(Inst)):
            if j!=5:
                if Inst[j] == "1":
                    print("Inst[",31-j,"] & ",end="",sep="")
                else:
                    print("~Inst[",31-j,"] & ",end="",sep="")
            else:
                if Inst[j] == "1":
                    print("Inst[",31-j,"]",end="",sep="")
                else:
                    print("~Inst[",31-j,"]",end="",sep="")
        print(';')
    else:
#        print(func)
        print("wire "+ "I_",instruction," = R_type",end="",sep="")
        for j in range(len(func)):
            if func[j] == "1":
                print(" & Func[",5-j,"]",end="",sep="")
            else:
                print(" & ~Func[",5-j,"]",end="",sep="")
        print(";")
print()

mark=0
print("assign RegDst = ",end="")
for i in range(len(data)):
    if data.loc[i][5]==1:
        if mark==0:
            mark=1
            print("I_",data.loc[i][3],sep="",end="")
        else:
            print(" | I_",data.loc[i][3],sep="",end="")
print(";")

mark=0
print("assign Se = ",end="")
for i in range(len(data)):
    if data.loc[i][6]==1:
        if mark==0:
            mark=1
            print("I_",data.loc[i][3],sep="",end="")
        else:
            print(" | I_",data.loc[i][3],sep="",end="")
print(";")

mark=0
print("assign RegWrite = ",end="")
for i in range(len(data)):
    if data.loc[i][7]==1:
        if mark==0:
            mark=1
            print("I_",data.loc[i][3],sep="",end="")
        else:
            print(" | I_",data.loc[i][3],sep="",end="")
print(";")

mark=0
print("assign ALUXSrc = ",end="")
for i in range(len(data)):
    if data.loc[i][8]==1:
        if mark==0:
            mark=1
            print("I_",data.loc[i][3],sep="",end="")
        else:
            print(" | I_",data.loc[i][3],sep="",end="")
print(";")

mark=0
print("assign ALUYSrc = ",end="")
for i in range(len(data)):
    if data.loc[i][9]==1:
        if mark==0:
            mark=1
            print("I_",data.loc[i][3],sep="",end="")
        else:
            print(" | I_",data.loc[i][3],sep="",end="")
print(";")

for j in range(3,-1,-1):
    print("assign ALUControl[",3-j,"] =",sep="",end="")
    mark=0
    for i in range(len(data)):
        ALUConstrol = str(data.loc[i][10])
        if ALUConstrol[j]=="1":
            if mark==0:
                mark=1    
                print("I_",data.loc[i][3],sep="",end="")
            else:
                print(" | I_",data.loc[i][3],sep="",end="")
    print(";")

mark=0
print("assign MemWrite = ",end="")
for i in range(len(data)):
    if data.loc[i][11]==1:
        if mark==0:
            mark=1
            print("I_",data.loc[i][3],sep="",end="")
        else:
            print(" | I_",data.loc[i][3],sep="",end="")
print(";")

for j in range(2,-1,-1):
    print("assign PCSrc[",2-j,"] = ",sep="",end="")
    mark=0
    for i in range(len(data)):
#        print(i)
        PCSrc = str(data.loc[i][13])
#        print(PCSrc)
#        print("haha")
        if PCSrc[j]=="1":
            if mark==0:
                print("I_",data.loc[i][3],sep="",end="")
                mark=1
            else:
                print(" | I_",data.loc[i][3],sep="",end="")
    if j == 2:
        print(" | (I_beq & c_adventure) | (I_bne & ~c_adventure)",end="")
    print(";")

mark=0
print("assign MemtoReg = ",end="")
for i in range(len(data)):
    if data.loc[i][14]==1:
        if mark==0:
            mark=1
            print("I_",data.loc[i][3],sep="",end="")
        else:
            print(" | I_",data.loc[i][3],sep="",end="")
print(";")

for j in range(1,-1,-1):
    print("assign load_option[",1-j,"] = ",sep="",end="")
    mark=0
    for i in range(len(data)):
#        print(i)
        load_option = str(data.loc[i][15])
#        print(PCSrc)
#        print("haha")
        if load_option[j]=="1":
            if mark==0:
                print("I_",data.loc[i][3],sep="",end="")
                mark=1
            else:
                print(" | I_",data.loc[i][3],sep="",end="")
    print(";")
    
for j in range(1,-1,-1):
    print("assign save_option[",1-j,"] = ",sep="",end="")
    mark=0
    for i in range(len(data)):
#        print(i)
        save_option = str(data.loc[i][16])
#        print(PCSrc)
#        print("haha")
        if save_option[j]=="1":
            if mark==0:
                print("I_",data.loc[i][3],sep="",end="")
                mark=1
            else:
                print(" | I_",data.loc[i][3],sep="",end="")
    print(";")
    
mark=0
print("assign usigned = ",end="")
for i in range(len(data)):
    if data.loc[i][17]==1:
        if mark==0:
            mark=1
            print("I_",data.loc[i][3],sep="",end="")
        else:
            print(" | I_",data.loc[i][3],sep="",end="")
print(";")