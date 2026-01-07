unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.ComCtrls, Vcl.Shell.ShellCtrls, filectrl, masks, ShellAPI, UCopyFolder3,
  Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Samples.Spin, System.IOUtils, System.Types;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    CheckBox1: TCheckBox;
    ComboBox1: TComboBox;
    Label1: TLabel;
    Button4: TButton;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Memo2: TMemo;
    Memo1: TMemo;
    PageControl2: TPageControl;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
    RadioGroup1: TRadioGroup;
    RadioGroup2: TRadioGroup;
    RadioGroup3: TRadioGroup;
    CheckBox2: TCheckBox;
    Panel1: TPanel;
    Label2: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    RadioButton3: TRadioButton;
    RadioButton4: TRadioButton;
    RadioButton5: TRadioButton;
    RadioButton6: TRadioButton;
    Edit3: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    StatusBar1: TStatusBar;
    ProgressBar1: TProgressBar;
    Label7: TLabel;
    Button5: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Edit3Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure RadioButton1Click(Sender: TObject);
    procedure RadioButton2Click(Sender: TObject);
    procedure RadioButton3Click(Sender: TObject);
    procedure RadioButton4Click(Sender: TObject);
    procedure RadioButton5Click(Sender: TObject);
    procedure RadioButton6Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
  private
     { Private-Deklarationen }
     procedure LoadFolderContent(const Path: string);
  public
      { Public-Deklarationen }
    copy : string;
    copylength : integer;
    Inputdir, outputdir : string;
    function FileCopyExit(const inpath,outpath,infilename:string;
                var canclose:boolean):boolean;
  end;
var
  Form1: TForm1;

implementation

{$R *.DFM}
procedure TForm1.LoadFolderContent(const Path: string);
var
  Files: TStringDynArray;
  FileName: string;
begin
  Memo1.Lines.BeginUpdate; // Verhindert Flackern bei vielen Einträgen
  try
    Memo1.Lines.Clear;
    // Holt alle Dateinamen im Ordner
    Files := TDirectory.GetFiles(Path);
    for FileName in Files do
      Memo1.Lines.Add(ExtractFileName(FileName));
  finally
    Memo1.Lines.EndUpdate;
  end;
end;

procedure TForm1.Button1Click(Sender: TObject);
var
  i: Integer;
begin
  if SelectDirectory('Select directory', '', inputdir) then
  begin
    ProgressBar1.Position := 0;
    Edit1.Text := Inputdir;
    LoadFolderContent(InputDir);
    if (inputdir<>'') and (outputdir<>'') then Button3.enabled:=true;
    StatusBar1.Panels[1].Text := IntToStr(Memo1.Lines.Count) + ' files(s)';
    ProgressBar1.Max := Memo1.Lines.Count;
  end;
end;

procedure TForm1.Button2Click(Sender: TObject);
var
  opts:TSelectDirOpts;
begin
  if CheckBox1.checked then opts:=[sdAllowCreate, sdPerformCreate]
  else opts:=[];
  if SelectDirectory('Select directory', '', outputdir) then
  Edit2.Text := OutputDir;
  If (inputdir<>'') and (outputdir<>'') then Button3.enabled:=true;
end;

function TForm1.FileCopyExit(const inpath,outpath,infilename:string;
                     var canclose:boolean):boolean;
begin
  result:=true;
  memo1.lines.add(format('%s from %s to %s',[infilename,inpath,outpath]));
  if tag<>0 then result:=false; 
end;

procedure TForm1.Button3Click(Sender: TObject);
var
  mask:string;
  copysubfolders:boolean;
  resetreadonly:boolean;
  Dupnames:integer;
begin
  tag:=0;
  pagecontrol1.ActivePage := tabsheet1;
  mask := ComboBox1.text;
  copysubfolders := RadioGroup1.itemindex=1;
  resetreadonly := RadioGroup2.itemindex=1;
  Dupnames := RadioGroup3.itemindex;
  memo1.clear;
  screen.cursor := crHourGlass;

  startcopyfolder(InputDir,OutputDir,mask, Dupnames,
             copysubfolders, CheckBox2.checked, resetreadonly,FileCopyExit);

  with memo1, lines do
  begin
    add(inttostr(filescopied)+' files copied');
    if dupsoverwritten>0 then
    add(format('Includes %d duplicates overwritten = %d net files added',
           [dupsoverwritten, filescopied-dupsoverwritten]));
    if dupsnotcopied>0 then add(inttostr(dupsNotCopied)+' duplicates not copied');
  end;
  screen.cursor:=crDefault;
end;

procedure TForm1.FormActivate(Sender: TObject);
begin
  inputdir:='';
  outputdir:='';
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  copy := ComboBox1.Text;
end;

procedure TForm1.RadioButton1Click(Sender: TObject);
begin
  ComboBox1.ItemIndex := 0;
  ComboBox1.Enabled := false;
  Edit3.Enabled := false;
  Label4.Enabled := false;
  Label5.Enabled := false;
  Label6.Enabled := false;
end;

procedure TForm1.RadioButton2Click(Sender: TObject);
begin
  ComboBox1.Enabled := true;
  Edit3.Enabled := false;
  Label4.Enabled := false;
  Label5.Enabled := false;
  Label6.Enabled := false;
end;

procedure TForm1.RadioButton3Click(Sender: TObject);
begin
  ComboBox1.Enabled := true;
  Edit3.Enabled := true;
  Label4.Enabled := false;
  Label5.Enabled := false;
  Label6.Enabled := false;
end;

procedure TForm1.RadioButton4Click(Sender: TObject);
begin
  ComboBox1.Enabled := true;
  Edit3.Enabled := false;
  Label4.Enabled := true;
  Label5.Enabled := false;
  Label6.Enabled := false;
end;

procedure TForm1.RadioButton5Click(Sender: TObject);
begin
  ComboBox1.Enabled := true;
  Edit3.Enabled := false;
  Label4.Enabled := false;
  Label5.Enabled := true;
  Label6.Enabled := false;
end;

procedure TForm1.RadioButton6Click(Sender: TObject);
begin
  ComboBox1.Enabled := true;
  Edit3.Enabled := false;
  Label4.Enabled := false;
  Label5.Enabled := false;
  Label6.Enabled := true;
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
  tag:=1;
end;

procedure TForm1.Button5Click(Sender: TObject);
begin
  Edit1.Clear;
  Edit2.Clear;
  Memo1.Clear;
end;

procedure TForm1.ComboBox1Change(Sender: TObject);
begin
  copy := ComboBox1.Text;
end;

procedure TForm1.Edit3Change(Sender: TObject);
begin
  //copy :=
  ComboBox1.Text := Edit3.Text + copy;
end;

end.

