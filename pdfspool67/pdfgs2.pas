{ ===============================================================================
  Litera(r) PDF
  Copyright (c) Feb 2004 - 2017 by Litera Corp. All rights reserved.

  Description:
  GhostScript Interface
  =============================================================================== }
unit pdfGs2;

interface

uses Dialogs, Classes, SysUtils, Windows;

function CallGS(argv1: TStringList): Boolean;
procedure InitGSDLL;
procedure ConvertGSPDFA(s1, s2: string; bPDF1A: Boolean);

procedure ConvertGSPDF(s1, s2: string; bOpenPDFA: Boolean = false);
function GetFontsDirectoryX: string;
function gslib: string;

var
  iGSDLLHandle: NativeInt;
  bGsDebug: Boolean = false;
  iGsType: Integer = 0;

implementation

uses Registry, cpsGlobal;

type
  TGSAPIrevision = packed record
    product: PansiChar;
    copyright: PansiChar;
    revision: NativeInt;
    revisiondat: NativeInt;
  end;

  PGSAPIrevision = ^TGSAPIrevision;
  TStdioFunction = function(caller_handle: Pointer; buf: PansiChar; len: NativeInt): NativeInt; stdcall;

  PPCharA = array of PansiChar;

var
  instance: Pointer;
  gsapi_revision: function(pGSRevisionInfo: PGSAPIrevision; len: NativeInt): NativeInt; stdcall;
  gsapi_new_instance: function(pinstance: Pointer; lngCallerHandle: Pointer): NativeInt; stdcall;
  gsapi_set_stdio: function(pinstance: Pointer; stdin_fn: TStdioFunction; stdout_fn: TStdioFunction;
    stderr_fn: TStdioFunction): DWORD; stdcall;
  gsapi_delete_instance: procedure(pinstance: Pointer); stdcall;
  gsapi_init_with_args: function(pinstance: Pointer; argc: NativeInt; argv: PPCharA): DWORD; stdcall;
  gsapi_exit: function(pinstance: Pointer): DWORD; stdcall;

function Is64Bits(): Boolean;
type
  TIsWow64Process = function(hProcess: THandle; var Wow64Process: BOOL): BOOL; stdcall;
var
  IsWow64Proc: TIsWow64Process;
  hLib: THandle;
  bWow64: LongBool;
  hProcess: Cardinal;
begin
  Result := false;
  // try to load kernell32.dll lib
  hLib := LoadLibrary(kernel32);
  if hLib = 0 then exit; // if lib was not found - we are in Win x32
  try
    // try to load method from lib
    @IsWow64Proc := GetProcAddress(hLib, 'IsWow64Process');
    if not Assigned(IsWow64Proc) then exit;
    // if method not found it means that we are in Win x32
    bWow64 := false;
    hProcess := GetCurrentProcess();
    // check is our x32 processes works under Wow64
    if IsWow64Proc(hProcess, bWow64) then Result := bWow64;
  finally FreeLibrary(hLib);
  end;
end;

function gslib: string;
var
  dir_gsLib: string;
begin
  if Is64Bits then begin
    dir_gsLib := 'c:\program files (x86)\litera\changepro';
  end else begin
    dir_gsLib := 'c:\program files\litera\changepro';
  end;
  Result := dir_gsLib;
end;

