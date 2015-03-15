program heap;

{$APPTYPE CONSOLE}

uses
  SysUtils;

type
  massiv = array [1 .. 99999999] of integer;

var
  inputname, outputname: string;
  a, b: massiv;
  i, n, p: integer;
  TSum: double;
  T: TDateTime;
  myHour, myMin, mySec, myMilli: word;

procedure WriteToFile(var a: massiv; n: integer; f: string; f1: string;
  time: double);
var
  i: integer;
  k: text;
begin
  assign(k, f);
  rewrite(k);
  writeln(k, n);

  for i := 1 to n do
    write(k, a[i], ' ');
  writeln(k);
  writeln(k, f1);
  write(k, floattostr(time));
  close(k);
end;

procedure ReadMassivFromFile(f: string; var a: massiv; var n: integer);
{ f-входное имя файла,А-выходной массив }
var
  i: integer;
  k: text;
begin

  assign(k, f);
  reset(k);
  readln(k, n);

  for i := 1 to n do
    read(k, a[i]);

  close(k);

end;

procedure HeapSort(var a: massiv; n: integer);
  procedure sift(L, R: integer);
  var
    i, j: integer;
    x: integer;
  begin
    i := L;
    j := 2 * i;
    x := a[i];
    if (j < R) and (a[j] < a[j + 1]) then
      j := j + 1;
    while (j <= R) and (x < a[j]) do
    begin
      a[i] := a[j];
      i := j;
      j := 2 * j;
      if (j < R) and (a[j] < a[j + 1]) then
        j := j + 1;
    end;
    a[i] := x;
  end;

var
  L, R: integer;
  x: integer;
begin
  L := (n div 2) + 1;
  R := n;
  while L > 1 do
  begin
    L := L - 1;
    sift(L, R);
  end;
  while R > 1 do
  begin
    x := a[1];
    a[1] := a[R];
    a[R] := x;
    R := R - 1;
    sift(L, R);
  end;
end;

BEGIN

  inputname := paramstr(1);
  outputname := paramstr(2);

  if paramcount > 0 then
  begin
    if FileExists(inputname) then
    begin
      ReadMassivFromFile(inputname, b, n);
      if n<=0 then Writeln('Неправильный массив')
      else
      begin
      T := Now;
      HeapSort(b, n);
      T := Now - T;
      DecodeTime(T, myHour, myMin, mySec, myMilli);
      TSum := myMilli / 1000 + mySec + myMin * 60 + myHour * 3600;
      WriteToFile(b, n, outputname, 'Пирамидальная', TSum);
      writeln('rabota prog zakonchena.sozdan file:', outputname);
      end;
    end
    else
      writeln('takogo file ne suchest.zapustite eche raz i vpishite pravilno');

  end
  else
  begin
    write('vvedite imya vxodnogo faila vida IMYA:');
    readln(inputname);
    if FileExists(inputname) then
    begin
      ReadMassivFromFile(inputname, b, n);
      if n<=0 then Writeln('Неправильный массив')
      else
      begin
      write('vvedite imya vihodnogo faila vida IMYA:');
      readln(outputname);
      T := Now;
      HeapSort(b, n);
      T := Now - T;
      DecodeTime(T, myHour, myMin, mySec, myMilli);
      TSum := myMilli / 1000 + mySec + myMin * 60 + myHour * 3600;
      WriteToFile(b, n, outputname, 'Пирамидальная', TSum);
      writeln('rabota prog zakonchena.sozdan file:', outputname);
      end;
    end
    else
      writeln('takogo file ne suchest.zapustite eche raz i vpishite pravilno');

    readln;
  end;

END.
