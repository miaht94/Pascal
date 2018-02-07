program ptfibo;
type B=array [1..200] of int64;
D=array[1..2000] of Boolean;
var A,F:array [1..200] of int64;
C: array [1..2000] of Boolean;
so:Int64;
t,i:longint;
procedure reset1(var C:D;A:B);
var i:longint;
begin
for i:=1 to 200 do begin
C[i]:=true;
A[i]:=0;
end;
end;
function checker(so:int64;F:B):integer;
var i:longint;
begin
i:=1;
checker:=0;
while F[i]<>0 do begin
if F[i]=so then begin checker:=i; break;
end;
i:=i+1;
end;
end;
procedure ptich(so:int64;var A:B;F:B;i:longint;C:D;t:longint);
var fib: int64;
k,l,ff: longint;
begin
fib:=so;
k:=i;
while (k>=1) do begin 
{ptich den khi fib F[k]=1, check mang A ko o gi => o ptich dc}
ff:=t+1; 
{dat f la bien tam dem so so hang fib ptich dc}
if checker(fib,F)=0 then begin
  fib:=fib-F[k];{k la so fib lon nhat nho hon so dang can ptich}
  A[ff]:=F[k]; end;
  if (checker(fib,F)=0) or (C[checker(fib,F)]=false) then 
  begin 
    l:=1;
    while F[l+1]<=fib do inc(l);
    {tim chi so cua so fibo lon nhat nho hon so dang xet (l)}
    ptich(so,A,F,l,C,ff);
  end
  else begin
  C[checker(fib,F)]:=False;
  inc(ff);
  A[ff]:=fib;
  Break;
  end;
  dec(k);
  ff:=t;
  if (ff=0) then reset1(C,A);
  end;
end;
begin
writeln('nhap vao so: ');
readln(so);
  F[1]:=1;
  F[2]:=2;
  i:=2;
  while F[i]+F[i-1]<=so do
  begin
  inc(i);
  F[i]:=F[i-1] +F[i-2];
  end;
  for t:=1 to i do C[t]:=true;
  t:=0;
  ptich(so,A,F,i,C,t);
  i:=1;
  while A[i]<>0 do
  writeln(A[i]);
  readln;
end.
