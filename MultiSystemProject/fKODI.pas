unit fKODI;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.ScrollBox, FMX.Memo,
  FMX.TabControl, System.Actions, FMX.ActnList, FMX.Menus;

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
    lblExp: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmKODI: TfrmKODI;

implementation

{$R *.fmx}

end.
