unit UCopyFolder3;

interface

Uses
  Windows, Sysutils, Dialogs, Controls, Forms, Filectrl, Masks;

type
  TCopyFolderExit = function(const inpath,outpath,infilename:string;
             var Cancopy:boolean):boolean of object;
  function Startcopyfolder(fromfolderIn, tofolderIn,mask:string; dupfileopts:integer;
                        copysubfolders, CopytoRoot,ResetReadOnly:boolean):boolean;  overload;
  function Startcopyfolder(fromfolderIn, tofolderIn,mask:string; dupfileopts:integer;
                        copysubfolders, CopyToRoot,ResetReadOnly:boolean;
                        FileExit:TCopyFolderExit):boolean;  overload;

  var
    Filescopied:integer;
    DupsOverWritten:integer;
    DupsNotCopied:integer;
    DroppedbyUserExit:integer;
    shortdateformat, shorttimeformat : string;

implementation

uses Unit1;

var
  yesToAll,Notoall:boolean;
  function copyfolder(fromfolderIn, tofolderIn,mask:string; dupfileopts:integer;
                        copysubfolders, CopytoRoot,ResetReadOnly:boolean):boolean;  overload; forward;
  function copyfolder(fromfolderIn, tofolderIn,mask:string; dupfileopts:integer;
                        copysubfolders, CopyToRoot,ResetReadOnly:boolean;
                        FileExit:TCopyFolderExit):boolean;  overload; forward;

function Startcopyfolder(fromfolderIn, tofolderIn,mask:string; dupfileopts:integer;
                        copysubfolders, CopytoRoot,ResetReadOnly:boolean):boolean;  overload;
begin
  FilesCopied:=0;
  dupsOverWritten:=0;
  DupsNotCopied:=0;
  DroppedByUserExit:=0;
  Yestoall:=false;
  NoToAll:=false;
  result:=Copyfolder(fromfolderIn, tofolderIn,mask,dupfileopts,
                     copysubfolders, CopytoRoot, ResetReadOnly);
end;

function Startcopyfolder(fromfolderIn, tofolderIn,mask:string; dupfileopts:integer;
                        copysubfolders, CopyToRoot,ResetReadOnly:boolean;
                        FileExit:TCopyFolderExit):boolean;  overload;
begin
  FilesCopied:=0;
  dupsOverWritten:=0;
  DupsNotCopied:=0;
  DroppedByUserExit:=0;
  Yestoall:=false;
  NoToAll:=false;
  result:=copyfolder(fromfolderIn, tofolderIn,mask,dupfileopts,
                        copysubfolders, CopyToRoot,ResetReadOnly,
                        FileExit);
end;

type Tdummyclass = class(TObject)
  function dummyfileexit(const inpath,outpath,Infilename:string;
                          var Cancopy:boolean):boolean;
end;

var  dummyclass:TDummyclass;
function Tdummyclass.dummyfileexit(const inpath,outpath,infilename:string;
                         var Cancopy:boolean):boolean;
begin  
  result:=true;
end;

Function FileTimeToDateTime(FileTime : TFileTime) : TDateTime;
var
   LocalTime : TFileTime;
   SystemTime : TSystemTime;
begin
   Result := EncodeDate(1900,1,1);      
   if FileTimeToLocalFileTime(FileTime, LocalTime) then
   if FileTimeToSystemTime(LocalTime, SystemTime) then
   Result := SystemTimeToDateTime(SystemTime);
end;

function copyfolder(fromfolderIn, tofolderIn,mask:string; dupfileopts:integer;
               copysubfolders, CopyToRoot,ResetReadOnly:boolean;
               FileExit:TCopyFolderExit):boolean; overload;
var
  f:TSearchrec;
  r:integer;
  mr:integer;
  fromname,toname:string;
  fromfolder,tofolder:string;
  fromdate,todate:TDatetime;
  upFName:string;
  CreationTime, LastAccessTime, ToLastWriteTime, FromlastWriteTime: FileTime;
  HFile:integer;
  nexttofolder:string;

    procedure copyafile(FailExists:boolean);
    var
      cancopy:boolean;
    begin
      cancopy:=true;
      if @fileExit<>@tdummyclass.dummyfileexit 
      then result:=fileExit(fromfolder,tofolder,f.name,cancopy);

      if cancopy then
      begin
        copyfile(pchar(fromname),pchar(toname),FailExists);
        inc(filescopied);
        if resetreadonly and ((f.attr and faReadOnly)<>0)
        then filesetattr(toname, f.attr and (not FAReadonly));
      end
      else inc(droppedbyUserExit);
    end;
