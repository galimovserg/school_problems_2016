program P6;

const
  InFile = 'input.txt';
  OutFile = 'output.txt';
  AMax = 10000000;
var
  F: Text;
  N, M, I, D, MinD: Integer;
  A: array of Integer;

procedure QuickSort(const Low, High: Integer);
var
  I, J, M, Temp: Integer;
begin
  I := Low;
  J := High;
  M := A[(I + J) div 2];
  repeat
    while A[I] < M do
      Inc(I);
    while M < A[J] do
      Dec(J);
    if I <= J then
    begin
      Temp := A[I];
      A[I] := A[J];
      A[J] := Temp;
      Inc(I);
      Dec(J);
    end;
  until I > J;
  if I < High then
    QuickSort(I, High);
  if Low < J then
    QuickSort(Low, J);
end;

begin
  Assign(F, InFile);
  Reset(F);
  Readln(F, N);
  Readln(F, M);
  SetLength(A, N * M);
  for I := 0 to High(A) do
    Read(F, A[I]);
  Close(F);
  QuickSort(0, High(A));
  MinD := A[1] - A[0];
  for I := 1 to High(A) - 1 do
  begin
    D := A[I + 1] - A[I];
    if D < MinD then
      MinD := D;
    if MinD = 1 then
      Break;
  end;
  Assign(F, OutFile);
  Rewrite(F);
  for I := 0 to High(A) - 1 do
    if A[I + 1] - A[I] = MinD then
      Writeln(F, A[I], '  ', A[I + 1]);
  Close(F);
end.

