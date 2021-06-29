unit settings;

interface

uses
  Classes, SysUtils, FMX.Forms, IniFiles, Windows;
{name Section}
const
  csIniSectionExt = 'SectionExt';
  csIniSectionPath = 'SectionPath';
  csIniSectionExtCount = 'SectionExtCount';

{Section : csIniSectionExt}
  csExt = 'Ext';

{Section : csIniSectionPath}
  csPath = 'Path';

{Section : csIniSectionExtCount}
  csExtCount = 'ExtCount';

type
  TIniOptions = class(TObject)
  private
  {Section : csIniSectionExt}
    fExt: string;
  {Section : csIniSectionPath}
    fPath: string;
  {Section : csIniSectionExtCount}
    fExtCount: Integer;

  public
    procedure LoadSettings(Ini: TIniFile);
    procedure LoadSettingExt(Ini : TIniFile; ExtCount : Integer);
    procedure SaveSettings(Ini: TIniFile);
    
    procedure LoadFromFile(const FileName: string);
    procedure SaveToFile(const FileName: string);
    procedure LoadFromFileExt(const FileName: string);
{property}

{Section : SectionExt}
    property sExt: string read fExt write fExt;

{Section : SectionPath}
    property sPath: string read fPath write fPath;

{Section : csIniSectionExtCount}
    property sExtCount: Integer read fExtCount write fExtCount;
  end;

var
  IniOptions: TIniOptions = nil;

implementation

uses
  fKODI;

procedure TIniOptions.LoadSettingExt(Ini: TIniFile; ExtCount: Integer);
var
i : Integer;
begin
  {Section : SectionExt}
    for i := 0 to ExtCount - 1 do
     frmKODI.mmoExt.Lines.Add(Ini.ReadString(csIniSectionExt, csExt + ' ' + (i + 1).ToString, '*.avi'));
end;

procedure TIniOptions.LoadSettings(Ini: TIniFile);
begin
  if Ini <> nil then
  begin
  {Section : SectionPath}
    fPath := Ini.ReadString(csIniSectionPath, csPath, 'c:\');

  {Section : csIniSectionExtCount}
    fExtCount := Ini.readInteger(csIniSectionExtCount, csExtCount, 1);

  end;
end;

procedure TIniOptions.SaveSettings(Ini: TIniFile);
var
  i: Integer;
begin
  if Ini <> nil then
  begin
  {Section : SectionPath}
    Ini.WriteString(csIniSectionPath, csPath, fPath);

  {Section : csIniSectionExtCount}
    Ini.WriteInteger(csIniSectionExtCount, csExtCount, fExtCount);

  {Section : SectionExt}
    for i := 0 to fExtCount - 1 do
      Ini.WriteString(csIniSectionExt, csExt + ' ' + (i + 1).ToString, frmKODI.mmoExt.Lines[i]);
  end;
end;

procedure TIniOptions.LoadFromFile(const FileName: string);
var
  Ini: TIniFile;
begin
  Ini := TIniFile.Create(FileName);
  try
    LoadSettings(Ini);
  finally
    Ini.Free;
  end;
end;

procedure TIniOptions.SaveToFile(const FileName: string);
var
  Ini: TIniFile;
begin
  Ini := TIniFile.Create(FileName);
  try
    SaveSettings(Ini);
  finally
    Ini.Free;
  end;
end;

procedure TIniOptions.LoadFromFileExt(const FileName: string);
var
  Ini: TIniFile;
begin
   Ini := TIniFile.Create(FileName);
  try
    LoadSettingExt(Ini, fExtCount);
  finally
    Ini.Free;
  end;
end;

initialization
  IniOptions := TIniOptions.Create;

finalization
  IniOptions.Free;

end.

