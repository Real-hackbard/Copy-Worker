program CopyWorker;

uses
  Forms,
  Unit1 in 'Unit1.pas' {Form1},
  Masks in 'Masks.pas',
  UCopyFolder3 in 'UCopyFolder3.pas';

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
