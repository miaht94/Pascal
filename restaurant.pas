Program Restaurant;
type B= array [1..50000] of longint;
Var  A,TN,C,E: array [1..50000] of longint;
fi,fo:text;
i,k,l,d,n:longint;
procedure DanhDau(A:B;var C,E:B);
var i,t:longint;
begin
 for i:=1 to n do begin
 t:=i;
     while (A[t]>=A[i]-2*d) and (t>1) do
     begin
         dec(t);
     end;
     if t=1 then
     C[i]:=t else C[i]:=t+1;
     t:=i;
     while (A[t]>A[i]-d) and (t>1) do
     begin
         dec(t);
     end;
     E[i]:=t;
 end;
end;
function timMax(dau,cuoi:longint):longint;
var max,i,vt:longint;
begin
max:=0;
    for i:=dau to cuoi do begin
        if TN[i]>max then begin max:=TN[i];
        vt:=i;
        end;
    end;
    exit(vt);
end;

Begin

     Assign(fi,'Restaurant.Inp');
     Assign(fo,'Restaurant.Out');
     reset(fi);
     rewrite(fo);

            read(fi,n);
            read(fi,d);
          for i:=1 to n do begin
              read(fi,A[i]);
              readln(fi,TN[i]);
          end;
          DanhDau(A,C,E);

     close(fi);
     close(fo);

End.
