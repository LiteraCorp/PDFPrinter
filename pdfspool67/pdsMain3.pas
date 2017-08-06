{===============================================================================
  Change-Pro Suite
  Copyright (c) July 2000-2017 by Litera Corp. All rights reserved.

  Description:
  PDF Printer Logic

// NOTE:
// YOU NEED TO DO FULL BUILD EVERTIME
===============================================================================}
unit pdsMain3;
interface
uses JwaWindows,
  JwsclPrivileges,
  Jwsclstrings,
  Jwscltypes,
  Windows,
  Messages,
  SysUtils,
  Variants,
  Classes,
  Graphics,
  Controls,
  Forms,
  Dialogs,
  ShlObj,
  StdCtrls,
  Menus,
  Registry,
  IniFiles,
  ComCtrls,
  ExtCtrls,
  ComObj,
  ActiveX,
  ShellApi,
  XPMan,
  pdsGs;

{$DEFINE DELFILE}
{$WARN SYMBOL_PLATFORM OFF}
{$B+}

const
  WM_FORCE = WM_USER + 1;
  WM_CHECK = WM_USER + 2;

type
  TpdfMain = class(TForm)
    cbGDateC: TCheckBox;
    cbGNoMeta: TCheckBox;
    cbRemovePwd: TCheckBox;
    cbSPass1: TCheckBox;
    cbSPass2: TCheckBox;
    cbT0: TListBox;
    cbT1: TComboBox;
    cbT2: TComboBox;
    cbT3: TComboBox;
    cbT4: TComboBox;
    cbT5: TComboBox;
    dlgSave: TSaveDialog;
    dtDate: TDateTimePicker;
    edtGAuthor: TComboBox;
    edtGCreator: TComboBox;
    edtGKey: TComboBox;
    edtGProducer: TComboBox;
    edtGSubject: TComboBox;
    edtGTitle: TComboBox;
    edtSPass1: TEdit;
    edtSPass2: TEdit;
    lblCreator: TLabel;
    lblGAuthor: TLabel;
    lblGKey: TLabel;
    lblGProducer: TLabel;
    lblGSubj: TLabel;
    lblGTitle: TLabel;
    lblInfo: TLabel;
    lblPage: TLabel;
    lblProgress: TLabel;
    lblVer: TLabel;
    lblVersion: TLabel;
    nb: TPageControl;
    nb0: TPageControl;
    pmDMS: TPopupMenu;
    pnlABottom: TPanel;
    pnlSS5: TPanel;
    SaveasNewProfile1: TMenuItem;
    SaveasNewVersion1: TMenuItem;
    ts1: TTabSheet;
    ts2: TTabSheet;
    tsGeneral: TTabSheet;
    tsSecurity: TTabSheet;
    XPManifest1: TXPManifest;
    btnSaveToDisk: TButton;
    btnClose: TButton;
    btnSaveToDesktop: TButton;
    btmSaveToMyDocs: TButton;
    btnEmail: TButton;
    pbar: TProgressBar;
    btnNow: TButton;
    btnGClearMetadata: TButton;
    btnClose4: TButton;
    dlgFolder: TSaveDialog;
    procedure btnClose4Click(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure btnGClearMetadataClick(Sender: TObject);
    procedure btnNowClick(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure cbGDateCClick(Sender: TObject);
    procedure cbSLowClick(Sender: TObject);
    procedure cbSPass1KeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure cbSPass2KeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure cbT0Click(Sender: TObject);
    procedure cbT0CloseUp(Sender: TObject);
    procedure cbT0DropDown(Sender: TObject);
    procedure cbT1CloseUp(Sender: TObject);
    procedure cbT1DropDown(Sender: TObject);
    procedure cbT2DropDown(Sender: TObject);
    procedure cbT3DropDown(Sender: TObject);
    procedure cbT4DropDown(Sender: TObject);
    procedure cbT5DropDown(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cbSPass2Click(Sender: TObject);
    procedure cbSPass1Click(Sender: TObject);
  protected
    procedure CreateParams(var Params: TCreateParams); override;
  private
    bDontSetSecurity: boolean;
    bExcel: boolean;
    bInCritical: boolean;
    bSilent: boolean;
    hGsSetting: TpdfPrintSetting;
    mStream: tMemoryStream;
    sCmd: string;
    sDrive: string; // CONSTANT
    sPdfUser: string;
    sTempAltX: string;
    //
    sDocName: string;
    sDskPath: string; // Desktop Path
    sMydPath: string; // My Documents Path
    sPdfFile: string; // PDF Filename
    sPdfPath: string; // PDF Path
    sPdfPath2: string; // Silent Path (RAW)
    sSilentPath: string;
    //
    function CreateFileFromStream(sFilePath: string;
      sOrgDocName: string): string;
    function ProcessXLS(sDocName, sPdfFile: string): boolean;
    procedure AnimateStart;
    procedure AnimateStop;
    procedure FileCbAdder(ab: TComboBox);
    procedure FileDel;
    procedure SetXLS(bSet: boolean);
    procedure ShowMessageX(sMessage: string);
    procedure UpdateHint;
    procedure WMFORCE(var m: TMessage); message WM_FORCE;
    procedure WMCHECK(var m: TMessage); message WM_CHECK;
    function FixHeight(iOrg: Integer): Integer;
    //
    procedure Silent0(bForce: boolean);
    procedure Silent1(bForce: boolean);
  end;

var
  pdfMain: TpdfMain;
  bDisplay: boolean;

implementation

uses
  cpsWinV,
  cpsVerInfo,
  JwsclSid,
  JwsclKnownSid,
  JwsclToken,
  pdrWinExec,
  cpsLotusOCX,
  Printers,
  WinSpool;

{$R *.dfm}

const
  ID_SAVE_TO_DISK = 10;
  ID_SAVE_TO_DMS = 11;
  ID_SAVE_TO_DESKTOP = 12;
  ID_SAVE_TO_MYDOC = 13;
  ID_SAVE_TO_EMAIL = 15;
  //
  ID_SAVE_TO_DMSNEWVER = 16;
  ID_SAVE_TO_DMSRELATED = 17;

function SaveNewProfileB(pFileName, pOrg, pMod: PWideChar; hwndPar: HWND;
  iCustom: Integer): Integer; stdcall;
var
  iNo: Integer;
begin
  iNo := ShellExecute(0, nil, PWideChar(Paramstr(0)),
    PWideChar('-R ' + pFileName), nil, SW_NORMAL);
  if iNo <> 0 then begin
  end;
  Result := iNo;
end;

procedure TpdfMain.CreateParams(var Params: TCreateParams);
begin
  inherited;
  Params.ExStyle := Params.ExStyle and not WS_EX_TOOLWINDOW or WS_EX_APPWINDOW;
end;

procedure TpdfMain.cbT0DropDown(Sender: TObject);
begin
  cbT0.Perform(CB_SETDROPPEDWIDTH, FixHeight(300), 0);
end;

procedure TpdfMain.cbT1CloseUp(Sender: TObject);
begin
  cbT0CloseUp(Sender);
end;

procedure TpdfMain.cbT1DropDown(Sender: TObject);
begin
  cbT1.Perform(CB_SETDROPPEDWIDTH, cbT1.Width + FixHeight(15), 0);
end;

procedure TpdfMain.cbT2DropDown(Sender: TObject);
begin
  cbT2.Perform(CB_SETDROPPEDWIDTH, cbT2.Width - 10, 0);
end;

procedure TpdfMain.cbT3DropDown(Sender: TObject);
begin
  cbT3.Perform(CB_SETDROPPEDWIDTH, cbT3.Width - 10, 0);
end;

procedure TpdfMain.cbT4DropDown(Sender: TObject);
begin
  cbT4.Perform(CB_SETDROPPEDWIDTH, cbT4.Width - 10, 0);
end;

procedure TpdfMain.cbT5DropDown(Sender: TObject);
begin
  cbT5.Perform(CB_SETDROPPEDWIDTH, FixHeight(350), 0);
end;

procedure TpdfMain.btnNowClick(Sender: TObject);
begin
  dtDate.DateTime := Now;
end;

procedure TpdfMain.ShowMessageX(sMessage: string);
begin
  nb0.ActivePageIndex := 1;
  lblInfo.Caption := sMessage;
end;

procedure TpdfMain.btnClose4Click(Sender: TObject);
begin
  btnCloseClick(Sender);
end;

procedure TpdfMain.btnCloseClick(Sender: TObject);
begin
  try
    FileDel;
  except
  end;
  SetXLS(False);
  Close;
end;

procedure TpdfMain.UpdateHint;
begin
  if (hGsSetting.bDefaultDir) then begin
    btnSaveToDisk.Hint := 'Default Directory: ' + hGsSetting.sDefaultDir;
  end else begin
    btnSaveToDisk.Hint := 'Last Directory: ' + hGsSetting.sDefaultDir;
  end;
end;

function TpdfMain.FixHeight(iOrg: Integer): Integer;
begin
  Result := Round(iOrg * (Screen.PixelsPerInch / 92));
end;

procedure TpdfMain.WMFORCE(var m: TMessage);
begin
  if (ReadVar('CLIENTNAME') = '') then begin
    BringToFront;
  end else begin
    DSiForceForegroundWindow(Handle);
  end;
end;

procedure TpdfMain.WMCHECK(var m: TMessage);
begin
  ClearKeyBoardBuffer(Handle);
  Application.ProcessMessages;
  Application.ProcessMessages;
  Application.ProcessMessages;
  Application.ProcessMessages;
  Application.ProcessMessages;
  Application.ProcessMessages;
  Application.ProcessMessages;
  Application.ProcessMessages;
  Application.ProcessMessages;
  Application.ProcessMessages;
  Application.ProcessMessages;
  Application.ProcessMessages;
  cbT0CloseUp(nil);
end;

procedure TpdfMain.FormShow(Sender: TObject);
begin
  PostMessage(Handle, WM_FORCE, 0, 0);
end;

procedure TpdfMain.AnimateStart;
begin
  if Assigned(pbar) then begin
    pbar.StepIt;
  end;
end;

procedure TpdfMain.AnimateStop;
begin
  if Assigned(pbar) then begin
    pbar.Position := 100;
  end;
end;

procedure TpdfMain.cbGDateCClick(Sender: TObject);
begin
  dtDate.Enabled := cbGDateC.Checked;
  if cbGDateC.Checked then begin
    dtDate.Color := clWindow;
  end else begin
    dtDate.Color := clBtnFace;
  end;
  btnNow.Enabled := cbGDateC.Checked;
end;

procedure TpdfMain.cbSLowClick(Sender: TObject);
begin
  if bInCritical then begin
  end else begin
    bInCritical := True;
    bInCritical := False;
  end;
end;

procedure TpdfMain.cbSPass1KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = 9 then begin
  end else begin
    // PostMessage(Handle, WM_CHECK, 0, 0);
  end;
end;

procedure TpdfMain.cbSPass1Click(Sender: TObject);
begin
  edtSPass1.Enabled := cbSPass1.Checked;
  if edtSPass1.Enabled then begin
    edtSPass1.Color := clWindow;
  end else begin
    edtSPass1.Color := clBtnFace;
  end;
end;

procedure TpdfMain.cbSPass2Click(Sender: TObject);
begin
  edtSPass2.Enabled := cbSPass2.Checked;
  if edtSPass2.Enabled then begin
    edtSPass2.Color := clWindow;
  end else begin
    edtSPass2.Color := clBtnFace;
  end;
end;

procedure TpdfMain.cbSPass2KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = 9 then begin
  end else begin
    // PostMessage(Handle, WM_CHECK, 0, 0);
  end;
end;

procedure TpdfMain.cbT0Click(Sender: TObject);
begin
  cbT0CloseUp(Sender);
end;

// var
// bInCritical: boolean;

procedure TpdfMain.cbT0CloseUp(Sender: TObject);

  procedure FixEdit(a: TWinControl);
  begin
    if a.ClassType = TEdit then begin
      if a.Enabled then begin
        TEdit(a).Color := clWindow;
      end else begin
        TEdit(a).Color := clBtnFace;
      end;
    end;
    if a.ClassType = TComboBox then begin
      if a.Enabled then begin
        TComboBox(a).Color := clWindow;
      end else begin
        TComboBox(a).Color := clBtnFace;
      end;
    end;
  end;

begin
  if bInCritical then
    exit;

  bInCritical := True;
  edtSPass1.Enabled := cbSPass1.Checked;
  edtSPass2.Enabled := cbSPass2.Checked;
  //
  cbSPass1.Enabled := True;
  cbSPass2.Enabled := True;
  cbSPass1.Visible := True;
  cbSPass2.Visible := True;
  edtSPass1.Enabled := True;
  edtSPass2.Enabled := True;
  edtSPass1.Visible := True;
  edtSPass2.Visible := True;

  edtGTitle.Enabled := cbT0.ItemIndex = 0;
  edtGAuthor.Enabled := cbT0.ItemIndex = 0;
  edtGSubject.Enabled := cbT0.ItemIndex = 0;
  edtGKey.Enabled := cbT0.ItemIndex = 0;
  dtDate.Enabled := cbT0.ItemIndex = 0;
  btnNow.Enabled := cbT0.ItemIndex = 0;
  cbGDateC.Enabled := cbT0.ItemIndex = 0;
  edtGProducer.Enabled := cbT0.ItemIndex = 0;
  edtGCreator.Enabled := cbT0.ItemIndex = 0;
  btnGClearMetadata.Enabled := cbT0.ItemIndex = 0;

  FixEdit(edtGTitle);
  FixEdit(edtGAuthor); //.Enabled := false//cbT0.ItemIndex = 0;
  FixEdit(edtGSubject); //.Enabled := false//cbT0.ItemIndex = 0;
  FixEdit(edtGKey); //.Enabled := false//cbT0.ItemIndex = 0;
  FixEdit(dtDate); //.Enabled := false//cbT0.ItemIndex = 0;
  FixEdit(cbGDateC); //.Enabled := false//cbT0.ItemIndex = 0;
  FixEdit(edtGProducer); //.Enabled := false//cbT0.ItemIndex = 0;
  FixEdit(edtGCreator); //.Enabled := false//cbT0.ItemIndex = 0;

  if cbT0.ItemIndex = 0 then begin
    cbT1.Enabled := True;
    cbT2.Enabled := True;
    cbT3.Enabled := True;
    cbT4.Enabled := True;
    cbT5.Enabled := True;
    cbSPass1.Enabled := True;
    cbSPass2.Enabled := True;
    cbSPass2.Checked := False;
    cbSPass1.Checked := False;

    //cbRemovePwd.Visible := True;
    if cbT1.ItemIndex = 0 then begin
      cbT2.Enabled := False;
      cbT3.Enabled := False;
      cbT4.Enabled := False;
      cbT5.Enabled := False;

      cbSPass1.Enabled := False;
      cbSPass2.Enabled := False;
      edtSPass1.Enabled := False;
      edtSPass2.Enabled := False;

      lblPage.Caption := 'Page Extraction: Allowed';
    end;
    if cbT1.ItemIndex = 1 then begin
      cbT2.Enabled := True;
      cbT3.Enabled := True;
      cbT4.Enabled := True;
      cbT5.Enabled := True;
      cbSPass1.Enabled := True;
      cbSPass2.Enabled := True;
      edtSPass1.Enabled := True;
      edtSPass2.Enabled := True;
      lblPage.Caption := 'Page Extraction: Not Allowed';
      edtSPass1.Enabled := cbSPass1.Checked;
      edtSPass2.Enabled := cbSPass2.Checked;

      cbSPass2.Checked := True;

      if cbSPass1.Checked then begin
        edtSPass1.Enabled := True;
      end;
      if cbSPass2.Checked then begin
        edtSPass2.Enabled := True;
      end;
    end;
    if cbT1.ItemIndex = 2 then begin
      cbT2.Enabled := True;
      cbT3.Enabled := True;
      cbT4.Enabled := True;
      cbT5.Enabled := True;
      cbSPass1.Enabled := True;
      cbSPass2.Enabled := True;
      edtSPass1.Enabled := True;
      edtSPass2.Enabled := True;
      lblPage.Caption := 'Page Extraction: Not Allowed';
      edtSPass1.Enabled := cbSPass1.Checked;
      edtSPass2.Enabled := cbSPass2.Checked;
      cbSPass2.Checked := False;
      cbSPass1.Checked := True;
      cbT2.Enabled := False;
      cbT2.ItemIndex := 2; // High Res Printing
      cbT3.Enabled := False;
      cbT3.ItemIndex := 1; //
      cbT4.Enabled := False;
      cbT4.ItemIndex := 2;
      cbT5.Enabled := False;
      cbT5.ItemIndex := 3;
      if cbSPass1.Checked then begin
        edtSPass1.Enabled := True;
      end;
      if cbSPass2.Checked then begin
        edtSPass2.Enabled := True;
      end;
      cbSPass2.Visible := False;
      edtSPass2.Visible := False;
      cbSPass1.Checked := false;
      cbSPass2.Checked := false;
    end;
  end;
  if cbT0.ItemIndex = 1 then begin
    cbT1.ItemIndex := 0;
    cbT1.Enabled := False;
    cbT2.Enabled := False;
    cbT3.Enabled := False;
    cbT4.Enabled := False;
    cbT5.Enabled := False;
    cbSPass1.Enabled := False;
    cbSPass2.Enabled := False;
    edtSPass1.Enabled := False;
    edtSPass2.Enabled := False;
    lblPage.Caption := 'Page Extraction: Unavailable';
    //
    edtSPass1.Enabled := false;
    edtSPass2.Enabled := false;
    cbSPass1.Checked := false;
    cbSPass2.Checked := false;

  end;
  if cbT0.ItemIndex = 2 then begin
    cbT1.ItemIndex := 0;
    cbT1.Enabled := False;
    cbT2.Enabled := False;
    cbT3.Enabled := False;
    cbT4.Enabled := False;
    cbT5.Enabled := False;
    cbSPass1.Enabled := False;
    cbSPass2.Enabled := False;
    edtSPass1.Enabled := False;
    edtSPass2.Enabled := False;
    lblPage.Caption := 'PDF/A: No security will be applied';

    edtSPass1.Enabled := false;
    edtSPass2.Enabled := false;
    cbSPass1.Checked := false;
    cbSPass2.Checked := false;

  end;
  cbSPass1Click(Sender);
  cbSPass2Click(Sender);

  bInCritical := False;
end;

procedure TpdfMain.btnGClearMetadataClick(Sender: TObject);
begin
  edtGTitle.Text := '';
  edtGSubject.Text := '';
  cbGDateC.Checked := False;
  dtDate.Enabled := cbGDateC.Enabled;
  dtDate.Date := Now;
  cbGDateCClick(Sender);
  edtGKey.Text := '';
  edtGAuthor.Text := '';
  edtGProducer.Text := '';
  edtGCreator.Text := '';
end;

procedure TpdfMain.FileCbAdder(ab: TComboBox);

function lpFind(x: TStrings; sName: string): Integer;
  var
    iResult: Integer;
    iTemp: Integer;
  begin
    iResult := -1;
    for iTemp := 0 to (x.Count - 1) do begin
      if x.Strings[iTemp] = sName then begin
        iResult := iTemp;
        Break;
      end;
    end;
    Result := iResult;
  end;

var
  iResult: Integer;
  iNos: Integer;
  sTemp: string;
begin
  if ab.Text = '' then begin
    exit;
  end;
  iResult := lpFind(ab.Items, ab.Text);
  if iResult = -1 then begin
    iNos := ab.Items.Add(ab.Text);
    ab.Items.Move(iNos, 0);
  end else begin
    sTemp := ab.Text;
    ab.Items.Delete(iResult);
    if ab.Items.Count >= 15 then begin
      for iNos := (ab.Items.Count - 1) downto 15 do begin
        ab.Items.Delete(iNos);
      end;
    end;
    ab.Items.Insert(0, sTemp);
    ab.Text := sTemp;
  end;
end;

procedure TpdfMain.SetXLS(bSet: boolean);
var
  reg: TRegistry;
  isSystem: boolean;
  sUser: string;
begin
  sUser := GetUserA(isSystem);
  if isSystem = False then begin
    reg := TRegistry.Create(KEY_READ or KEY_WRITE);
    if reg.OpenKey('Software\Litera2\PDF Maker2\', True) then begin
      reg.WriteBool('xls', bSet);
    end;
    reg.Free;
  end;
end;

// ==============================================================================
// Forms
// ==============================================================================
const
  STREAMSIZE = 1048576;
  STREAMSIZ2 = STREAMSIZE - 8;

var
  arr: array[0..STREAMSIZE] of Byte;

procedure TpdfMain.FormCreate(Sender: TObject);

  procedure InitCaption;
  begin
    try
      Application.Title := cpy_FormCaptionPD;
      Caption := cpy_FormCaptionPD;
      lblVer.Caption := csGlobalVerInfo.GetVersionDigits(False);
    except
    end;
  end;

  procedure InitDLL;
  begin
    try
      nb.ActivePageIndex := 0;

      cbT0.Items.Delete(3); // delete the TIFF part
      cbT0.Items.Delete(1); // delete the PNG part

      bInCritical := False;
      try
        LoadProfileA;
      except
      end;
      hGsSetting := TpdfPrintSetting.Create;
      hGsSetting.bPDFMainAnimateStart := AnimateStart;
      hGsSetting.bPDFMainAnimateStop := AnimateStop;
      hGsSetting.LoadSaveFromRegistry(False, sDrive);
      // == Security Stuff ========================================================
      cbT0.ItemIndex := hGsSetting.bPdfOrTifforPNG;
      cbT1.ItemIndex := hGsSetting.pass_iT1;
      cbT2.ItemIndex := hGsSetting.pass_iT2;
      cbT3.ItemIndex := hGsSetting.pass_iT3;
      cbT4.ItemIndex := hGsSetting.pass_iT4;
      cbT5.ItemIndex := hGsSetting.pass_iT5;
      edtSPass1.Text := hGsSetting.pass_sOwner;
      edtSPass2.Text := hGsSetting.pass_sUser;
      cbSPass1.Checked := hGsSetting.pass_bPass1;
      cbSPass2.Checked := hGsSetting.pass_bPass2;
      if hGsSetting.desktophide then begin
        btnSaveToDesktop.Visible := False;
      end;
      sTempAltX := trim(hGsSetting.sTempDir);
      if sTempAltX <> '' then begin
        sTempAltX := SetAddSlash(sTempAltX);
      end;
      // == Meta Stuff ============================================================
      cbGDateC.Checked := hGsSetting.meta_bDateCreate;
      cbGDateCClick(nil);
      dtDate.DateTime := Now;
      edtGProducer.Text := hGsSetting.meta_sProducer;
      edtGCreator.Text := hGsSetting.meta_sCreator;
      cbGNoMeta.Checked := hGsSetting.meta_bNoMeta;
      edtGTitle.Items.Text := hGsSetting.list_Title.Text;
      edtGSubject.Items.Text := hGsSetting.list_Subject.Text;
      edtGKey.Items.Text := hGsSetting.list_Keywords.Text;
      edtGAuthor.Items.Text := hGsSetting.list_Author.Text;
      edtGProducer.Items.Text := hGsSetting.list_Producer.Text;
      edtGCreator.Items.Text := hGsSetting.list_Creator.Text;
    except
    end;
  end;

var
  iHandle: Integer;
  hStream: THandleStream;
  iRet: Integer;

  sTempB: string;
  sParam: string;
  SessionID, ProcessID, ProcessID2, hToken, hToken2: Cardinal;
  sHx: TpdfPrintSetting;
  sTemp: string;
  aVer: TDSiWindowsVersion;
  bIsSys: boolean;
  bResult: boolean;
  sExt2, sExt2Msg: string;
begin
  cbRemovePwd.Visible := false;

  InitDLL;

  nb.TabWidth := ((nb.Width - 10) div 2);
  nb0.TabWidth := ((nb0.Width - 10) div 2);
  //
  nb0.ActivePageIndex := 0;
  bSilent := False;
  bDisplay := True;
  bDontSetSecurity := False;
  mStream := tMemoryStream.Create;
  //
  sDocName := (ReadVar('REDMON_FILENAME'));
  sPdfUser := WideLowerCase(ReadVar('REDMON_USER'));
  sDskPath := GetQuickAppPath(CSIDL_DESKTOP);
  sMydPath := GetQuickAppPath(CSIDL_PERSONAL);
  if sPdfUser = '' then begin
    sPdfUser := GetUserA(bIsSys);
  end;
  //
  sCmd := trim(ParseCmd());
  if trim(sDocName) = '' then begin
    sDocName := ((ReadVar('REDMON_DOCNAME')));
  end;
  sDrive := ReadVar('HOMEDRIVE');

  try
    sHx := TpdfPrintSetting.Create;
    sHx.bPDFMainAnimateStart := AnimateStart;
    sHx.bPDFMainAnimateStop := AnimateStop;
    sHx.LoadSaveFromRegistry(False, sDrive);
    sTempAltX := SetAddSlash(sHx.sTempDir);
    sHx.Destroy;
  except
  end;
  if (pos('system', sDskPath) >= 1) or (pos('systemprofile', sDskPath) >= 1) then begin
    sTemp := cpAddSlashW(GetProfileDirCP());
    if DirectoryExists(sTemp) then begin
      sDskPath := cpAddSlashW(GetProfileDirCP()) + 'desktop\';
      sMydPath := cpAddSlashW(GetProfileDirCP()) + 'my documents\';
    end;
  end;
  // Default - used by 95%
  sPdfPath := cpAddSlashW(GetProfileDirCP()) + 'Local Settings\temp\';
  sPdfPath2 := sPdfPath;
  //
  if sTempAltX = '' then begin
    if DirectoryExists(sPdfPath) then begin
      // this is a Windows 7 machine
      aVer := DSiGetTrueWindowsVersion;
      if aVer >= wvWinVista then begin
        sPdfPath := cpAddSlashW(GetProfileDirCP()) +
          'AppData\Local\temp\';
        sPdfPath2 := sPdfPath;
      end;
    end;

    if DirectoryExists(sPdfPath) = False then begin
      sPdfPath := cpAddSlashW(GetProfileDirCP()) + GetLastBit + 'Temp\';
      sPdfPath2 := sPdfPath;
    end;
    if DirectoryExists(sPdfPath) = False then begin
      sPdfPath := cpAddSlashW(GetProfileDirCP()) + GetLastBit +
        'Litera\';
      sPdfPath2 := sPdfPath;
    end;
    if DirectoryExists(sPdfPath) = False then begin
      sPdfPath := cpAddSlashW(GetProfileDirCP()) + GetLastBit;
      sPdfPath2 := sPdfPath;
    end;
    if DirectoryExists(sPdfPath) = False then begin
      sPdfPath := cpAddSlashW(GetProfileDirCP());
      sPdfPath2 := sPdfPath;
    end;
    if DirectoryExists(sPdfPath) = False then begin
      sPdfPath := GetQuickAppPath(CSIDL_LOCAL_APPDATA);
      sPdfPath2 := sPdfPath;
    end;
  end else begin
    if DirectoryExists(sTempAltX) then begin
      sPdfPath := SetAddSlash(sTempAltX);
    end;
  end;

  try
    btnEmail.Visible := False;
    btnClose.Height := Trunc(54 * (Screen.PixelsPerInch / 96));
    pnlABottom.Height := Trunc(60 * (Screen.PixelsPerInch / 96));
    Height := Trunc(519 * (Screen.PixelsPerInch / 96)); // 519; // 442;
  except Height := Trunc(519 * (Screen.PixelsPerInch / 96)); // 519; // 442;
  end;

  InitCaption;
  cbT0CloseUp(Sender);
  UpdateHint;

  if (WideLowerCase(trim(sCmd)) = '-pdf') then begin
    iHandle := GetStdHandle(STD_INPUT_HANDLE);
    hStream := THandleStream.Create(iHandle);
    //
    repeat
      iRet := hStream.Read(arr, STREAMSIZ2);
      mStream.Write(arr, iRet);
    until iRet = 0;

    sPdfFile := CreateFileFromStream(sPdfPath, sDocName);
    hStream.Destroy;

    SessionID := 0;
    ProcessID := 0;
    hToken := 0;
    hToken2 := 0;

    bResult := CreateWinNTProcessList(sPdfUser, SessionID, ProcessID,
      ProcessID2, hToken, hToken2);

    if (bResult = False) then begin
      CreateWinNTProcessList2(sPdfUser, SessionID);
    end;
    //
    Silent0(False);
    Silent1(False);

    if bSilent then begin
      sParam := '-E' + sPdfFile + '$$$$' + sSilentPath + '####1' + sDocName;
    end else begin
      sParam := '-E' + sPdfFile + '$$$$' + sSilentPath + '####0' + sDocName;
    end;
    try
      RunAsUser(Paramstr(0), sParam, SessionID, ProcessID, ProcessID2, hToken,
        hToken2, sPdfUser);
    except
      on E: Exception do begin
      end;
    end;
    bDisplay := False;
    Application.Terminate;
    exit;
  end;

  // -R
  if Length(sCmd) >= 1 then begin
    if ((sCmd[1] = '-') and (sCmd[2] = 'R')) then begin
      System.Delete(sCmd, 1, 2);
      sCmd := trim(sCmd);

      sExt2 := ExtractFileExt(sCmd);

      sExt2Msg := 'PDF File';
      if (WideLowerCase(sExt2) = '.png') then begin
        sExt2Msg := 'PNG File';
      end;
      if (WideLowerCase(sExt2) = '.tiff') then begin
        sExt2Msg := 'TIFF File';
      end;

      HandleNeeded;
      BringToFront;
    end;
    if ((sCmd[1] = '-') and (sCmd[2] = 'E')) then begin

      //
      sPdfFile := sCmd;
      if pos('$$$$', sPdfFile) >= 1 then begin
        sSilentPath := Copy(sPdfFile, pos('$$$$', sPdfFile) + 4,
          Length(sPdfFile));
        System.Delete(sPdfFile, pos('$$$$', sPdfFile), Length(sPdfFile));
      end;
      if pos('####', sSilentPath) >= 1 then begin
        sTempB := Copy(sSilentPath, pos('####', sSilentPath) + 4,
          Length(sSilentPath));

        if (Length(sTempB) >= 2) then begin
          System.Delete(sTempB, 2, Length(sTempB));
        end;
        if sTempB = '1' then
          bSilent := True;

        System.Delete(sSilentPath, pos('####', sSilentPath),
          Length('####X') + 9999999);
      end;
      System.Delete(sPdfFile, 1, 2);
      if pos('^^^^', sSilentPath) >= 1 then begin
        System.Delete(sSilentPath, pos('^^^^', sSilentPath),
          Length(sSilentPath));
        sDocName := sSilentPath;
      end;
      //
      Silent0(false); // read again just in case...
      Silent1(false); // read again just in case...
    end;

    if ProcessXLS(sDocName, sPdfFile) then begin
      SetXLS(True);
      if FileExists(sPdfFile) then begin
        sTempB := sPdfPath + ExtractFilename(sPdfFile);
        if (MoveFile(PWideChar(sPdfFile), PWideChar(sTempB))) then begin
          sPdfFile := sTempB;
        end;
      end;
      //
      bExcel := True;
      bDisplay := False;
      Application.Terminate;
    end else begin
      Silent0(true); // read again just in case...
      Silent1(true); // read again just in case...

      if bSilent then begin
        if FileExists(sPdfFile) then begin
          sTempB := sPdfPath + ExtractFilename(sPdfFile);
          if (MoveFile(PWideChar(sPdfFile), PWideChar(sTempB))) then begin
            sPdfFile := sTempB;
          end;
        end;
        //
        btnOKClick(nil);
        bDisplay := False;
        SetXLS(False);
        //
        FileDel;
        Application.Terminate;
      end;
    end;

  end;
end;

// ==============================================================================
// XLS
// ==============================================================================

function TpdfMain.ProcessXLS(sDocName, sPdfFile: string): boolean;
var
  sUser: string;
  isSystem: boolean;

  function PdfQuery(sData: string): boolean;

    function GetCurrentPrinterHandle: THandle;
    var
      Device: array[0..255] of char;
    begin
      Device := 'PDF Printer';
      OpenPrinter(@Device, Result, nil);
    end;

  type
    TJobs = array[0..1000] of JOB_INFO_1;
    PJobs = ^TJobs;
  var
    hPrinter: THandle;
    bytesNeeded, numJobs: Cardinal;
    pJ: PJobs;
    sNo: string;
    sName: string;
  begin
    sName := ExtractFilename(Paramstr(0));
    hPrinter := GetCurrentPrinterHandle;
    Result := False;
    try
      EnumJobs(hPrinter, 0, 1000, 1, nil, 0, bytesNeeded, numJobs);
      pJ := AllocMem(bytesNeeded);
      EnumJobs(hPrinter, 0, 1000, 1, pJ, bytesNeeded, bytesNeeded, numJobs);

      sUser := GetUserA(isSystem);

      if numJobs >= 2 then begin
        sNo := pJ^[1].pDocument;
        sNo := DocNameFilter(sNo);
        if WideLowerCase(sNo) = WideLowerCase(DocNameFilter(sData)) then begin
          Result := True;
        end else begin
        end;
      end else begin
        if numJobs = 1 then begin
          sNo := pJ^[0].pDocument;
          sNo := DocNameFilter(sNo);
          if WideLowerCase(sNo) = WideLowerCase(DocNameFilter(sData)) then begin
            Result := False;
          end else begin
          end;
        end;
      end;
      if isSystem = False then begin
      end;
      if (Result = False) then
        Result := IsTaskRunningTwice(sName);
    finally ClosePrinter(hPrinter);
    end;
  end;

var
  bConcat: boolean;
  iNo: Integer;
begin
  bConcat := False;

  if (pos('.xls', sDocName) >= 1) or (pos('.xlsx', sDocName) >= 1) or
    (pos('.xlt', sDocName) >= 1) then begin
    bConcat := True;
  end;
  if DirectoryExists(ExtractFileDir(sDocName)) = True then begin
    sDocName := (ExtractFilename(sDocName));
  end;
  if Length(sDocName) >= 70 then begin
    sDocName := (DocNameFilter(sDocName));
  end;

  Result := False;

  if bConcat then begin
    iNo := 0;
    repeat
      Result := PdfQuery(sDocName);
      if Result = False then begin
        Result := PdfQuery(sDocName);
        Sleep(250);
      end;
      Inc(iNo);
    until (Result = True) or (iNo >= 5);
  end;
end;

procedure TpdfMain.FormDestroy(Sender: TObject);
begin
  if (not Assigned(hGsSetting)) then
    exit;
  // Security ==================================================================
  hGsSetting.pass_iT1 := cbT1.ItemIndex;
  hGsSetting.pass_iT2 := cbT2.ItemIndex;
  hGsSetting.pass_iT3 := cbT3.ItemIndex;
  hGsSetting.pass_iT4 := cbT4.ItemIndex;
  hGsSetting.pass_iT5 := cbT5.ItemIndex;
  hGsSetting.pass_sOwner := edtSPass1.Text;
  hGsSetting.pass_sUser := edtSPass2.Text;
  hGsSetting.pass_bPass1 := cbSPass1.Checked;
  hGsSetting.pass_bPass2 := cbSPass2.Checked;

  hGsSetting.slug := false;
  // Metadata ==================================================================
  hGsSetting.meta_bDateCreate := cbGDateC.Checked;
  hGsSetting.meta_sProducer := edtGProducer.Text;
  hGsSetting.meta_bDateCreate2 := dtDate.DateTime;
  hGsSetting.meta_sCreator := edtGCreator.Text;
  hGsSetting.meta_bGLoadAdobe := False;
  hGsSetting.meta_bNoMeta := cbGNoMeta.Checked;
  // == Meta MRU-Stuff-Adder
  FileCbAdder(edtGTitle);
  FileCbAdder(edtGSubject);
  FileCbAdder(edtGKey);
  FileCbAdder(edtGAuthor);
  FileCbAdder(edtGProducer);
  FileCbAdder(edtGCreator);
  // == Meta MRU-Stuff
  hGsSetting.list_Title.Text := edtGTitle.Items.Text;
  hGsSetting.list_Subject.Text := edtGSubject.Items.Text;
  hGsSetting.list_Keywords.Text := edtGKey.Items.Text;
  hGsSetting.list_Author.Text := edtGAuthor.Items.Text;
  hGsSetting.list_Producer.Text := edtGProducer.Items.Text;
  hGsSetting.list_Creator.Text := edtGCreator.Items.Text;
  // == Saver
  hGsSetting.LoadSaveFromRegistry(True, sDrive);
  hGsSetting.Destroy;
  try
    mStream.Destroy;
  except
  end;
end;

// ==============================================================================
// User Interface
// ==============================================================================

procedure TpdfMain.Silent1(bForce: boolean);
var
  ini: tinifile;
  sSilentPath2: string;
  stemp2: string;
begin
  sPdfPath2 := cpAddSlashW(GetProfileDirCP) +
    cpAddSlashW(GetLastBit) + 'Litera\temp\SilentPrint.ini';
  if FileExists(sPdfPath2) then begin
    sSilentPath := '';
    ini := tinifile.Create(sPdfPath2);
    sSilentPath2 := ini.ReadString('SilentPrint', 'SilentPrintOutPath', '');
    sSilentPath2 := trim(sSilentPath2);
    if sSilentPath2 <> '' then begin
      sSilentPath := sSilentPath2;
    end;
    hGsSetting.bPdfOrTifforPNG := 0;
    stemp2 := ini.ReadString('SilentPrint', 'SilentPrintType', '');
    if (stemp2 = '1') then begin
      hGsSetting.bPdfOrTifforPNG := 1;
    end;
    if (stemp2 = '2') then begin
      hGsSetting.bPdfOrTifforPNG := 2;
    end;
    cbT0.ItemIndex := hGsSetting.bPdfOrTifforPNG;
    stemp2 := ini.ReadString('SilentPrint', 'Security', '1');
    if (stemp2 = '1') then begin
      bDontSetSecurity := True;
    end;

    ini.Free;

    if bForce then begin
      DeleteFile(PChar(sPdfPath2));
    end;
    bSilent := True;
  end;
end;

procedure TpdfMain.Silent0(bForce: boolean);
var
  reg: TRegistry;
  stemp2: string;
  SID: TJwSecurityID;
  sReg2: string;
  bSilent2: boolean;
begin
  try
    SID := JwSecurityCurrentThreadUserSID;
    stemp2 := SID.StringSID;
    SID.Free;
  except
  end;

  reg := TRegistry.Create(KEY_READ or KEY_WRITE);
  reg.RootKey := HKEY_USERS;
  sReg2 := '\' + stemp2 + '\' + sRegCPPRN;
  
  if reg.OpenKey(sReg2, False) then begin
    // sSilentPath := '';

    bSilent2 := false;
    if reg.ValueExists(sRegCPPRN_Silent) then begin
      bSilent2 := boolean(reg.ReadInteger(sRegCPPRN_Silent));
    end;

    if bSilent2 then begin
      if reg.ValueExists(sRegCPPRN_SilentType) then begin
        hGsSetting.bPdfOrTifforPNG := reg.ReadInteger(sRegCPPRN_SilentType);
        if Assigned(cbT0) then begin
          cbT0.ItemIndex := hGsSetting.bPdfOrTifforPNG;
        end;
      end;
      if reg.ValueExists(sRegCPPRN_SilentPath) then begin
        sSilentPath := reg.ReadString(sRegCPPRN_SilentPath);
      end;
      if bForce then begin
        if reg.ValueExists('DontSetSecurity') then begin
          bDontSetSecurity := reg.ReadBool('DontSetSecurity');
          reg.WriteBool('DontSetSecurity', False);
        end;
        if reg.ValueExists(sRegCPPRN_SilentType) then begin
          reg.DeleteValue(sRegCPPRN_SilentType);
        end;
        reg.WriteInteger(sRegCPPRN_Silent, 0);
      end;
      bSilent := True;
    end;
    reg.Destroy;
  end;
end;

procedure TpdfMain.FileDel;

procedure EraseFiles(files: string);
  var
    x: Integer;
    dir: string;
    sr: TSearchRec;
    dtOut: TDateTime;
  begin
    dir := SetAddSlash(ExtractFilePath(files));
    x := FindFirst(files, faAnyfile, sr);
    while x = 0 do begin
      try
        if sr.Attr = faDirectory then begin
        end else begin
          dtOut := FileDateToDateTime(sr.Time);
          if ((dtOut) <= (Now - 0.5)) then begin
            FileSetAttr(dir + sr.Name, 0);
            FileSetAttr(dir + sr.Name, 0);
            DeleteFile(dir + sr.Name);
          end;
        end;
      except
      end;
      x := FindNext(sr);
    end;
    SysUtils.FindClose(sr);
  end;

var
  sPath1: string;
begin
  if FileExists(sPdfFile) then begin
    DeleteFile(sPdfFile);
  end;

  sPath1 := ChangeFileExt(sPdfFile, '.pdf');
  if FileExists(sPath1) then begin
  end;

  sPath1 := sTempAltX;
  sPath1 := SetAddSlash(sPath1);
  if DirectoryExists(sPath1) then begin
  end;
end;

function TpdfMain.CreateFileFromStream(sFilePath: string;
  sOrgDocName: string): string;
var
  aStr: tMemoryStream;
begin
  if sTempAltX = '' then begin
    sFilePath := GetTempFile3(ExtractFilePath(sFilePath), '.ph1');
  end else begin
    sFilePath := sTempAltX + ExtractFilename
      (GetTempFile3(ExtractFilePath(sFilePath), '.ph1'));
  end;

  if (pos('.xls', sOrgDocName) >= 1) or (pos('.xlt', sOrgDocName) >= 1) then begin
    sFilePath := ExtractFilePath(sFilePath) +
      ExtractFilename(GetTempFile(sDocName, '.ph1'));
            //
    mStream.Position := 0;
    if FileExists(sFilePath) then begin
      aStr := tMemoryStream.Create;
      aStr.LoadFromFile(sFilePath);
      // the -6 is the PDF end.
      if aStr.Size >= 7 then
        aStr.Seek(aStr.Size - 6, 0);
      if mStream.Size >= 7 then
        aStr.CopyFrom(mStream, mStream.Size - 6)
      else
        aStr.CopyFrom(mStream, mStream.Size);
      aStr.SaveToFile(sFilePath);
      aStr.Free;
    end else begin
      mStream.SaveToFile(sFilePath);
    end;
  end else begin
    mStream.SaveToFile(sFilePath);
  end;
  //
  Result := sFilePath;
end;

procedure TpdfMain.btnOKClick(Sender: TObject);

var
  iTag: Integer;
  sCmdPdf: string;
  sFile: string;
  oSession: NOTESSESSION;
  oDb: NOTESDATABASE;
  oDb2: NOTESDATABASE;
  oDoc: NOTESDOCUMENT;
  oMailServer: OleVariant;
  oMailFile: OleVariant;
  oAttachment: NOTESRICHTEXTITEM;
  oUIWorkSpace: NOTESUIWORKSPACE;
  bNotes: boolean;
  hNotes: Integer;
  oRet: OleVariant;
  sOutPdf: string;
  sTempFileNameForSave: string;
  sTempTiffCopy: string;
  sDat: string;
  bRes: boolean;
begin
  iTag := 0;
  if Assigned(Sender) then begin
    if Sender.ClassType = TButton then begin
      iTag := TButton(Sender).Tag;
    end;
    if Sender.ClassType = TMenuItem then begin
      iTag := TMenuItem(Sender).Tag;
    end;
  end else begin
    iTag := ID_SAVE_TO_DISK;
  end;
  if bSilent then begin
    // ==========================================================================
    // SILENT MODE
    // ==========================================================================
    if bDontSetSecurity then begin
      cbT1.ItemIndex := 0;
      cbT2.ItemIndex := 0;
      cbT3.ItemIndex := 0;
      cbT4.ItemIndex := 0;
      cbT5.ItemIndex := 0;
      edtSPass1.Text := '';
      edtSPass2.Text := '';
      cbSPass1.Checked := False;
      cbSPass2.Checked := False;
    end;
    // hGsSetting.iGRotate := edtGAuto.ItemIndex;
    // == Metadata Settings =====================================================
    hGsSetting.pass_iT1 := cbT1.ItemIndex;
    hGsSetting.pass_iT2 := cbT2.ItemIndex;
    hGsSetting.pass_iT3 := cbT3.ItemIndex;
    hGsSetting.pass_iT4 := cbT4.ItemIndex;
    hGsSetting.pass_iT5 := cbT5.ItemIndex;
    hGsSetting.pass_sOwner := edtSPass1.Text;
    hGsSetting.pass_sUser := edtSPass2.Text;
    hGsSetting.pass_bPass1 := cbSPass1.Checked;
    hGsSetting.pass_bPass2 := cbSPass2.Checked;
    hGsSetting.slug := false;
    hGsSetting.meta_bDateCreate := False;
    hGsSetting.meta_sAuthor := '';
    hGsSetting.meta_sKeywords := '';
    hGsSetting.meta_sSubject := '';
    hGsSetting.meta_sTitle := '';
    hGsSetting.meta_sProducer := edtGProducer.Text;
    hGsSetting.meta_sCreator := edtGCreator.Text;
    hGsSetting.meta_bDateCreate2 := dtDate.DateTime;

    sCmdPdf := ChangeFileExt(sPdfFile, '.pdf');
    hGsSetting.bPdfOrTifforPNG := cbT0.ItemIndex;

    if pdfCreate(sPdfFile, sCmdPdf, hGsSetting, sOutPdf, sDocName) then begin
      if hGsSetting.bPdfOrTifforPNG = 1 then begin
        sOutPdf := StringReplace(sOutPdf, '-%00d', '-*', [rfReplaceAll]);
        CopyAllFiles(sOutPdf, sSilentPath, False);
      end else begin
        Sleep(1000);
        try
          CopyFile(PWideChar(sCmdPdf), PWideChar(sSilentPath), False);
        except

        end;
      end;
    end;
    //
    SetXLS(False);
    Close;
  end else begin
    if cbT1.ItemIndex = 1 then begin
      nb.ActivePageIndex := 0;
      if edtSPass2.Text = '' then begin
        if edtSPass2.CanFocus then begin
          edtSPass2.SetFocus;
        end;
        ShowMessage('Please enter a Permissions Password.');
        exit;
      end;
    end;
    if cbT1.ItemIndex = 2 then begin
      nb.ActivePageIndex := 0;
      if edtSPass1.Text = '' then begin
        if edtSPass1.CanFocus then begin
          edtSPass1.SetFocus;
        end;
        ShowMessage('Please enter a Open Password.');
        exit;
      end;
    end;
    // ==========================================================================
    // NORMAL MODE
    // ==========================================================================
    // == Metadata Settings =======================================================
    // == Metadata Settings =======================================================
    hGsSetting.pass_iT1 := cbT1.ItemIndex;
    hGsSetting.pass_iT2 := cbT2.ItemIndex;
    hGsSetting.pass_iT3 := cbT3.ItemIndex;
    hGsSetting.pass_iT4 := cbT4.ItemIndex;
    hGsSetting.pass_iT5 := cbT5.ItemIndex;
    hGsSetting.pass_sOwner := edtSPass1.Text;
    hGsSetting.pass_sUser := edtSPass2.Text;
    hGsSetting.pass_bPass1 := cbSPass1.Checked;
    hGsSetting.pass_bPass2 := cbSPass2.Checked;
    hGsSetting.slug := false;
    hGsSetting.meta_sAuthor := edtGAuthor.Text;
    hGsSetting.meta_sKeywords := edtGKey.Text;
    hGsSetting.meta_sSubject := edtGSubject.Text;
    hGsSetting.meta_sTitle := edtGTitle.Text;
    hGsSetting.meta_sProducer := edtGProducer.Text;
    hGsSetting.meta_sCreator := edtGCreator.Text;
    hGsSetting.meta_bDateCreate2 := dtDate.DateTime;
    hGsSetting.bPdfOrTifforPNG := cbT0.ItemIndex;

    if hGsSetting.bPdfOrTifforPNG = 0 then begin
      sCmdPdf := ChangeFileExt(sPdfFile, '.pdf');
    end;
    if hGsSetting.bPdfOrTifforPNG = 1 then begin
      sCmdPdf := ChangeFileExt(sPdfFile, '.tif');
    end;
    if hGsSetting.bPdfOrTifforPNG = 2 then begin
      sCmdPdf := ChangeFileExt(sPdfFile, '.pdf');
    end;
    if hGsSetting.bPdfOrTifforPNG = 3 then begin
      sCmdPdf := ChangeFileExt(sPdfFile, '.png');
    end;

    sDocName := ChangeFileExt(ExtractFilename(sDocName), '');
    if (iTag = ID_SAVE_TO_DISK) or (iTag = ID_SAVE_TO_DESKTOP) or
      (iTag = ID_SAVE_TO_MYDOC) then begin
      if hGsSetting.bPdfOrTifforPNG = 1 then { // TIFF Support }begin
        if iTag = ID_SAVE_TO_DISK then begin
          if not dlgFolder.Execute(Handle) then begin
            exit;
          end;
          sTempTiffCopy := dlgFolder.FileName;
        end;
        if iTag = ID_SAVE_TO_DESKTOP then begin
          sTempTiffCopy := cpAddSlashW(sDskPath);
        end;
        if iTag = ID_SAVE_TO_MYDOC then begin
          sTempTiffCopy := cpAddSlashW(sMydPath);
        end;
        sDocName := ChangeFileExt(sDocName, '');
        sOutPdf := StringReplace(sOutPdf, '-%00d', '-*', [rfReplaceAll]);

        sDocName := RemoveBadChars(ExtractFilename(sDocName));
        if pdfCreate(sPdfFile, sCmdPdf, hGsSetting, sOutPdf, sDocName) then begin
          ShowMessageX('TIFF File Created');
          sOutPdf := StringReplace(sOutPdf, '-%00d', '-*', [rfReplaceAll]);
          CopyAllFiles(sOutPdf, sTempTiffCopy, False);
        end;

      end else begin
        if iTag = ID_SAVE_TO_DISK then begin
          if hGsSetting.sDefaultDir = '' then begin // default.
            hGsSetting.sDefaultDir := cpAddSlashW(sMydPath);
          end;
          if DirectoryExists(hGsSetting.sDefaultDir) then begin
            dlgSave.InitialDir := cpAddSlashW(hGsSetting.sDefaultDir);
          end else begin
          end;
        end;
        if iTag = ID_SAVE_TO_DESKTOP then begin
          dlgSave.InitialDir := cpAddSlashW(sDskPath);
          if CheckPathCanWrite(GetDesktopPath()) <> '' then
            dlgSave.InitialDir := GetDesktopPath();
        end;
        if iTag = ID_SAVE_TO_MYDOC then begin
          dlgSave.InitialDir := cpAddSlashW(sMydPath);
          if CheckPathCanWrite(GetMyDocPath()) <> '' then
            dlgSave.InitialDir := GetMyDocPath();
        end;

{$IFDEF EPO}
        hGsSetting.bPdfOrTifforPNG := 2;
{$ENDIF}
{$IFDEF PDF2B}
        hGsSetting.bPdfOrTifforPNG := 2;
{$ENDIF}
        if hGsSetting.bPdfOrTifforPNG = 0 then begin
          dlgSave.Filter := 'PDF (*.pdf)|*.pdf';
        end;
        if hGsSetting.bPdfOrTifforPNG = 1 then begin
          dlgSave.Filter := 'TIFF (*.tif)|*.tif';
        end;
        if hGsSetting.bPdfOrTifforPNG = 2 then begin
          dlgSave.Filter := 'PDF/A (*.pdf)|*.pdf';
        end;
        if hGsSetting.bPdfOrTifforPNG = 3 then begin
          dlgSave.Filter := 'PNG (*.png)|*.png';
        end;

        sDocName := ChangeFileExt(sDocName, '');
        dlgSave.FileName := Remove2X(RemoveBadChars(ExtractFilename(sDocName)));
        if dlgSave.Execute(Handle) then begin
          if iTag = ID_SAVE_TO_DISK then begin
            hGsSetting.sDefaultDir := ExtractFilePath(dlgSave.FileName);
            UpdateHint;
          end;
          sTempFileNameForSave := ChangeFileExt(dlgSave.FileName,
            ExtractFileExt(dlgSave.Filter));

          if FileExists(sTempFileNameForSave) then begin
            try
              DeleteFile(sTempFileNameForSave);
            except
            end;
          end;

          if pdfCreate(sPdfFile, sCmdPdf, hGsSetting, sOutPdf, sDocName) then begin
            bRes := False;
            try
              bRes := CopyFile(PChar(sCmdPdf),
                PChar(sTempFileNameForSave), False);
            except
            end;
            if bRes then begin
              try
                FileDel;
              except
              end;
              if hGsSetting.bPdfOrTifforPNG = 0 then begin
                sDat := 'PDF File Created';
                ShowMessageX(sDat);
              end;
              if hGsSetting.bPdfOrTifforPNG = 1 then begin
                ShowMessageX('TIFF File Created');
              end;
              if hGsSetting.bPdfOrTifforPNG = 2 then begin
                sDat := 'PDF/A File Created';
                ShowMessageX(sDat);
              end;
              if hGsSetting.bPdfOrTifforPNG = 3 then begin
                ShowMessageX('PNG File Created');
              end;
            end;
          end else begin
            ShowMessage('PDF File NOT created. Could not save.');
          end;
        end;
      end;
    end;
    //
    if (iTag = ID_SAVE_TO_EMAIL) then begin
      if dms_LoIsInstalled then begin
        Randomize;
        if pdfCreate(sPdfFile, sCmdPdf, hGsSetting, sOutPdf, sDocName) then begin
          bNotes := False;
          hNotes := FindWindow('NOTES', nil);
          if (hNotes >= 1) then begin
            bNotes := True;
          end;
          try
            oSession := NOTESSESSION(CreateOleObject('Notes.NotesSession'));
          except exit;
          end;
          oMailServer := oSession.GETENVIRONMENTSTRING('MailServer', True);
          oMailFile := oSession.GETENVIRONMENTSTRING('MailFile', True);
          if VarIsNull(oMailServer) then begin
            exit;
          end;
          if VarIsNull(oMailFile) then begin
            exit;
          end;
          oDb := NOTESDATABASE(IDispatch(oSession.GETDATABASE('', '',
            varNull)));
          if VarIsNull(oDb) then begin
            exit;
          end;
          oDb2 := NOTESDATABASE(IDispatch(oSession.GETDATABASE(oMailServer,
            oMailFile, varNull)));
          try
            if oDb2.ISOPEN then begin
              oDb.OPENWITHFAILOVER(oMailServer, oMailFile);
            end else begin
              try
                if oDb.ISOPEN = False then
                  oDb.OPENWITHFAILOVER(oMailServer, oMailFile);
              except
              end;
            end;
          except
          end;
          try
            oDoc := NOTESDOCUMENT(IDispatch(oDb.CREATEDOCUMENT));
            if VarIsNull(oDoc) then begin
              exit;
            end;
          except exit;
          end;
          oAttachment := NOTESRICHTEXTITEM
            (IDispatch(oDoc.CREATERICHTEXTITEM('body')));
          oAttachment.APPENDTEXT('');
          oAttachment.AddNewLine(2, varNull);
          try
            sFile := sCmdPdf;
            if FileExists(sFile) then
              oAttachment.EmbedObject(1454, '', sFile, '');
          except exit;
          end;
          oDoc.SAVE(1, 1, False);
          try
            oUIWorkSpace :=
              NOTESUIWORKSPACE(CreateOleObject('Notes.NOTESUIWORKSPACE'));
          except
          end;
          try
            if bNotes then begin
              oUIWorkSpace.OPENDATABASE(oDb.SERVER, oDb.FILEPATH, '', '',
                False, True);
            end else begin
              oUIWorkSpace.OPENDATABASE(oDb.SERVER, oDb.FILEPATH, '', '',
                True, True);
            end;
          except
          end;
          try
            oDoc.APPENDITEMVALUE('Subject', 'Change-Pro Comparison');
          except
          end;
          try
            oUIWorkSpace.EDITDOCUMENT(True, oDoc, False, '', oRet, False);
          except
          end;
          ForceLotus;
          ForceLotus;
          Sleep(500);
          SetXLS(False);
          Close;
        end;
      end else begin
        ShowMessage('Lotus Notes not installed');
      end;
    end;
  end;
end;

// ==============================================================================
// Etc
// ==============================================================================

end.

