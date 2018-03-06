program qhd;
var A: array [1..100,1..100] of longint;
B: array [0..100] of longint;
n,k,l,i:longint;
fi,fo:text;
function min(a,b:longint):longint;
begin
if (a>b) then exit(b) else exit(a);
end;
function minCost(i,j:longint):longint;
var t:longint;
begin   minCost:=0;
        if (j=0) or (i=0) then exit(99999999)
        else
        if j=1 then


                minCost:=minCost+B[i]


        else exit(min(minCost(i-1,j),minCost(i,j-1))+A[i,j]);

end;
begin
        assign(fi,'robot.inp');
        assign(fo,'robot.out');
        reset(fi);
        rewrite(fo);
        readln(fi,n);
        for i:=1 to n do begin

                for l:=1 to n do
                begin
                read(fi,A[l,i]);
                end;
                readln(fi);

        end;
        for i:=1 to n do
        begin
        B[i]:=B[i-1]+A[i,1];
        end;
        writeln(fo,minCost(n,n));
        close(fi);
        close(fo);
end.
