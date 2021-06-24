unit fKODI;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.ScrollBox, FMX.Memo,
  FMX.TabControl, System.Actions, FMX.ActnList, FMX.Menus, FMX.Layouts,
  FMX.Objects, FMX.Colors, FMX.StdActns;

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
    procedure actMiniExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmKODI: TfrmKODI;

implementation

{$R *.fmx}

procedure TfrmKODI.actMiniExecute(Sender: TObject);
begin
 Self.WindowState := TWindowState.wsMinimized;
end;

end.
