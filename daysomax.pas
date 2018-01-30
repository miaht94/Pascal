program hieusinhdaysomax;
var A,B:array [1..1000010] of int64;
x,y,z,t,n: longint;
tong,temp2,temp: int64;
fi,fo: text;
boo: Boolean;
begin
assign(fi,'submax.inp');
assign(fo,'outdaymax.out');
reset(fi);
rewrite(fo);
n:=50000;
for x:=1 to n do
        readln(fi,A[x]);
if A[1]>=0 then boo:=true
else boo:=false;
x:=0;
while x<=n do
begin
        inc(x);
        tong:=tong+A[x];
        if (A[x+1]>=0) and (boo=false) then
        begin
              inc(z);
              B[z]:=tong;
              tong:=0;
              boo:=true;
        end;
        if (A[x+1]<=0) and (boo=true) then
        begin
                inc(z);
                B[z]:=tong;
                tong:=0;
                boo:=false;
        end;
end;
x:=0;
temp:=B[1];
while (x<z) do
begin   inc(x);
        y:=x;
        temp2:=0;
        while y<z do
        begin
        temp2:=temp2 + B[y];
        if temp2 >= temp then temp:=temp2;
        inc(y);
        end;

end;
writeln(fo,temp);
close(fi);
close(fo);
end.

