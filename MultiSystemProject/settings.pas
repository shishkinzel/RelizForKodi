unit settings;

interface

uses
  Classes, SysUtils, FMX.Forms, IniFiles, Windows;
{name Section}
const
  csIniSectionExt = 'SectionExt';
  csIniSectionPath = 'SectionPath';
  csIniSectionPathGlobal = 'SectionPathGlobal';

{Section : SectionExt}
  csExt = 'Ext';

{Section : SectionPath}
  csPath = 'Path';

{Section : SectionPathGlobal}
  csPathGlobal = 'PathGlobal';

type
  TIniOptions = class(TObject)
  private
  {Section : SectionExt}
    fExt: string;
  {Section : SectionPath}
    fPath: string;
  {Section : SectionPathGlobal}
    fPathGlobal: string;

  public
    procedure LoadSettings(Ini: TIniFile);
    procedure SaveSettings(Ini: TIniFile);
    
    procedure LoadFromFile(const FileName: string);
    procedure SaveToFile(const FileName: string);
{property}

{Section : SectionExt}
    property sExt: string read fExt write fExt;

{Section : SectionPath}
    property sPath: string read fPath write fPath;

{Section : SectionPathGlobal}
    property sPathGlobal: string read fPathGlobal write fPathGlobal;
  end;

var
  IniOptions: TIniOptions = nil;

implementation

uses
  fKODI;

procedure TIniOptions.LoadSettings(Ini: TIniFile);
begin
  if Ini <> nil then
  begin
      {Section : SectionExt}
  fExt := Ini.ReadString(csIniSectionExt,  csExt, '.avi');
       {Section : SectionPath}
  fPath := Ini.ReadString(csIniSectionPath, csPath, 'c:\');
         {Section : SectionPathGlobal}
  fPathGlobal := Ini.ReadString(csIniSectionPathGlobal, csPathGlobal, 'c:\');
  end;
end;

procedure TIniOptions.SaveSettings(Ini: TIniFile);
begin
  if Ini <> nil then
  begin
    {Section : SectionExt}
    Ini.WriteString(csIniSectionExt,  csExt, fExt);
   {Section : SectionPath}
    Ini.WriteString(csIniSectionPath, csPath, fPath);
   {Section : SectionPathGlobal}
    Ini.WriteString(csIniSectionPathGlobal, csPathGlobal, fPathGlobal);
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

initialization
  IniOptions := TIniOptions.Create;

finalization
  IniOptions.Free;

end.

