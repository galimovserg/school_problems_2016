uses system.IO;
{$omp parallel}
var files := Directory.GetDirectories('d:\\Delphi7', '*');
   files2:=Directory.GetFiles('d:\\','*');
begin
writeln('folders:');

  
for var i:=0 to files.Length-1 do
writeln(ExtractFileName(files[i]));

writeln('files:');
for var i:=0 to files2.Length-1 do
writeln(ExtractFileName(files2[i]));

end.