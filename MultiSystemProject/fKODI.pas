unit fKODI;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.ScrollBox, FMX.Memo,
  FMX.TabControl, System.Actions, FMX.ActnList, FMX.Menus, FMX.Layouts,
  FMX.Objects, FMX.Colors, FMX.StdActns, IniFiles, SortedBubble, settings;

type
  TfrmKODI = class(TForm)
    tlbTop: TToolBar;
    tlbDown: TToolBar;
    pnlCenter: TPanel;
    tbcCenter: TTabControl;
    tbtmList: TTabItem;
    tbtmExp: TTabItem;
    mmoFilmName: TMemo;
    mmKODI: TMainMenu;
    actlstKODI: TActionList;
    btnBack: TSpeedButton;
    btnNext: TSpeedButton;
    mniMainMenu: TMenuItem;
    mniTools: TMenuItem;
    mniAction: TMenuItem;
    mniAdvance: TMenuItem;
    mniSource: TMenuItem;
    mniCancel: TMenuItem;
    mniReset: TMenuItem;
    mniQuit: TMenuItem;
    mniExt: TMenuItem;
    mniNumEpisod: TMenuItem;
    mniSorting: TMenuItem;
    mniNoSorting: TMenuItem;
    mniPath: TMenuItem;
    mniAddExp: TMenuItem;
    actNext: TNextTabAction;
    actBack: TPreviousTabAction;
    pnlCenTop: TPanel;
    txtEpisode1: TText;
    lytExt: TLayout;
    clrbxExt: TColorBox;
    pnllef: TPanel;
    pnlRight: TPanel;
    pnlTop: TPanel;
    txtExt: TText;
    clrbxExtTop: TColorBox;
    clrbxLef: TColorBox;
    clrbxRight: TColorBox;
    mmoExt: TMemo;
    clrbx1: TColorBox;
    clrbxBotton: TColorBox;
    btnclose: TSpeedButton;
    wndwclsClose: TWindowClose;
    btnMin: TSpeedButton;
    actMini: TAction;
    actFindSource: TAction;
    dlgOpenFind: TOpenDialog;
    procedure actMiniExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure mniSourceClick(Sender: TObject);
    procedure mniPathClick(Sender: TObject);
  private
    { Private declarations }
    fFolder : string;
    fFolderDefault : string;
  public
    { Public declarations }

    property sFolder : string read fFolder;


    const
      SettingsFileName = 'KODI_config.ini';
  end;

var
  frmKODI: TfrmKODI;

implementation

{$R *.fmx}
// свертка окна
procedure TfrmKODI.actMiniExecute(Sender: TObject);
begin
 Self.WindowState := TWindowState.wsMinimized;
end;


procedure TfrmKODI.FormCreate(Sender: TObject);
var
f : TextFile;
glPath : string;
begin
 glPath := System.SysUtils.GetCurrentDir + '\' + SettingsFileName;
 if not(FileExists(glPath)) then
 begin
   AssignFile(f, glPath);
   Rewrite(f);
   CloseFile(f);
   IniOptions.LoadFromFile(glPath);
   IniOptions.SaveToFile(glPath);
 end;

 fFolderDefault := IniOptions.sPathGlobal;


end;

procedure TfrmKODI.mniPathClick(Sender: TObject);
var
sPath : string;
begin
if selectDirectory('Выбери папку по умолчанию', fFolderDefault, sPath) then
begin
   fFolder := sPath;
   IniOptions.sPathGlobal := fFolder;
end;
end;

procedure TfrmKODI.mniSourceClick(Sender: TObject);
var
  sPath: string;
begin
  if selectDirectory('Выбери папку по умолчанию', fFolder, sPath) then
  begin


  end;

end;

end.

