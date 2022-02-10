uses system.IO;
var files := Directory.GetFiles('D:\server', '*',SearchOption.AllDirectories);
begin

for var i:=0 to files.Length-1 do
writeln(ExtractFileName(files[i]));
end.