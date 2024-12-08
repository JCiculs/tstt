#include <a_samp>
#pragma tabsize 0
forward hostname();
public OnFilterScriptInit()
{
SetTimer("hostname",5000,1);//Thay doi thoi gian random, 1000 = 1 giay
return 1;
}

public hostname()
{
   new var = random(4); //case bao nhieu la max thi ghi vao so lon hon so dó vd case 4 max, ghi vao (5)
   switch (var)
   {
     case 0: SendRconCommand("hostname LSG-Server Test");
     case 1: SendRconCommand("hostname Server Bao Ddos");
     case 2: SendRconCommand("hostname Khong Hut Mau");
     case 3: SendRconCommand("hostname SV Nhu Lone.");
  // neu muon them nhieu nua thi tao tiep 1 dong la case 5: edit random(5) thành random(6)
   }
}
