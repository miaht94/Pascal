program xe;
type B= array [1..200,1..200] of longint;
C=array [1..200] of integer;
var X: array [1..200,1..200] of longint;
D: array [1..200] of integer;
tong,l,k,p,temp: longint;
{A[hang,cot]}
procedure timtong(X:B;cot,hang:integer;D:C;tong:longint;var temp:longint);
var i:longint;
begin
D[hang]:=1;
tong:=tong + X[hang,cot];
cot:=cot+1;
if cot <= 3 then  begin
for i:=1 to 3 do begin
      if  D[i]<> 1 then timtong(X,cot,i,D,tong,temp)
end;
end
else if tong>=temp then begin temp:=tong; tong:=0;
end;
end;
begin
randomize;
for l:=1 to 3 do  begin
for k:=1 to 3 do begin
X[l,k]:=random(10);
write(X[l,k],' '
);
end;
writeln();
end;
temp:=0;
tong:=0;
for p:=1 to 3 do
timtong(X,1,p,D,tong,temp);
writeln(temp);
readln()
end.
