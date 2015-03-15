program quick;

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

procedure QuickSort(var a: massiv; n: integer);
  procedure sort(L, R: integer);
  var
    i, j: integer;
    w, x: integer;
  begin
    i := L;
    j := R;
    x := a[(L + R) div 2];
    repeat
      while a[i] < x do
        i := i + 1;
      while x < a[j] do
        j := j - 1;
      if i <= j then
      begin
        w := a[i];
        a[i] := a[j];
        a[j] := w;
        i := i + 1;
        j := j - 1;
      end;
    until i > j;
    if L < j then
      sort(L, j);
    if i < R then
      sort(i, R);
  end;

begin
  sort(1, n);
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
      QuickSort(b, n);
      T := Now - T;
      DecodeTime(T, myHour, myMin, mySec, myMilli);
      TSum := myMilli / 1000 + mySec + myMin * 60 + myHour * 3600;
      WriteToFile(b, n, outputname, 'Быстрая', TSum);
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
      QuickSort(b, n);
      T := Now - T;
      DecodeTime(T, myHour, myMin, mySec, myMilli);
      TSum := myMilli / 1000 + mySec + myMin * 60 + myHour * 3600;
      WriteToFile(b, n, outputname, 'Быстрая', TSum);
      writeln('rabota prog zakonchena.sozdan file:', outputname);
      end;
    end
    else
      writeln('takogo file ne suchest.zapustite eche raz i vpishite pravilno');
    readln;
  end;

END.
