program nhahang;
var i,k,l,max1,n,t,d,max2,dem:longint;
Max,A,FR,B,TN,C: array [1..100000] of longint;
DiaChi: array [1..100000] of ansistring;
fi,fo:text;
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
procedure MaxPotential(vt:longint);
var i,k,l,oldmax:longint;
kst:string;
boo:boolean;
begin
boo:=true;
i:=vt;
       B[i]:=TN[i];
       k:=i;
       C[i]:=1;
       Str(k,kst);
       DiaChi[i]:=DiaChi[i]+kst;
       while boo do begin
       oldmax:=k;
       k:=FR[FR[k]+1];
       if Max[k]<>oldmax then begin
       inc(C[i]);
       B[i]:=B[i]+TN[Max[k]];
       Str(k,kst);
       DiaChi[i]:= DiaChi[i]+ '-->'+kst;
       k:=Max[k];

       end else boo:=false;
       end;
end;

begin
    assign(fi,'nhahang.inp');
    assign(fo,'nhahang.out');
    reset(fi);
    rewrite(fo);
    read(fi,n);
    read(fi,d);
          for i:=1 to n do begin
              read(fi,A[i]);
              readln(fi,TN[i]);
          end;
          t:=1;
    {Tao mang danh dau o o vt thu i cach o trong mang 1 khoang d}
          for i:=1 to n do begin
              while (A[t]<=A[i]+d) and (t<n) do
              inc(t);
              dec(t);
              FR[i]:=t;
          end;
          {Tao mang max theo thu tu cach nhau 1 khoang d}
          for i:=1 to n do begin
              Max[i]:=timMax(i,FR[i]);
          end;
          for i:=1 to FR[1] do begin
              {}
              MaxPotential(i);

          end;
          for i:=1 to FR[1] do begin
          if B[i]>max2 then begin max2:=B[i];dem:=C[i] end;
          end;
          writeln(fo,max2,' ',dem);
          writeln(fo,DiaChi[i]);
    close(fi);
    close(fo);
end.
