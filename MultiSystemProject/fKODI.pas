unit fKODI;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.ScrollBox, FMX.Memo,
  FMX.TabControl, System.Actions, FMX.ActnList, FMX.Menus, FMX.Layouts,
  FMX.Objects, FMX.Colors, FMX.StdActns, IniFiles, SortedBubble, settings,
  FMX.ListBox, FMX.Edit, FMX.ComboEdit, Windows, FMX.EditBox, FMX.SpinBox;

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
    txtEpisode: TText;
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
    mniSeson: TMenuItem;
    spnbxSeson: TSpinBox;
    txtSeson: TText;
    mniConvert: TMenuItem;
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
    procedure mniSesonClick(Sender: TObject);
    procedure spnbxSesonChange(Sender: TObject);
    procedure mniSortingClick(Sender: TObject);
    procedure mniConvertClick(Sender: TObject);




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
    fSeson : Single;
    OldFilePath, NewFilePath : string;
    fEditSer : Integer;  // параметр смещения нумераций серий
    NewFile : string;
  public
        { Public declarations }
     flagSeson : Boolean ;

    property sFolder: string read fFolder write fFolder;
    property sglPath: string read fglPath;
    property  sExtCount: Integer read fExtCount;
    property  sSeson: Single read fSeson;

    const
      SettingsFileName = 'KODI_config.ini';
  end;

var
  frmKODI: TfrmKODI;

implementation

{$R *.fmx}

// создание формы
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
  flagSeson := False;
end;

// свертка окна
procedure TfrmKODI.actMiniExecute(Sender: TObject);
begin
 Self.WindowState := TWindowState.wsMinimized;
end;

// оброботчик кнопки btnApply - добавить расширение и удалить
procedure TfrmKODI.btnApplyClick(Sender: TObject);
var
  i: Integer;
begin
  if not(flagSeson) then
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
  end
  else
  begin
  fSeson := spnbxSeson.Value;
  flagSeson := False;
  end;
   btnApply.Visible := False;
  mmoExtExit(mniExt);
end;

// выбор расширения видеофайла

procedure TfrmKODI.mmoExtClick(Sender: TObject);
var
  i: Integer;
begin
  for i := 0 to mmoExt.Lines.Count - 1 do
    if mmoExt.Lines.Strings[i] = '' then
      mmoExt.Lines.Delete(i);
  fPosExt := mmoExt.CaretPosition.Line;

end;


// обработка выхода из коррекции расширения
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
if selectDirectory('Выбери папку по умолчанию', IniOptions.sPath, ssPath) then
begin
   fFolder := ssPath;
end;
end;

// добавить расширения видеофайла
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

// удалить расширение видеофайла
procedure TfrmKODI.mniDeleteClick(Sender: TObject);
begin
 tbcCenter.TabIndex := 1;
 mmoExt.ReadOnly := False;
 mmoExt.SetFocus;
 btnApply.Visible := True;
end;

// код выбора расширения
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

// закрытие формы
procedure TfrmKODI.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 IniOptions.sPath := fFolder;
 IniOptions.sExtCount := mmoExt.Lines.Count;
 IniOptions.SaveToFile(fglPath);
end;

//******************************************************************************
//******************* Основная программа конвертации ***************************

procedure TfrmKODI.mniSourceClick(Sender: TObject);
var
  ssPath: string;
begin
  tbcCenter.TabIndex := 0;
  if selectDirectory('Выбери папку для конвертации', fFolder, ssPath) then
  begin
    fFolderConvert := ssPath + '\';   // папка конвертации
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
    end
    else
    begin
      MessageBox(0, 'В выбранной папке нет видеофайлов', 'Обратите внимание', MB_OK + MB_ICONWARNING);

    end;
  end;
  System.SysUtils.FindClose(fFileRec);
end;

procedure TfrmKODI.spnbxSesonChange(Sender: TObject);
begin
 fSeson := spnbxSeson.Value;
 btnApply.Visible := True;
 flagSeson := True;
end;

// выбор номера сезона
procedure TfrmKODI.mniSesonClick(Sender: TObject);
begin
spnbxSeson.Visible := True;
txtSeson.Visible := True;
fSeson := spnbxSeson.Value;
end;

// сортировка файлов
procedure TfrmKODI.mniSortingClick(Sender: TObject);
var
  SesonArray: array of string;
  i: Integer;
begin
  SetLength(SesonArray, mmoFilmName.Lines.Count);
  for i := 0 to (mmoFilmName.Lines.Count - 1) do
    SesonArray[i] := mmoFilmName.Lines.Strings[i];
  BubbleStr(SesonArray);     // сортируем

     mmoFilmName.Lines.Clear;
   for i := 0 to (Length(SesonArray) - 1) do
     begin
       mmoFilmName.Lines.Add(sesonArray[i]);
     end;
  SesonArray := nil;
end;

// Конвертация
procedure TfrmKODI.mniConvertClick(Sender: TObject);
var
  i: Integer;
  epsNumber: string; // номер эпизода
  sNumber: string;   // номер сезона
begin
  delete(fExt, 1, 1);
  if sSeson < 10 then
    sNumber := 's0' + sSeson.ToString
  else
    sNumber := 's0' + sSeson.ToString;
// Коррекция начало серий
  for i := 1 to mmoFilmName.Lines.Count do
  begin
    OldFilePath := fFolderConvert + mmoFilmName.Lines.Strings[i - 1];
    if (i + fEditSer) < 10 then
      epsNumber := 'e0' + IntToStr(i + fEditSer)
    else
      epsNumber := 'e' + IntToStr(i + fEditSer);

    NewFile := sNumber + epsNumber + fExt;
    NewFilePath := fFolderConvert + sNumber + epsNumber + fExt;
    mmoFilmName.Lines.Strings[i - 1] := NewFile;
    RenameFile(OldFilePath, NewFilePath);
  end;
  fEditSer := 0;
end;

end.

