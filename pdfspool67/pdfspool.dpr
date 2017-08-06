{===============================================================================
  Litera PDF Printer
  Copyright (c) 2000-2017 by Litera Corp. All rights reserved.

  Description:
  PDF Printer
===============================================================================}
program pdfspool;
uses
  SysUtils,
  Dialogs,
  Windows,
  Classes,
  pdsMain3 in 'pdsMain3.pas' {pdfMain},
  pdrWinExec in 'pdrWinExec.pas',
  pdsGs in 'pdsGs.pas',
  forms,
  jwscltoken,
  jwsclversion;

const
  IMAGE_DLLCHARACTERISTICS_TERMINAL_SERVER_AWARE = $8000;

{$SETPEOPTFLAGS IMAGE_DLLCHARACTERISTICS_TERMINAL_SERVER_AWARE}
{$R *.res}

begin
  Application.UpdateFormatSettings := false;
  Application.UpdateMetricSettings := false;
  Application.Initialize;
  Application.MainFormOnTaskBar := True;
  //
  pdfMain := TpdfMain.Create(nil);
  if bDisplay then
    pdfMain.ShowModal;
  pdfMain.Free;
end.

