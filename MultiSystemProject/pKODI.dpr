program pKODI;

uses
  System.StartUpCopy,
  FMX.Forms,
  fKODI in 'fKODI.pas' {frmKODI},
  SortedBubble in 'SortedBubble.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmKODI, frmKODI);
  Application.Run;
end.
