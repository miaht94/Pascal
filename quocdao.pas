program quocdao;
type B=array [1..100000,1..2] of longint;
E= array [1..100000] of boolean;
var A: array [1..100000,1..2] of longint;
C: array [1..100000] of longint;
D: array [1..100000] of boolean;
i,k,l,n,m,t:longint;
fi,fo:text;
boo:boolean;
procedure confirm(tp:longint;var D:E);
var i,k,l:longint;
begin
D[tp]:=true;
for i:=C[tp] to C[tp+1]-1 do begin
if not D[A[i,2]] then begin
    D[A[i,2]]:=true;
    confirm(A[i,2],D);
    end;
end;
end;
procedure qsort(var A:B;dau,cuoi:longint);
var l,r:longint;
x,temp:int64;
begin

        r:=cuoi;
        l:=dau;
        x:=A[((r+l) div 2),1];
        repeat
        while A[l,1]<x do inc(l);
        while A[r,1]>x do dec(r);
        if not (l>r) then
        begin
                temp:=A[l,1];
                A[l,1]:=A[r,1];
                A[r,1]:=temp;
                temp:=A[l,2];
                A[l,2]:=A[r,2];
                A[r,2]:=temp;
                inc(l);
                dec(r);
        end;
        until l>r;
        if l<cuoi then qsort(A,l,cuoi);
        if r>dau then qsort(A,dau,r);

end;
begin
assign(fi,'quocdao.inp');
assign(fo,'quocdao.out');
reset(fi);
rewrite(fo);

          read(fi,n);
          readln(fi,m);
          l:=0;
          for i:=1 to m do begin
          inc(l);
          read(fi,A[l,1]);
          readln(fi,A[l,2]);
          inc(l);
          A[l,1]:=A[l-1,2];
          A[l,2]:=A[l-1,1];
          end;
          qsort(A,1,l);
          t:=1;
          for i:=1 to l do begin
              if A[i,1]=t then begin
              C[t]:=i;
              inc(t);
              end;
          end;
          C[t]:=l+1;
          Confirm(1,D);
          boo:=true;
          for i:=1 to n do
          if D[i]=false then begin boo:=false; break;end;
          if boo then writeln(fo,'YES') else writeln(fo,'NO');


close(fi);
close(fo);

end.
