program izv;
const naprx : array[1..8] of integer = (1,2,2,1,-1,-2,-2,-1);
      napry : array[1..8] of integer = (2,1,-1,-2,-2,-1,1,2);
      don = 64;
      
var f:array[-1..10,-1..10] of integer;
    way:array[1..64,1..2] of integer;
    pov:array[1..64] of integer;
    mas:array[1..64] of set of 1..8;
    x,y,n:integer;
    

  function numways(x,y,num:integer):integer;
  var xx,xxx,yy,yyy:integer;
      ret:integer = 0;
  begin
    xx:=x+naprx[num];
    yy:=y+napry[num];
    if(f[xx,yy] = 0)then
    begin
      for var i:= 1 to 8 do
      begin
        xxx:=xx+naprx[i];
        yyy:=yy+napry[i];
        if(f[xxx,yyy] = 0)then ret+=1;
      end;
      numways:=ret;
    end
    else numways:=9;
  end;

begin 
  for var i:= -1 to 10 do
  begin
    for var j:= -1 to 10 do
    begin
      f[j,i]:=-1;
    end;
  end;
  
  for var i:= 1 to 8 do
  begin
    for var j:= 1 to 8 do
    begin
      f[j,i]:=0;
    end;
  end;
  
  readln(x,y);
  way[1,1]:=x;
  way[1,2]:=y;
  n:=1;
  f[x,y]:=1;
  var bool:boolean = true;
  
  while(n < don)or(bool)do
  begin
      writeln('n = ',n);
      x:=way[n,1];
      y:=way[n,2];
      if(pov[n] = 0)then mas[n] := [];
        var min:integer = 10;
        var place:integer;
        for var i:= 1 to 8 do
        begin
          var lol:=numways(x,y,i);
          if( min > lol)and(not(i in mas[n]))then
          begin
            min:=lol;
            place:=i;
          end;
        end;
      pov[n]+=1;
      include(mas[n],place);
      if(pov[n] < 9) then
      begin
        var xn:integer = x+naprx[place];
        var yn:integer = y+napry[place];
        if(f[xn,yn] = 0)then
        begin
          way[n+1,1]:=xn;
          way[n+1,2]:=yn;
          f[xn,yn]:=n+1;
          n+=1;
        end;
        
      end else
      begin
        pov[n]:=0;
        mas[n]:=[];
        f[x,y]:=0;
        n-=1;
      end;
  
  if (n = don)then
    begin
      var dx := abs(way[n,1]-way[1,1]);
      var dy := abs(way[n,2]-way[1,2]);
      if((dx = 1) and (dy = 2))or((dx = 2) and (dy = 1))then begin bool := false; end;
    end;
  
  end;
  for var i:= 1 to 8 do
  begin
    for var j:= 1 to 8 do
    begin
      write(f[j,i]:3);
    end;
    writeln;
  end;
end.