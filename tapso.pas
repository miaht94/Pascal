program Tapso;

uses crt;
type B= array [1..2000000] of longint;
var A: array [1..2000000] of longint;
n:longint;
fi,fo:text;
i,k,l,t:longint;
procedure qsort(var A:B;dau,cuoi:longint);
    var x,l,r,temp:longint;

    begin
        l:=dau;
        r:=cuoi;
        x:=A[(dau+cuoi) div 2];
        repeat
        while A[l]<x do inc(l);
        while A[r]>x do dec(r);
        if not (l>r) then
        begin
                temp:=A[l];
                A[l]:=A[r];
                A[r]:=temp;

                inc(l);
                dec(r);

        end;
        until l>r;
        if l<cuoi then qsort(A,l,cuoi);
        if r>dau then qsort(A,dau,r);
    end;
BEGIN
assign(fi,'tapso.inp');
assign(fo,'tapso.out');
reset(fi);
rewrite(fo);
read(fi,n);
i:=1;
A[1]:=i;
l:=1;k:=1;
          while (i<n) do begin

              for t:=l to k do begin
              inc(i);
              A[i]:=2*A[t]+1;
              inc(i);
              A[i]:=3*A[t]+1
              end;
              l:=k+1;
              k:=i;
          end;
          qsort(A,1,i);
          writeln(fo,A[n]);
close(fi);
close(fo);
END.

