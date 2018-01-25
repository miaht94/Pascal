program ptnto;
uses crt;
var fi,fo:text;
x,y,z:longint;
function checker(soc:int64):Boolean;
var can,i1:longint;
begin
if (soc<>2) and (soc<>1) and (soc<>3)then begin
can:= trunc(sqrt(soc));
checker:=true;
for i1:=2 to can do
begin
if soc mod i1 =0 then begin checker:=false;
break;
end;
end;
end else checker:=true;
end;
procedure layuoc(so:int64);
var i,can,m,n: longint;
begin
can:= trunc(sqrt(so));
if checker(so)=true then writeln(so) else
begin
for i:=can downto 2 do
begin
if so mod i =0 then begin
if checker(i)=true then begin writeln(i);
layuoc(so div i);
break;
end else begin m:=i;n:=so div i; layuoc(m); layuoc(n); break; end;
end;
end;
end;
end;
begin
writeln('nhập số cần phân tích: ');
readln(x);
  layuoc(x);
  readln;
end.
