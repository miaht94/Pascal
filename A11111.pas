program A111;
var so1:int64;
k:longint;
fi: text;

function sohoanhao(so:int64):boolean;
var can:integer;
tong:real;
i: longint;
{function cp(so:int64): boolean;
begin
if (sqrt(so)=TRUNC(sqrt(so))) then cp:=true
else
cp:=false;
end;}
begin
can:=trunc(sqrt(so));
for i:=2 to can do begin
if (so mod i =0) then tong:=tong+i+ (so div i);
end;
if not (trunc(sqrt(so))=sqrt(so)) then tong:=tong + 1
else tong:=tong-sqrt(so) +1;
if (tong-so=0) then sohoanhao:=true
else sohoanhao:=false;
end;
begin
assign(fi,'shh.inp');
rewrite(fi);
for k:=2 to 1000000 do
if (sohoanhao(k)=true) then writeln(fi,k);

writeln(fi,'bach');
    close(fi);
end.
