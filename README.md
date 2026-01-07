# Copy-Worker:

</br>

![Compiler](https://github.com/user-attachments/assets/a916143d-3f1b-4e1f-b1e0-1067ef9e0401) ![10 Seattle](https://github.com/user-attachments/assets/c70b7f21-688a-4239-87c9-9a03a8ff25ab) ![10 1 Berlin](https://github.com/user-attachments/assets/bdcd48fc-9f09-4830-b82e-d38c20492362) ![10 2 Tokyo](https://github.com/user-attachments/assets/5bdb9f86-7f44-4f7e-aed2-dd08de170bd5) ![10 3 Rio](https://github.com/user-attachments/assets/e7d09817-54b6-4d71-a373-22ee179cd49c)  ![10 4 Sydney](https://github.com/user-attachments/assets/e75342ca-1e24-4a7e-8fe3-ce22f307d881) ![11 Alexandria](https://github.com/user-attachments/assets/64f150d0-286a-4edd-acab-9f77f92d68ad) ![12 Athens](https://github.com/user-attachments/assets/59700807-6abf-4e6d-9439-5dc70fc0ceca)  
![Components](https://github.com/user-attachments/assets/d6a7a7a4-f10e-4df1-9c4f-b4a1a8db7f0e) ![None](https://github.com/user-attachments/assets/30ebe930-c928-4aaf-a8e1-5f68ec1ff349)  
![Description](https://github.com/user-attachments/assets/dbf330e0-633c-4b31-a0ef-b1edb9ed5aa7) ![Copy Worker](https://github.com/user-attachments/assets/72aa65b3-72ba-4ce1-8ae5-3c6a24cfc952)  
![Last Update](https://github.com/user-attachments/assets/e1d05f21-2a01-4ecf-94f3-b7bdff4d44dd) ![012026](https://github.com/user-attachments/assets/ae91e595-2dbf-4d94-b953-81e4fd25dcc3)   
![License](https://github.com/user-attachments/assets/ff71a38b-8813-4a79-8774-09a2f3893b48) ![Freeware](https://github.com/user-attachments/assets/1fea2bbf-b296-4152-badd-e1cdae115c43)  

</br>

File copying is the act of creating a new file such that it has the same content as an existing file. The operation is sometimes called cloning.

Generally, an operating system command-line [shell](https://en.wikipedia.org/wiki/Shell_(computing)) provides for file copying via commands cp, copy and similar variants. mv also copies files but only when the source and destination are on different file systems. Windows also provides includes the more advanced tools: [Robocopy](https://en.wikipedia.org/wiki/Robocopy) and [xcopy](https://en.wikipedia.org/wiki/XCOPY).

Many operating systems also provide for copying files via a graphical user interface, such as a file manager. It may provide for [copy-and-paste](https://en.wikipedia.org/wiki/Cut,_copy,_and_paste) and [drag-and-drop](https://en.wikipedia.org/wiki/Drag_and_drop) user experience.

</br>

![CopyFolder](https://github.com/user-attachments/assets/529a3e96-f9fd-4ada-a0c3-d04273725f90)

</br>

# Instructions:

This program was written to test a ```"CopyFolder"``` function for use by Delphi programmers, but it has enough  features to perhaps serve as a useful utility.

### Usage is straight-forward:  
Select an input folder and an output folder, which may be an existing folder or a new one. Set the other options and click the ```"Copy"``` button to complete the operation. The ```"File masks"``` tab above gives more information about defining  mask strings.

This Introduction page will be replaced by a list of files copied and the total count will be displayed when the operation has been completed.

You may interrupt the operation by clicking the ```"Stop"``` button but the copies of files already processed will remain in the output folder.  If you select ```"Ask"``` option for the Duplicate Files radio group, a reply of ```"Cancel"``` when asked will also stop the operation.

Version 2 tests new features of file copy.  Counts of files copied,duplicate files overwritten and duplicate files not copied arekept by the copyfolder functions and are reported by this program at job completion time.

A new option allows user to specify that all files found be copied to the same output folder, ignoring input subfolder directory structure. This increases the likleyhood that duplicate file names will be found.  The ```"Ask"``` dialog when duplicates are found now has ```"Yes to all"``` and ```"No to all"``` buttons to specify a default action when additional duplicate file names are encountered}

Version 3 change the file date test to use ```"Last Modified Date"``` instead of ```"Creation Date"``` when deciding which file is newer for overwriting decisions.  It also now checks and ignores copying a source subfolder if it also happens to be the destination folder for the copy operation.co

</br>

# Masks:
File masks can be a useful way to select a set of files meeting specific criteria. A mask is a string of characters with defined meanings. Character matches are not case sensitive, upper and lower case versions of a letter will match.

| Mask | Description |
| :-----------: | :----------- |
| ```* (asterisk)```     | a "wild card" indicating an unspecified number of characters in the file name.     |
| ```? (question mark)```     | a wild card which matches a single character position in the file name.     |
| ```[  (open bracket)```     |  beginning of a "set" definition, a set of alternative characters for specific position.     |
| ```] (close bracket)```     | the end of a set defininition     |
| ```!  (exclamation point)```     | may appear immediately following a [ to indicate that any character not in the set counts as a match.     |
| ```-  (hyphen)```     | separating two characters in a set indicates a range of character to test.

</br>

# Examples:
Here are some examples: (In these examples double quotes (") are used to identify literals but are not part of the string being referenced.)

| Example | Description |
| :-----------: | :----------- |
| ```*.*```     | match any string that has a dot ```(.)``` in any position     |
| ```*.txt```     | match any string that ends with ```".txt"```     |
| ```2026*.doc```     |  match any string that starts with ```"2026"``` and ends with ```".doc"```     |
| ```2026[abc].log```     |  match a flename that is 11 characters long,  has an ```"a"```, ```"b"```, or ```"c'``` as its 7th character, and ends with ```".log"```     |
| ```*[0-9][0-9]*.*```      | match any file name that has a 2 digit number anywhere in the base part of the name.     |
| ```[!e][!x]*.*```     | match any file name that does not begin with ```"ex"```     |

</br>

# Mask Edit:
This section in ```UCopyFolder3.pas``` defines the copy operation and can be modified as desired to determine the copy operation and the mask.

```pascal
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
```