begin
  result:=true;
  fromfolder:=includeTrailingBackslash(fromfolderIn);
  tofolder:=includeTrailingBackslash(tofolderIn);
  if not directoryexists(tofolder) then
    if not createdir(tofolder) then
    begin
      raise Exception.Create('Cannot create '+tofolder);
      result:=false;
    end;

  if result then
  begin
    r:= FindFirst(fromfolder+'*.*', FaAnyFile, F);
    while (r=0) and result do
    begin
      UpFName:=Uppercase(F.name);
      If (length(f.name)>0) and (UpFname<>'RECYCLED') and (UpFname<>'$RECYCLE')
      and (F.name[1]<>'.') and (F.Attr and FAVolumeId=0)
      then
      begin
        if ((F.Attr and FADirectory) >0) 
        then
        begin 
          if copysubfolders then
          if fromfolder+F.name+'\'<> Tofolder then
          begin
            if not copytoroot then nexttofolder:=tofolder+f.name
            else nexttofolder:=tofolder;
            result:=Copyfolder(fromfolder+IncludetrailingpathDelimiter(F.Name),
                                  IncludetrailingpathDelimiter(nexttofolder),
                                  mask,dupfileopts, copysubfolders, copytoroot,
                                  resetreadonly,FileExit)
          end;
        end
        else
        try
          if matchesmask(f.name,mask) then
          begin
            fromname:=fromfolder+f.name;
            toname:=tofolder+f.name;
            if fileexists(toname) then
            begin
              Hfile:=fileopen(toname, fmopenread);
              if (hfile>=0)
                and (GetFileTime(hFile, @CreationTime, @LastAccessTime, @ToLastWriteTime)) then
              begin
                 fileclose(HFile);
                 FromLastWriteTime:=f.finddata.ftLastWriteTime;
                case
                  dupfileopts of
                  1:
                    begin
                      copyafile(false);
                      inc(dupsoverwritten);
                    end;
                  2:
                  begin
                    if comparefiletime(FromLastWriteTime,ToLastWriteTime)>0
                    then
                    begin
                      copyafile(false);
                      inc(dupsoverwritten);
                    end;
                  end;
                  3: 
                  begin
                    if (not NoToall) and (Not yestoall) then
                    begin
                      todate:=FiletimeToDateTime(ToLastWriteTime);
                      fromdate:=FiletimeToDateTime(FromLastWriteTime);
                      mr:= messagedlg('Replace '+toname +' created '
                        +formatdatetime(shortdateformat +' '+shorttimeformat,todate)
                        +#13+ 'with '+fromname+' created '
                        +FORMATDATETIME(SHORTDATEFORMAT +' '+SHORTTIMEFORMAT,FROMDATE),
                        mtconfirmation, [mbyes,mbyestoall,mbno,mbnotoall,mbcancel],0);
                        if mr=mryestoall then YesToall:=true
                        else if mr = mrNotoall then NoToall:=true;
                    end
                    else mr:=0;
                    if YestoAll or (mr=mryes)then
                    begin
                      copyafile(false);
                      inc(dupsoverwritten);
                    end
                    else
                    begin
                      inc(dupsnotcopied);
                      if mr= mrcancel then result:=false
                    end;
                  end;
                end; 
              end
            end  
            else copyafile(false);
          end;
        except
          showmessage('Invalid mask "'+mask+'" entered, see documentation');
          result:=false;
        end; 
      end;

      Form1.ProgressBar1.Position := Form1.ProgressBar1.Position +1;
      r:=Findnext(F);
    end;
    FindClose(f);
  end;
end;

function copyfolder(fromfolderIn, tofolderIn,mask:string; dupfileopts:integer;
               copysubfolders, CopyToRoot,ResetReadOnly:boolean):boolean; overload;
begin
  result := copyfolder(fromfolderIn, tofolderIn,mask,dupfileopts,
               copysubfolders, CopyToRoot, ResetReadOnly, dummyclass.DummyFileExit);
end;

end.

