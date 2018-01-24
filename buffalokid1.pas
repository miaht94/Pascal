program buffalokid1;
var A,B: array [1..200,1..200] of integer;
    n,i,k,p,temp,cot,dong,l: integer;
    fi,fo: text;
begin
        Assign(fi,'input.txt') ;
        Assign(fo,'output.txt');
        reset(fi);
        rewrite(fo);
        readln(fi,n);
        i:=0;
        while not eof(fi) do
         begin
         inc(k); {k la so dong}
         {i la so cot}
                while not eoln(fi) do
                begin
                inc(i);
                read(fi,A[i,k]);
                end;
         readln(fi);
         end;
         for p:=1 to n do
         while (dong <=k) do
         begin
                inc(dong);
                while (cot <=i) do
                begin
                inc(cot);
                if (A[cot,dong]=p) then begin
                inc(temp);
                B[p,temp]:=dong;
                end;
                end;
         end;
         p:=1;
         for  l:=1 to n do begin
         while (B[l,p]<>0) do begin

         write(fo,B[l,p],' ');
         inc(p);
         if B[l,p+1]=0 then writeln(fo);
         end;
         end;

close(fi);
close(fo);
readln();
end.
