program tongchuso;
var so:ansistring;
temp:integer;
function congso(so1:string;so2:string):string;
var temp,temp1,temp2,temp3,i,k,l:longint;
tempst,xau1:ansistring;
sodu:integer;
xau,st,sodust:ansistring;
begin
k:=0 ;
temp3:=0;
if (length(so2)>length(so1)) then begin tempst:=so1;
so1:=so2;
so2:=tempst;
end;
i:=length(so1)-length(so2);
while (length(so1)-i>=1) do
begin
temp:=0;
VAL(so1[length(so1)-k],temp1);
VAL(so2[length(so1)-i],temp2);
k:=k+1;
temp:=temp1+temp2+temp3;
if (temp>10) then begin
temp:=temp-10;
STR(temp,xau);
congso:=congso+xau;
temp3:=1;
end
else begin
temp3:=0;
STR(temp,xau);
congso:=congso+xau;
end;
i:=i+1;
end;
if (length(so1)>length(so2)) then
begin
i:=length(so1)-length(so2);
st:=copy(so1,1,i);
VAL(st,sodu);
sodu:=sodu+temp;
STR(sodu,sodust);
congso:=congso+ sodust;
end
else if (length(so2)-length(so1)>0) then begin
i:=length(so2)-length(so1);
st:=copy(so2,1,i);
VAL(st,sodu);
sodu:=sodu+temp;
congso:=congso+ sodust;
end;
end;
begin
  writeln(congso('131','22'));
  readln();
  end.

