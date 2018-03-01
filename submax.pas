program submax;
type C= array [0..1000000] of int64;
var fi,fo:text;
A,D,F: C;
B: array [1..1000000] of longint;
i,k,l,n,tong:longint;
max:int64;
procedure qsort(var A,D:C;dau,cuoi:longint);
var l,r:longint;
x,temp:int64;
begin

        r:=cuoi;
        l:=dau;
        x:=A[(r+l) div 2];
        repeat
        while A[l]<x do inc(l);
        while A[r]>x do dec(r);
        if not (l>r) then
        begin
                temp:=A[l];
                A[l]:=A[r];
                A[r]:=temp;
                temp:=D[l];
                D[l]:=D[r];
                D[r]:=temp;
                inc(l);
                dec(r);
        end;
        until l>r;
        if l<cuoi then qsort(A,D,l,cuoi);
        if r>dau then qsort(A,D,dau,r);

end;
begin
assign(fi,'submax.inp');
assign(fo,'submax.out');
reset(fi);
rewrite(fo);
readln(fi,n);
A[0]:=0;
for i:=1 to n do begin
        read(fi,B[i]);
        A[i]:=A[i-1]+B[i];
        D[i]:=i;
end;
max:=B[1];
F:=A;
qsort(F,D,0,n);
i:=-1;
{k:=0;
while i<n-1 do begin
inc(i);
l:=n+1;
if F[n]-A[i]<max then inc(i);
while (l>0) do begin
dec(l);
if D[l]>i then begin if max<F[l]-A[i] then max:=F[l]-A[i];k:=l; break; end;
end;
end;
}
{writeln(fo,((gettickcount-times)/1000):2:9); }

k:=0;
for i:=0 to n-1 do begin
for l:=n downto k do begin
if D[l]>D[i] then begin if max<F[l]-F[i] then max:=F[l]-F[i];k:=l; break; end;

end;
end;


writeln(fo,max);
close(fi);
close(fo);
writeln('complete');
readln()
end.
