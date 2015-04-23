#include<stdio.h>
#include<conio.h>
#define LLEL_ADDR 0x378
unsigned char str2num(char *s);
int main(int argc, char *argv[]) // eg: "port 45"
{
unsigned char a=0; //data to be written to port
if(argc!=2)
return 0;
a= (unsigned) str2num(argv[1]);
outportb(LLEL_ADDR,a);
return 1;
}
unsigned char str2num(char *s)
{
unsigned char num=0;
for(int i=0;s[i]!='\0';i++)
num= num*10 + s[i]-48;
return num;
}