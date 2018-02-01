program nhanso;
uses crt;
var
so1,so2,tich,tich1: ansistring;
i,k,l: longint;
fi,fo: text;
function cong(so1,so2:ansistring):ansistring;
var du,tong,long,i,cs2,cs1:longint;
code:integer;
temp,dust: ansistring;
begin
if not (length(so1)>length(so2)) then begin
temp:=so1;
so1:=so2;
so2:=temp;
end;
du:=0;
for i:=length(so2) downto 1 do
begin
VAL(so1[i+length(so1)-length(so2)],cs1,code);
VAL(so2[i],cs2,code);
tong:=cs1+cs2+du;
du:=tong div 10;
tong:=tong mod 10;
STR(tong,temp);
cong:=temp + cong;
end;
if length(so2)=length(so1) then begin
STR(du,temp);
if du <> 0 then
cong:=temp+cong;
end
else begin 
temp:=copy(so1,1,length(so1)-length(so2));
STR(du,dust);
temp:=cong(temp,dust);
{VAL(temp,tong,code);
tong:=tong+du;
STR(tong,temp);}
cong:=temp + cong;
end;
end;
function nhan(so1:ansistring;so2:ansistring):ansistring;
var i,du,so,cs,tich,long: longint;
code: integer;
temp: ansistring;
begin
  du:=0;
  VAL(so1[1],cs,code);
  long:=length(so2);
  for i:=length(so2) downto 1 do
  begin
    VAL(so2[i],so,code);
    tich:= so*cs + du;
    du:=tich div 10;
    if not (i=1) then
    tich:=tich mod 10;
    STR(tich,temp);
    nhan:=temp+nhan;
  end;
end;
begin
assign(fi,'input1.inp');
reset(fi);
assign(fo,'output1.out');
rewrite(fo);
readln(so1);
readln(so2);
tich:='0';
  for i:=length(so2) downto 1 do
  begin
  tich1:=nhan(so2[i],so1);
  for k:=1 to l do begin
  tich1:=tich1+'0';
  end;
  l:=l+1;
  tich:=cong(tich,tich1);
  end;
  writeln(cong(so1,so2));
  close(fi);
  close(fo);
  readln();
end.
