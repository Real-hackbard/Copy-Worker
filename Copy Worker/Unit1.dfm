object Form1: TForm1
  Left = 1650
  Top = 208
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Copy Worker'
  ClientHeight = 577
  ClientWidth = 675
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Arial'
  Font.Style = []
  Position = poScreenCenter
  OnActivate = FormActivate
  OnCreate = FormCreate
  TextHeight = 14
  object Label1: TLabel
    Left = 12
    Top = 310
    Width = 130
    Height = 14
    Caption = 'Enter or select a file mask :'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel
    Left = 218
    Top = 198
    Width = 109
    Height = 14
    Caption = 'and end with the mask'
  end
  object Label4: TLabel
    Left = 347
    Top = 224
    Width = 57
    Height = 14
    Caption = '???[abc].txt'
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
  end
  object Label5: TLabel
    Left = 316
    Top = 244
    Width = 59
    Height = 14
    Caption = '*[0-9][0-9]*.*'
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
  end
  object Label6: TLabel
    Left = 291
    Top = 267
    Width = 39
    Height = 14
    Caption = '[!e][!x]*.*'
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
  end
  object Label7: TLabel
    Left = 17
    Top = 529
    Width = 50
    Height = 14
    Caption = 'Progress :'
  end
  object Button1: TButton
    Left = 6
    Top = 55
    Width = 43
    Height = 25
    Caption = 'Input'
    TabOrder = 0
    TabStop = False
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 6
    Top = 86
    Width = 43
    Height = 25
    Caption = 'Output'
    TabOrder = 1
    TabStop = False
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 602
    Top = 525
    Width = 60
    Height = 25
    Caption = 'Copy files'
    Enabled = False
    TabOrder = 2
    TabStop = False
    OnClick = Button3Click
  end
  object CheckBox1: TCheckBox
    Left = 55
    Top = 121
    Width = 145
    Height = 17
    TabStop = False
    Caption = 'Allow new output folder'
    Checked = True
    State = cbChecked
    TabOrder = 3
  end
  object ComboBox1: TComboBox
    Left = 149
    Top = 307
    Width = 186
    Height = 22
    DropDownCount = 25
    TabOrder = 4
    TabStop = False
    Text = '*.*'
    OnChange = ComboBox1Change
    Items.Strings = (
      '*.*'
      '*.txt'
      '*.ini'
      '*.exe'
      '*.xdoc'
      '*.xls'
      '*.bmp'
      '*.gif'
      '*.jpg'
      '*.jpeg'
      '*.png'
      '*.svg'
      '*.ico'
      '*.rar'
      '*.zip'
      '*.log'
      '*.js'
      '*.dll'
      '*.html'
      '*.php'
      '*.css')
  end
  object Button4: TButton
    Left = 536
    Top = 525
    Width = 60
    Height = 25
    Caption = 'Stop'
    TabOrder = 5
    TabStop = False
    OnClick = Button4Click
  end
  object PageControl1: TPageControl
    Left = 417
    Top = 57
    Width = 249
    Height = 462
    ActivePage = TabSheet1
    TabOrder = 6
    TabStop = False
    object TabSheet1: TTabSheet
      Caption = 'Introduction'
      object Memo1: TMemo
        Left = 0
        Top = 0
        Width = 241
        Height = 433
        TabStop = False
        Align = alClient
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Lines.Strings = (
          'This program was written to test a "CopyFolder" function for '
          
            'use by Delphi programmers, but it has enough  features to perhap' +
            's '
          'serve as a useful utility.'
          ''
          'Usage is straight-forward:  Select an input folder and an '
          
            'output folder, which may be an existing folder or a new one.  Se' +
            't the '
          'other options and click the "Copy" button to complete the '
          'operation.  The "File masks" tab above gives more '
          'information about defining  mask strings.'
          ''
          
            'This Introduction page will be replaced by a list of files copie' +
            'd '
          'and the total count will be displayed when the operation has '
          'been completed.'
          ''
          'You may interrupt the operation by clicking the "Stop" button '
          
            'but the copies of files already processed will remain in the out' +
            'put '
          
            'folder.  If you select "Ask" option for the Duplicate Files radi' +
            'o '
          'group, a reply of "Cancel" when asked will also stop the '
          'operation.'
          ''
          'Version 2 tests new features of file copy.  Counts of files '
          
            'copied,duplicate files overwritten and duplicate files not copie' +
            'd are'
          'kept by the copyfolder functions and are reported by this '
          'program at job completion time.'
          ''
          'A new option allows user to specify that all files found be '
          
            'copied to the same output folder, ignoring input subfolder direc' +
            'tory '
          'structure. This increases the likleyhood that duplicate file '
          
            'names will be found.  The "Ask" dialog when duplicates are found' +
            ' '
          
            'now has "Yes to all" and "No to all" buttons to specify a defaul' +
            't '
          'action when additional duplicate file names are encountered}'
          ''
          'Version 3 change the file date test to use "Last Modified '
          
            'Date" instead of "Creation Date" when deciding which file is new' +
            'er '
          'for overwriting decisions.  It also now checks and ignores '
          
            'copying a source subfolder if it also happens to be the destinat' +
            'ion folder '
          'for the copy operation.co'
          '')
        ParentFont = False
        ReadOnly = True
        ScrollBars = ssBoth
        TabOrder = 0
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'File Masks'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ImageIndex = 1
      ParentFont = False
      object Memo2: TMemo
        Left = 0
        Top = 0
        Width = 241
        Height = 433
        Align = alClient
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Lines.Strings = (
          
            'File masks can be a useful way to select a set of files meeting ' +
            'specific criteria.'
          
            'A mask is a string of characters with defined meanings.  Charact' +
            'er matches are'
          
            'not case sensitive, upper and lower case versions of a letter wi' +
            'll match.'
          ' '
          
            '*  (asterisk): a "wild card" indicating an unspecified number of' +
            ' characters in the '
          'file name.'
          ''
          
            '? (question mark) : a wild card which matches a single character' +
            ' position in the '
          'file name.'
          ''
          
            '[  (open bracket): beginning of a "set" definition, a set of alt' +
            'ernative characters '
          'for specific position.'
          ''
          '] (close bracket) : the end of a set defininition'
          ''
          
            '!  (exclamation point): may appear immediately following a [ to ' +
            'indicate that any '
          'character not in the set counts as a match.'
          ''
          
            '-  (hyphen): separating two characters in a set indicates a rang' +
            'e of character to '
          'test.'
          ''
          
            'Here are some examples: (In these examples double quotes (") are' +
            ' used to '
          
            'identify literals but are not part of the string being reference' +
            'd.)'
          ''
          '*.*    match any string that has a dot (.) in any position'
          ''
          '*.txt    match any string that ends with ".txt"'
          ''
          
            '2025*.doc    match any string that starts with "2006" and ends w' +
            'ith ".doc"'
          ''
          
            '2025[abc].log     match a flename that is 11 characters long,  h' +
            'as an "a", '
          '"b", or "c'#39' as its 7th character, and ends with ".log"'
          ''
          
            '*[0-9][0-9]*.*     match any file name that has a 2 digit number' +
            ' anywhere in the'
          'base part of the name.'
          ''
          
            '[!e][!x]*.*     match any file name that does not begin with "ex' +
            '"'
          '  '
          ' '
          ' ')
        ParentFont = False
        ReadOnly = True
        ScrollBars = ssBoth
        TabOrder = 0
      end
    end
  end
  object PageControl2: TPageControl
    Left = 8
    Top = 342
    Width = 396
    Height = 177
    ActivePage = TabSheet3
    TabOrder = 7
    TabStop = False
    object TabSheet3: TTabSheet
      Caption = 'Output fFle Attributes '
      object RadioGroup1: TRadioGroup
        Left = 1
        Top = 4
        Width = 384
        Height = 65
        Caption = 'Scope'
        ItemIndex = 1
        Items.Strings = (
          'Copy files in this folder only'
          'Copy files in this folder and subfolders')
        TabOrder = 0
      end
      object RadioGroup2: TRadioGroup
        Left = 1
        Top = 75
        Width = 384
        Height = 65
        Caption = 'Output fFle Attributes '
        ItemIndex = 1
        Items.Strings = (
          'Retain input file attributes'
          'Reset  "read only" attribute ')
        TabOrder = 1
      end
    end
    object TabSheet4: TTabSheet
      Caption = 'Duplicate file Names'
      ImageIndex = 1
      object RadioGroup3: TRadioGroup
        Left = 1
        Top = 59
        Width = 384
        Height = 86
        Caption = 'Duplicate file Names'
        Columns = 2
        ItemIndex = 2
        Items.Strings = (
          'Skip'
          'Replace'
          'Replace if newer'
          'Ask')
        TabOrder = 0
      end
      object CheckBox2: TCheckBox
        Left = 8
        Top = 11
        Width = 177
        Height = 33
        TabStop = False
        Caption = 'Drop subfolders in output. '#13#10'(Copy all to root output folder) '
        TabOrder = 1
        WordWrap = True
      end
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 675
    Height = 51
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 8
    ExplicitWidth = 671
    object Label2: TLabel
      Left = 12
      Top = 5
      Width = 166
      Height = 39
      Caption = 'Copy Worker'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -32
      Font.Name = 'Impact'
      Font.Style = []
      ParentFont = False
    end
  end
  object Edit1: TEdit
    Left = 55
    Top = 57
    Width = 349
    Height = 22
    TabStop = False
    ReadOnly = True
    TabOrder = 9
  end
  object Edit2: TEdit
    Left = 55
    Top = 88
    Width = 349
    Height = 22
    TabStop = False
    ReadOnly = True
    TabOrder = 10
  end
  object RadioButton1: TRadioButton
    Left = 8
    Top = 152
    Width = 65
    Height = 17
    Caption = 'Any File'
    Checked = True
    TabOrder = 11
    TabStop = True
    OnClick = RadioButton1Click
  end
  object RadioButton2: TRadioButton
    Left = 8
    Top = 175
    Width = 217
    Height = 17
    Caption = 'Any file ending with the mask extension'
    TabOrder = 12
    OnClick = RadioButton2Click
  end
  object RadioButton3: TRadioButton
    Left = 8
    Top = 198
    Width = 132
    Height = 17
    Caption = 'All files that start with'
    TabOrder = 13
    OnClick = RadioButton3Click
  end
  object RadioButton4: TRadioButton
    Left = 8
    Top = 221
    Width = 337
    Height = 17
    Caption = 
      'Specify the file length with "?" followed by the letter, for exa' +
      'mple:'
    TabOrder = 14
    OnClick = RadioButton4Click
  end
  object RadioButton5: TRadioButton
    Left = 8
    Top = 244
    Width = 313
    Height = 17
    Caption = 'Any file name that has 2 digit number in the name, Example :'
    TabOrder = 15
    OnClick = RadioButton5Click
  end
  object RadioButton6: TRadioButton
    Left = 8
    Top = 267
    Width = 284
    Height = 17
    Caption = 'Any file name that does not begin with "ex", Example : '
    TabOrder = 16
    OnClick = RadioButton6Click
  end
  object Edit3: TEdit
    Left = 140
    Top = 195
    Width = 71
    Height = 22
    TabStop = False
    Enabled = False
    TabOrder = 17
    Text = 'start'
    OnChange = Edit3Change
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 558
    Width = 675
    Height = 19
    Panels = <
      item
        Text = 'Input :'
        Width = 50
      end
      item
        Text = '0'
        Width = 200
      end
      item
        Text = 'Output :'
        Width = 50
      end
      item
        Text = '0'
        Width = 50
      end>
    ExplicitTop = 557
    ExplicitWidth = 671
  end
  object ProgressBar1: TProgressBar
    Left = 73
    Top = 528
    Width = 324
    Height = 17
    TabOrder = 19
  end
  object Button5: TButton
    Left = 421
    Top = 525
    Width = 60
    Height = 25
    Caption = 'Clear'
    TabOrder = 20
    OnClick = Button5Click
  end
end