function GetFontsDirectoryX: string;

  function SetAddSlash(const sPath: string): string;
  var
    sResult: string;
  begin
    sResult := sPath;
    if (Length(sResult) > 0) then
    // some AMD or non-Intel PCs cannot evaluate this
    // correctly and have to be two separate lines.
    begin
      if (sResult[Length(sResult)] <> '\') then begin
        sResult := sResult + '\';
      end;
    end;
    Result := sResult;
  end;

  function ReadVar(XENV: PWideCHAR): string;
    procedure NullString(var sStr: string);
    var
      iNo: Integer;
    begin
      iNo := Pos(#0, sStr);
      if iNo >= 1 then begin
        SetLength(sStr, iNo - 1);
      end;
    end;

  var
    EnvString: string;
  begin
    SetLength(EnvString, 1024);
    if (GetEnvironmentVariableW(XENV, PWideCHAR(EnvString), 1023) <> 0) then begin
      Result := Trim(EnvString);
    end else begin
      Result := '';
    end;
    NullString(Result);
  end;

var
  reg: TRegistry;
  tstr: string;
  sDrive: string;
begin
  reg := TRegistry.Create(KEY_READ or KEY_WRITE);
  reg.RootKey := HKEY_CURRENT_USER;
  if (reg.OpenKey('Software\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders', True)) then begin
    tstr := reg.ReadString('Fonts');
  end;
  reg.CloseKey;
  reg.Free;
  //
  tstr := Trim(tstr);
  if (tstr = '') then begin
    sDrive := SetAddSlash(ReadVar('HOMEDRIVE'));
    sDrive := SetAddSlash(sDrive + 'Windows\Fonts');
    tstr := sDrive;
    //
    if DirectoryExists(tstr) = false then begin
      sDrive := SetAddSlash(ReadVar('HOMEDRIVE'));
      sDrive := SetAddSlash(sDrive + 'Win\Fonts');
      tstr := sDrive;
    end;
    if DirectoryExists(tstr) = false then begin
      sDrive := SetAddSlash(ReadVar('HOMEDRIVE'));
      sDrive := SetAddSlash(sDrive + 'Win\Font');
      tstr := sDrive;
    end;
    if DirectoryExists(tstr) = false then begin
      sDrive := 'c:\windows\fonts';
      tstr := sDrive;
    end;
  end;
  Result := tstr + ';' + gslib;
end;

procedure ConvertGSPDFA(s1, s2: string; bPDF1A: Boolean);
var
  sParams: TStringList;
begin
  sParams := TStringList.Create;
  sParams.Add('-I' + GetFontsDirectoryX);
  sParams.Add('-q');
  sParams.Add('-dBATCH');
  sParams.Add('-dNOPAUSE');

  if bPDF1A then begin
    sParams.Add('-dPDFA=1');
  end else begin
    sParams.Add('-dPDFA=2');
  end;

  sParams.Add('-dNOOUTERSAVE');
  sParams.Add('-sFONTPATH=' + GetFontsDirectoryX);
  sParams.Add('-dCompressFonts=true');
  sParams.Add('-dSubsetFonts=true');
  sParams.Add('-dUseCropBox');
  sParams.Add('-sPDFACompatibilityPolicy=1');
  sParams.Add('-dCompatibilityLevel#1.4');
  sParams.Add('-sProcessColorModel=DeviceRGB');
  sParams.Add('-sColorConversionStrategy=RGB');
  sParams.Add('-sColorConversionStrategyForImages=RGB');
  sParams.Add('-dOverrideICC=true');
  sParams.Add('-sDEVICE=pdfwrite'); // for now.
  sParams.Add('-dAutoRotatePages=/PageByPage');
  sParams.Add('-dDoNumCopies');
  sParams.Add('-dNumRenderingThreads=12');
  sParams.Add('-dNOGC');
  sParams.Add('-sOutputFile=' + s2);
  sParams.Add(s1);

  Sleep(100);
  InitGSDLL;
  CallGS(sParams);
  sParams.Free;
  Sleep(100);
end;

procedure ConvertGSPDF(s1, s2: string; bOpenPDFA: Boolean = false);
var
  sParams: TStringList;
begin
  sParams := TStringList.Create;
  sParams.Add('-I' + GetFontsDirectoryX);
  sParams.Add('-q');
  sParams.Add('-dBATCH');
  sParams.Add('-sDEVICE=pdfwrite'); // for now.
  sParams.Add('-dNOPAUSE');
  sParams.Add('-dPDF');

  sParams.Add('-dCompressFonts=true');
  sParams.Add('-dSubsetFonts=true');
  sParams.Add('-dUseCropBox');

  sParams.Add('-dNOOUTERSAVE');

  if bOpenPDFA then begin
    sParams.Add('-dShowAcroForm=false');
    sParams.Add('-dShowAnnots=true');
  end;

  sParams.Add('-sFONTPATH=' + GetFontsDirectoryX);
  sParams.Add('-sProcessColorModel=DeviceCMYK');
  sParams.Add('-dUseCIEColor');
  sParams.Add('-sPDFACompatibilityPolicy=0');
  sParams.Add('-dCompatibilityLevel#1.4');
  sParams.Add('-dAutoRotatePages=/PageByPage');

  sParams.Add('-dDoNumCopies');
  sParams.Add('-dNumRenderingThreads=12');
  sParams.Add('-dNOGC');

  sParams.Add('-sOutputFile=' + s2);
  sParams.Add(s1);

  Sleep(250);
  InitGSDLL;
  CallGS(sParams);
  sParams.Free;
  Sleep(250);
end;

procedure InitGSDLL;
  function GetModuleName: string;
  var
    szFileName: array [0 .. MAX_PATH] of Char;
  begin
    FillChar(szFileName, SizeOf(szFileName), #0);
    GetModuleFileName(hInstance, szFileName, MAX_PATH);
    Result := szFileName;
  end;

var
  sPath, sSysPath: string;
begin
{$IFDEF WIN64}
  sPath := 'gsdll64.dll'; // expected to be in Path
{$ELSE}
  sPath := 'gsdll32.dll';
{$ENDIF}
  iGSDLLHandle := LoadLibrary(PChar(sPath));
  if iGSDLLHandle >= 32 then begin
    @gsapi_revision := GetProcAddress(iGSDLLHandle, 'gsapi_revision');
    @gsapi_new_instance := GetProcAddress(iGSDLLHandle, 'gsapi_new_instance'); { U }
    @gsapi_set_stdio := GetProcAddress(iGSDLLHandle, 'gsapi_set_stdio');
    @gsapi_delete_instance := GetProcAddress(iGSDLLHandle, 'gsapi_delete_instance'); { U }
    @gsapi_init_with_args := GetProcAddress(iGSDLLHandle, 'gsapi_init_with_args'); { U }
    @gsapi_exit := GetProcAddress(iGSDLLHandle, 'gsapi_exit'); { U }
  end;
  exit;
end;

function gsdll_stdin(intGSInstanceHandle: DWORD; strz: DWORD; intBytes: DWORD): DWORD;
begin
  // We don't have a console, so just return EOF
  Result := 0;
end;

function gsdll_stdout(intGSInstanceHandle: DWORD; strz: DWORD; intBytes: DWORD): DWORD;
var
  aByte: array of Byte;
  tstr: string;
  i: Integer;
begin
  SetLength(aByte, intBytes);
  for i := 0 to intBytes - 1 do begin
    tstr := tstr + Chr(aByte[i]);
  end;
  Result := intBytes;
end;

function gsdll_stderr(intGSInstanceHandle: DWORD; strz: DWORD; intBytes: DWORD): DWORD;
begin
  Result := gsdll_stdout(intGSInstanceHandle, strz, intBytes);
end;

function CheckRevision(intRevision: NativeInt): Boolean;
var
  intReturn: NativeInt;
  udtGSRevInfo: PGSAPIrevision;
begin
  New(udtGSRevInfo);
  intReturn := gsapi_revision(udtGSRevInfo, 16);
  if intReturn = 0 then begin
  end;
  if (udtGSRevInfo.revision >= intRevision) then begin
    Result := True;
  end else begin
    Result := false;
  end;
  Dispose(udtGSRevInfo);
end;

type
  TgsStdioEvent = procedure(Value: PansiChar; len: NativeInt) of object;

var
  FInput: TgsStdioEvent;
  FOutput: TgsStdioEvent;
  FError: TgsStdioEvent;

function gsstdin(caller_handle: Pointer; buf: PansiChar; len: NativeInt): NativeInt; stdcall;
var
  S: ansiString;
begin
  S := buf;
  if Assigned(FInput) then FInput(PansiChar(S), len);

  if bGsDebug then begin
    ShowMessage(S);
    // S := InputBox('Inserisci dato','Inserire dato:','');
    // buf:=PChar(S);
  end;

  buf := '';
  Result := Length(buf);
end;

function gsstdout(caller_handle: Pointer; buf: PansiChar; len: NativeInt): NativeInt; stdcall;
var
  S: ansiString;
begin
  S := buf;
  SetLength(S, len);
  if Assigned(FOutput) then FOutput(PansiChar(S), len);

  if bGsDebug then begin
    ShowMessage(S);
  end;

  Result := len; // length(S);
end;

function gsstderr(caller_handle: Pointer; buf: PansiChar; len: NativeInt): NativeInt; stdcall;
var
  S: ansiString;
begin
  S := buf;
  SetLength(S, len);
  if Assigned(FError) then FError(PansiChar(S), len);

  if bGsDebug then begin
    ShowMessage(S);
  end;

  Result := len; // length(buf);
end;

function CallGS(argv1: TStringList): Boolean;
var
  iReturn: NativeInt;
  iArg: NativeInt;
  sArg: PPCharA;
  iTSNo, iTSCount: NativeInt;
begin

  if bGsDebug then begin
    ShowMessage(argv1.text);
  end;

  if (CheckRevision(920) = false) then begin
    ShowMessage('PDF Error. Please make sure gsdll32.dll / gsdll64.dll is correct version. ');
    Result := false;
    exit;
  end;

  iReturn := gsapi_new_instance(@instance, nil);
  if (iReturn <> 0) then begin
    Result := false;
    exit;
  end;
  iReturn := gsapi_set_stdio(instance, @gsstdin, @gsstdout, @gsstderr);

  if iReturn = 0 then { // Keep Compiler Happy } begin
  end;

  iReturn := 1;
  if (iReturn >= 0) then begin
    iTSCount := argv1.Count;
    iArg := iTSCount;
    SetLength(sArg, iTSCount);
    sArg[0] := PansiChar(ansiString(' '));
    for iTSNo := 1 to (iTSCount - 1) do begin
      sArg[iTSNo] := StrNew(PansiChar(ansiString(UTF8Encode(argv1.Strings[iTSNo]))));
    end;
    try
      iReturn := gsapi_init_with_args(instance, iArg, sArg);
      if iReturn <> 0 then begin
        if bGsDebug then begin
          ShowMessage('PDF Error. Please try to print again. Error Code: ' + IntToStr(iReturn));
        end;
      end;
      gsapi_exit(instance);
    except
    end;

    try
      for iTSNo := (iTSCount - 1) downto 1 do begin
        StrDispose(sArg[iTSNo]);
      end;
    except
    end;

  end;
  try gsapi_delete_instance(instance);
  except iReturn := 99;
  end;
  if (iReturn >= 0) then begin
    Result := True;
  end else begin
    Result := false;
  end;
end;

end.
