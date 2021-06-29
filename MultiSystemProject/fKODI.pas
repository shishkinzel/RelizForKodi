unit fKODI;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.ScrollBox, FMX.Memo,
  FMX.TabControl, System.Actions, FMX.ActnList, FMX.Menus, FMX.Layouts,
  FMX.Objects, FMX.Colors, FMX.StdActns, IniFiles, SortedBubble, settings,
  FMX.ListBox, FMX.Edit, FMX.ComboEdit;

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
    cbbExt: TComboBox;
    edtAddExt: TComboEdit;
    mniDelete: TMenuItem;
    btnApply: TSpeedButton;
    procedure actMiniExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure mniSourceClick(Sender: TObject);
    procedure mniPathClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure mniExtClick(Sender: TObject);
    procedure mniAddExpClick(Sender: TObject);
    procedure btnApplyClick(Sender: TObject);
    procedure mniDeleteClick(Sender: TObject);
    procedure mmoExtClick(Sender: TObject);
    procedure mmoExtExit(Sender: TObject);




  private
    { Private declarations }
    fFolder: string;
    fglPath: string;
    fExtCount: Integer;
    fPosExt: Integer;
    fFolderConvert: string;
    fFileRec: TSearchRec;
    fCountFile : integer;
    fExt : string;
  public
        { Public declarations }

    property sFolder: string read fFolder write fFolder;
    property sglPath: string read fglPath;
    property  sExtCount: Integer read fExtCount;

    const
      SettingsFileName = 'KODI_config.ini';
  end;

var
  frmKODI: TfrmKODI;

implementation

{$R *.fmx}

// �������� �����
procedure TfrmKODI.FormCreate(Sender: TObject);
var
f : TextFile;
i : Integer;
begin
  mmoExt.Lines.Clear;
 fglPath := System.SysUtils.GetCurrentDir + '\' + SettingsFileName;
 if not(FileExists(fglPath)) then
 begin
   AssignFile(f, fglPath);
   Rewrite(f);
   CloseFile(f);
   IniOptions.LoadFromFile(fglPath);
 end;
  IniOptions.LoadFromFile(fglPath);
  IniOptions.LoadFromFileExt(fglPath);
  sFolder := IniOptions.sPath;
  fExtCount := IniOptions.sExtCount;

   AssignFile(f, fglPath);
   Rewrite(f);
   CloseFile(f);
  mniSource.Enabled := False;
  tbcCenter.TabIndex := 0;

end;

// ������� ����
procedure TfrmKODI.actMiniExecute(Sender: TObject);
begin
 Self.WindowState := TWindowState.wsMinimized;
end;

// ���������� ������ btnApply - �������� ���������� � �������
procedure TfrmKODI.btnApplyClick(Sender: TObject);
var
  i: Integer;
begin
  if mmoExt.ReadOnly then
  begin
  for i := 0 to mmoExt.Lines.Count - 1 do
  begin
    if ('*.' + edtAddExt.Text) = mmoExt.Lines.Strings[i] then
      Exit;
    end;

    if edtAddExt.Text <> '' then
    begin
      mmoExt.Lines.Add('*.' + edtAddExt.Text);
    end;
  end
  else
  begin
    mmoExt.Lines.Delete(fPosExt);
    mmoExt.ReadOnly := True;
  end;
  mmoExtExit(mniExt);
end;

// ����� ���������� ����������

procedure TfrmKODI.mmoExtClick(Sender: TObject);
var
  i: Integer;
begin
  for i := 0 to mmoExt.Lines.Count - 1 do
    if mmoExt.Lines.Strings[i] = '' then
      mmoExt.Lines.Delete(i);
  fPosExt := mmoExt.CaretPosition.Line;

end;


// ��������� ������ �� ��������� ����������
procedure TfrmKODI.mmoExtExit(Sender: TObject);
var
i : Integer;
begin
   tbcCenter.TabIndex := 0;
     with cbbExt do
  begin
    Visible := True;
   Items.Clear;
    for I := 0 to mmoExt.Lines.Count - 1 do
    begin
    Items.Add(mmoExt.Lines.Strings[i]);
    end;

    cbbExt.ItemIndex := 0;
  end;
end;

procedure TfrmKODI.mniPathClick(Sender: TObject);
var
ssPath : string;
begin
 tbcCenter.TabIndex := 0;
if selectDirectory('������ ����� �� ���������', IniOptions.sPath, ssPath) then
begin
   fFolder := ssPath;
end;
end;

// �������� ���������� ����������
procedure TfrmKODI.mniAddExpClick(Sender: TObject);
var
  i: Integer;
begin
  mmoExt.ReadOnly := True;
  edtAddExt.Visible := True;
  tbcCenter.TabIndex := 1;
  edtAddExt.Items.Clear;
  edtAddExt.Text := '';
  edtAddExt.SetFocus;
  btnApply.Visible := True;
end;

// ������� ���������� ����������
procedure TfrmKODI.mniDeleteClick(Sender: TObject);
begin
 tbcCenter.TabIndex := 1;
 mmoExt.ReadOnly := False;
 mmoExt.SetFocus;
 btnApply.Visible := True;
end;

// ��� ������ ����������
procedure TfrmKODI.mniExtClick(Sender: TObject);
var
  i: Integer;
begin
   tbcCenter.TabIndex := 0;
   mniSource.Enabled := True;
  with cbbExt do
  begin
    Visible := True;
   Items.Clear;
    for I := 0 to IniOptions.sExtCount - 1 do
    begin
    Items.Add(mmoExt.Lines.Strings[i]);
    end;
    ItemIndex := 0;
  end;
end;

// �������� �����
procedure TfrmKODI.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 IniOptions.sPath := fFolder;
 IniOptions.sExtCount := mmoExt.Lines.Count;
 IniOptions.SaveToFile(fglPath);
end;

//******************************************************************************
//******************* �������� ��������� ����������� ***************************

procedure TfrmKODI.mniSourceClick(Sender: TObject);
var
  ssPath: string;
begin
  tbcCenter.TabIndex := 0;
  if selectDirectory('������ ����� ��� �����������', fFolder, ssPath) then
  begin
    fFolderConvert := ssPath + '\';   // ����� �����������
    fExt := cbbExt.Items[cbbExt.ItemIndex];
    fCountFile := FindFirst(fFolderConvert + fExt, faAnyFile, fFileRec);
    if fCountFile = 0 then
    begin
      mmoFilmName.Lines.Clear;
      mmoFilmName.Lines.add(fFileRec.Name);
      while 0 = FindNext(fFileRec) do
      begin
        mmoFilmName.Lines.add(fFileRec.Name);
      end;
    end;
  end;
end;

end.

