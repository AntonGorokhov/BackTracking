program FERz;

uses graphABC;

    const SIZE = 499;
    
  
var mas:array[1..100] of integer;
    places:array[1..100] of integer;
    m:array[1..100] of set of 1..100;
    var n:integer;
    min:integer;
    u:integer;
    place:integer;
    
    var scale:integer;
    
  function f(a:integer):boolean;
    var x,xx,y,yy:integer;
  begin
    x:=a;
    y:=places[a];
    f:=true;
    for var i:= 1 to a-1 do
    begin
      xx:=i;
      yy:=places[i];
      if(yy = y)or(y-x = yy-xx)or(yy-y = x-xx)then begin f:=false; break; end;
    end;
  end;
  
  function forwardd(num:integer):integer;//for num+1//
    var p:integer = 0;
  begin
  if(f(num))then
  begin
    if(num < n)then
    begin
        for var i:= 1 to n do
        begin
          places[num+1]:=i;
          if(f(num+1))then p+=1;
        end;
        places[num+1]:=0;
        if(p = 0)then forwardd:=n+100 else forwardd:=p;
    end else forwardd:=0;
  end else forwardd:=n+100;
  end;

Procedure Draw;
Begin
  For Var i:= 0 to n  Do
  Begin
    Line(0,i*scale,n*scale,i*scale);
    Line(i*scale,0,i*scale,n*scale);
  End;
  For Var i:= 1 to n Do
  Begin
    Circle(places[i]*Scale-Scale div 2,i*Scale-Scale div 2,Scale Div 2);
  End;
End;

begin
  
  setbrushcolor(clRed);
  window.Width:=SIZE;
  window.Height:=SIZE;
  readln(n);
  scale:= SIZE div n;
  
  
  var num:integer = 1;
  
  while(num <= n)and(num > 0) do
  begin
  
  {for var i:= 1 to n do
  write(places[i],' ');
  writeln;
  writeln;}
  
    if(mas[num]+1 > n)then
    begin
      mas[num] := 0;
      places[num]:= 0;
      m[num] := [];
      num-=1;
    end
    else
    begin
      min:=n+1000;
        for var i:= 1 to n do
        begin
          if not(i in m[num])then
          begin
            places[num]:=i;
            u:=forwardd(num);
            if(min > u)then begin min:=u; place:=i; end;
          end;
        end;
      mas[num]+=1;
      places[num]:=place;
      include(m[num],place);
      if(f(num))then
      begin
        num+=1;
      end;
    end;
    
  end;
  
  if(num = 0)then write('NO SOLUTION!')else
  draw;
  //for var i:= 1 to n do
  //write(places[i],' ');
  {n := 4;
  places[1]:=1;
  places[2]:=1;
  
  writeln(forwardd(2));}

end.