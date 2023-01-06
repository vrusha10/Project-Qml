#include "test.h"
#include<iostream>
int data=0,ddiv=1,dmul=1,dsub=0;
int l=0,m=0,s=0;
int flag=0;
int store2=0,store3=0,store4=0,store5=0;
Test::Test(QObject *parent):QObject(parent)
{

}

int Test::add(QString num)
{
    int store= num.toInt();
    data = data+store;

}

int Test::mul(QString num)
{
    int store= num.toInt();
    dmul = dmul*store;
}

int Test::divis(QString num)
{
    int store2=0,store3=0;
    if(l==0){
        store2=num.toInt();
         ddiv=store2;
         l=1;
    }
    else {
        store3=num.toInt();
        ddiv=ddiv/store3;
    }
}

int Test::sub(QString num)
{
    int store4=0,store5=0;
     if(s==0){
         store4=num.toInt();
         dsub=store4;
         s=1;
     }
     else {
         store5=num.toInt();
         dsub=dsub-store5;
     }
}

void Test::clear()
{
     data=0,ddiv=1,dmul=1,dsub=0;
     l=0,s=0;
     store2=0,store3=0,store4=0,store5=0;
}
