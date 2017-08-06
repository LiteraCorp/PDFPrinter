{===============================================================================
  Litera(r) PDF
  Copyright (c) Feb 2005 - 2017 by Litera Corp. All rights reserved.

  Description:
  WinExec Core
===============================================================================}
unit pdrWinExec;

interface

uses Windows, Messages, Classes, SysUtils, Dialogs, Registry, JwaWindows,
  JwsclExceptions, JwsclPrivileges, JwsclToken, JwsclSid, Jwscltypes,
  JwsclTerminalServer, JwsclLogging, JwsclLsa, JwsclDescriptor, Jwsclstrings,
  cpsWinV;

procedure ClearKeyBoardBuffer(iHandle: integer = 0);
function SetAddSlash(const sPath: string): string;
function GetQuickAppPath(iNo: integer): string;

const
  cpy_FormCaptionPD = 'Litera PDF';
  sRegCPPRN = 'Software\Litera2\PDF Maker2\'; // This is stored in USER.
  sRegCPPRN_Acrobat = 'bOpenAcrobat';
  sRegCPPRN_AuthorA = 'sAuthorA';
  sRegCPPRN_bCreationDate = 'bCreationDate2';
  sREgCPPRN_BlackAndWhite = 'bBlackAndWhite';
  sRegCPPRN_bMetaClear = 'bNoMetadata';
  sRegCPPRN_bModifiedDate = 'bModifiedDate2';
  sRegCPPRN_sCustomDir = 'SavePath';
  sRegCPPRN_bPass1 = 'bPass1';
  sRegCPPRN_bPass2 = 'bPass2';
  sRegCPPRN_bS0a = 'CompatibilityMode'; // For Softwise
  sRegCPPRN_bS1a = 'bS1'; // Print
  sRegCPPRN_bS2a = 'bS2'; // Copy
  sRegCPPRN_bS3a = 'bS3'; // Comment
  sRegCPPRN_bS4a = 'bS4'; // Assembly
  sRegCPPRN_bS5a = 'bS5'; // a1
  sRegCPPRN_bS6a = 'bS6'; // A2
  sRegCPPRN_bS7a = 'bS7'; // Read1
  sRegCPPRN_bS8a = 'bS8'; // Read2
  sRegCPPRN_bT1 = 'T1';
  sRegCPPRN_bT2 = 'T2';
  sRegCPPRN_bT3 = 'T3';
  sRegCPPRN_bT4 = 'T4';
  sRegCPPRN_bT5 = 'T5';
  sRegCPPRN_bT6 = 'T6';
  sRegCPPRN_bT7 = 'T7';
  sRegCPPRN_bT8 = 'T8';
  sRegCPPRN_bT9 = 'T9';
  sRegCPPRN_eLevel = 'iPdfLevel';
  sRegCPPRN_eRotate = 'iRotate';
  sRegCPPRN_HighSecurityA = 'bHighSecurity';
  sRegCPPRN_iType = 'iPdfType'; // Read2
  sRegCPPRN_KeyWordsA = 'sKeywordsA';
  sRegCPPRN_NoMeta = 'bNoMetadata';
  sRegCPPRN_Producer = 'sProducer';
  sRegCPPRN_ProducerA = 'sProducerA';
  sRegCPPRN_Creator = 'sCreator';
  sRegCPPRN_CreatorA = 'sCreatorA';
  sRegCPPRN_SecurityA = 'bSecurity';
  sRegCPPRN_Silent = 'SilentPrint';
  sRegCPPRN_SilentImage = 'SilentImage';
  sRegCPPRN_SilentNAM = 'SilentPrintNAM';
                      // 'SilentPrintOutPath';
  sRegCPPRN_SilentPath = 'SilentPrintOutPath';
  sRegCPPRN_SilentPrintNS = 'Security';
  sRegCPPRN_SilentShellAdobe = 'SilentShellAdobe';
  sRegCPPRN_SilentType = 'SilentPrintType';
  sRegCPPRN_SilentXLS = 'SilentPrintXLS';
  sRegCPPRN_sPass1 = 'sPass1';
  sRegCPPRN_sPass2 = 'sPass2';
  sRegCPPRN_SubjectA = 'sSubjectA';
  sRegCPPRN_TitleA = 'sTitleA';
  sRegCPPRN_Slug = 'Slug';

{$B+}
function GetUserA(var bIsSystem: boolean): string;
function ParseCmd(): string;
function RemoveBadChars(str: string): string;
function Remove2X(str: string): string;
function CopyAllFiles(sFrom, sTo: string; Protect: boolean): boolean;
function DocNameFilter(sDataX: string): string;
function dms_LoIsInstalled: boolean;
procedure ForceLotus;
function GetProfileDirCP: string;
function GetLastBit: string;
function CheckPathCanWrite(sFilPath: string): string;
function GetTempFile2(): string;
function GetTempFile(sDataX: string; const Extension: string): string;
function GetTempFile3(sDataX: string; const Extension: string): string;

// == Common

function CreateWinNTProcessList(sUserName: string; var SessionID: Cardinal;
  var ProcessID, ProcessID2: Cardinal; var hToken, hToken2: Cardinal): boolean;
function GetProfPathByUserName(var sUserName: string): string;
function ReadVar(XENV: PWideCHAR): string;
procedure LoadProfileA(sUser: string = '');
procedure RunAsUser(Application, Parameters: string;
  SessionID, hProcess, hProcess2, hToken, hToken2: Cardinal; sRunUser: string);
procedure CreateWinNTProcessList2(sUserName: string; var SessionID: Cardinal);
function cpAddSlashW(const sPath: string): string;
function IsTaskRunningTwice(ExeFileName: string): Boolean;
function IsSystemUser: boolean;
function GetUserFromWindows: string;
function GetDesktopPath: string;
function GetMyDocPath: string;

implementation

uses Math, JwsclKnownSid, JwsclUtils, JwsclVersion, JwsclAcl, JwsclConstants,
  Psapi, ActiveX, ComObj, cpsGlobal, shellapi, shlobj,
  tlhelp32;


function GetMyDocPath: string;
begin
  Result := GetQuickAppPath(CSIDL_PERSONAL);
end;

function GetDesktopPath: string;
begin
  if IsSystemUser then
  begin
    Result := ''; // Don't return anything System is BLANK or NULL
  end else
  begin
    Result := GetQuickAppPath(CSIDL_DESKTOP);
  end;
end;

function IsTaskRunningTwice(ExeFileName: string): Boolean;
const
  PROCESS_TERMINATE = $0001;
var
  ContinueLoop: BOOL;
  FSnapshotHandle: THandle;
  FProcessEntry32: TProcessEntry32;
  iNo: integer;
begin
  Result := false;
  iNo := 0;
  FSnapshotHandle := CreateToolhelp32Snapshot(TH32CS_SNAPPROCESS, 0);
  FProcessEntry32.dwSize := SizeOf(FProcessEntry32);
  ContinueLoop := Process32First(FSnapshotHandle, FProcessEntry32);
  while Integer(ContinueLoop) <> 0 do begin
    if ((UpperCase(ExtractFileName(FProcessEntry32.szExeFile)) =
      UpperCase(ExeFileName)) or (UpperCase(FProcessEntry32.szExeFile) =
      UpperCase(ExeFileName))) then begin
      Inc(iNo);
    end;
    ContinueLoop := Process32Next(FSnapshotHandle, FProcessEntry32);
  end;
  CloseHandle(FSnapshotHandle);
  //
  if (iNo) >= 2 then begin
    Result := true;
  end;
end;
function cpAddSlashW(const sPath: string): string;
var
  sResult: string;
begin
  sResult := sPath;
  if (Length(sResult) > 0) and (sResult[length(sResult)] <> '\') then
  begin
    sResult := sResult + '\';
  end;
  Result := sResult;
end;

function GetQuickAppPathFromRegistry(iNo: integer): string;
var
  reg: TRegistry;
  keyValue: string;
begin
  reg := TRegistry.Create(KEY_READ);
  reg.RootKey := HKEY_CURRENT_USER;

  // Read only key actually exists.
  // On SMS Installation/Boot time, it does not exist.
  if reg.OpenKey('SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders', false) then
  begin

    case iNo of
      CSIDL_PERSONAL:
        begin
          keyValue := 'Personal';
        end;
      CSIDL_LOCAL_APPDATA:
        begin
          keyValue := 'Local AppData';
        end;
      CSIDL_APPDATA:
        begin
          keyValue := 'AppData';
        end;
      CSIDL_DESKTOP:
        begin
          keyValue := 'Desktop';
        end;
      CSIDL_COMMON_APPDATA:
        begin
          reg.CloseKey;
          reg.RootKey := HKEY_LOCAL_MACHINE;
          reg.OpenKey('SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders', false);
          keyValue := 'Common AppData';
        end;

      CSIDL_COMMON_DESKTOPDIRECTORY:
        begin
          reg.CloseKey;
          reg.RootKey := HKEY_LOCAL_MACHINE;
          reg.OpenKey('SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders', false);
          keyValue := 'Common Desktop';

        end;
      CSIDL_COMMON_STARTMENU:
        begin
          reg.CloseKey;
          reg.RootKey := HKEY_LOCAL_MACHINE;
          reg.OpenKey('SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders', false);
          keyValue := 'Common Start Menu';

        end;

    end;
    Result := reg.ReadString(keyValue);
  end;
  reg.Free;
  if Result <> '' then
  begin
    Result := SetAddSlash(Result);
  end;
end;

procedure NullString(var sStr: string);
var
  iNo: integer;
begin
  iNo := Pos(#0, sStr);
  if iNo >= 1 then
  begin
    SetLength(sStr, iNo - 1);
  end;
end;
function GetQuickAppPath(iNo: integer): string;
var
  idl: PItemIDList;
begin

{$IFDEF SYSMODE}

  // only for PDF printer
  Result := GetQuickAppPathFromRegistry(iNo);
  if ((Result = '') or (not DirectoryExists(Result))) then
  begin
    SHGetSpecialFolderLocation(0, iNo, IDL);
    try
      SetLength(Result, MAX_PATH);
      SHGetPathFromIDListW(IDL, PWideChar(Result));
    finally
      CoTaskMemFree(IDL);
    end;
    NullString(Result);
    Result := SetAddSlash(Result);
  end;

{$ELSE}

  SHGetSpecialFolderLocation(0, iNo, IDL);
  try
    SetLength(Result, MAX_PATH);
    SHGetPathFromIDListW(IDL, PWideChar(Result));
  finally
    CoTaskMemFree(IDL);
  end;
  NullString(Result);
  Result := SetAddSlash(Result);
  Result := SetShortPath(Result);

{$ENDIF}

end;
function SetAddSlash(const sPath: string): string;
var
  sResult: string;
begin
  sResult := sPath;
  if (Length(sResult) > 0) then
    // some AMD or non-Intel PCs cannot evaluate this
    // correctly and have to be two separate lines.
  begin
    if (sResult[length(sResult)] <> '\') then
    begin
      sResult := sResult + '\';
    end;
  end;
  Result := sResult;
end;

procedure ClearKeyBoardBuffer(iHandle: integer = 0);
var
  Msg: TMsg;
begin
  while PeekMessage(Msg, iHandle, WM_KEYFIRST, WM_KEYLAST,
    PM_REMOVE or PM_NOYIELD) do ;
  while PeekMessage(Msg, iHandle, WM_KEYFIRST, WM_KEYLAST,
    PM_REMOVE or PM_NOYIELD) do ;
  while PeekMessage(Msg, iHandle, WM_KEYFIRST, WM_KEYLAST,
    PM_REMOVE or PM_NOYIELD) do ;
  while PeekMessage(Msg, iHandle, WM_KEYFIRST, WM_KEYLAST,
    PM_REMOVE or PM_NOYIELD) do ;
  while PeekMessage(Msg, iHandle, WM_KEYFIRST, WM_KEYLAST,
    PM_REMOVE or PM_NOYIELD) do ;
  while PeekMessage(Msg, iHandle, WM_KEYFIRST, WM_KEYLAST,
    PM_REMOVE or PM_NOYIELD) do ;
  while PeekMessage(Msg, iHandle, WM_KEYFIRST, WM_KEYLAST,
    PM_REMOVE or PM_NOYIELD) do ;
  while PeekMessage(Msg, iHandle, WM_KEYFIRST, WM_KEYLAST,
    PM_REMOVE or PM_NOYIELD) do ;
  while PeekMessage(Msg, iHandle, WM_KEYFIRST, WM_KEYLAST,
    PM_REMOVE or PM_NOYIELD) do ;
  while PeekMessage(Msg, iHandle, WM_KEYFIRST, WM_KEYLAST,
    PM_REMOVE or PM_NOYIELD) do ;
  while PeekMessage(Msg, iHandle, WM_KEYFIRST, WM_KEYLAST,
    PM_REMOVE or PM_NOYIELD) do ;
  while PeekMessage(Msg, iHandle, WM_KEYFIRST, WM_KEYLAST,
    PM_REMOVE or PM_NOYIELD) do ;
  while PeekMessage(Msg, iHandle, WM_KEYFIRST, WM_KEYLAST,
    PM_REMOVE or PM_NOYIELD) do ;
  while PeekMessage(Msg, iHandle, WM_KEYFIRST, WM_KEYLAST,
    PM_REMOVE or PM_NOYIELD) do ;
  while PeekMessage(Msg, iHandle, WM_KEYFIRST, WM_KEYLAST,
    PM_REMOVE or PM_NOYIELD) do ;
  while PeekMessage(Msg, iHandle, WM_KEYFIRST, WM_KEYLAST,
    PM_REMOVE or PM_NOYIELD) do ;
end;
function GetTempFile2(): string;
var S: string; iNo: Integer;
begin
  for iNo := 1 to 8 do begin
    S := S + Chr(RandomRange(97, 110));
  end;
  Result := S;
end;

function GetTempFile(sDataX: string; const Extension: string): string;
var Buffer: string;
begin
  Randomize;
  if trim(sDataX) <> '' then begin
    sDataX := DocNameFilter(sDataX);
  end else begin
    Buffer := GetTempFile2();
    sDataX := Buffer;
  end;
  Result := sDataX + Extension;
end;

function GetTempFile3(sDataX: string; const Extension: string): string;
var Buffer: string;
begin
  Randomize;
  Buffer := GetTempFile2();
  Result := sDataX + Buffer + Extension;
end;


function CheckPathCanWrite(sFilPath: string): string;
var bCanSaveOK: boolean; tsList: TSTringList; sDirCanSave: string;
begin
  Result := '';
  if sFilPath <> '' then begin
    if DirectoryExists(sFilPath) then begin
      sDirCanSave := sFilPath + '~temp.tmp';
      tsList := TSTringList.Create;
      bCanSaveOK := True;
      try
        tsList.SaveToFile(sDirCanSave);
        DeleteFile(PWideCHAR(sDirCanSave));
      except bCanSaveOK := False;
      end;
      tsList.Free;
      if bCanSaveOK then Result := sFilPath;
    end;
  end;
end;

procedure ForceLotus;
var iFindWnd: Integer; sNotes: string;
begin
  sNotes := 'NOTES';
  iFindWnd := FindWindowW(PWideCHAR(sNotes), nil);
  if iFindWnd >= 1 then begin
    if (IsIconic(iFindWnd)) then ShowWindow(iFindWnd, SW_RESTORE);
    csFiles.ForceForegroundWindow(iFindWnd);
  end else begin
  end;
end;

function dms_LoIsInstalled: boolean;
var ClassID: TCLSID; strOLEObject: string;
begin
  Result := False;
  strOLEObject := 'Notes.NotesSession';
  if (CLSIDFromProgID(PWideCHAR(strOLEObject), ClassID) = S_OK) then begin
    Result := True;
  end;
end;

function CopyAllFiles(sFrom, sTo: string; Protect: boolean): boolean;
{ Copies files or directory to another directory. }
var F: TSHFileOpStructW; ResultVal: Integer; tmp1, tmp2: string;
begin
  FillChar(F, SizeOf(F), #0);
  try
    F.Wnd := 0;
    F.wFunc := FO_COPY;
    tmp1 := sFrom + #0;
    tmp2 := sTo + #0;
    F.pFrom := PWideCHAR(tmp1);
    F.pTo := PWideCHAR(tmp2);
    if Protect then
        F.fFlags := FOF_SIMPLEPROGRESS or FOF_SILENT or FOF_NOERRORUI or
        FOF_NOCONFIRMATION
    else F.fFlags := FOF_SIMPLEPROGRESS or FOF_SILENT or FOF_NOERRORUI or
        FOF_NOCONFIRMATION;
    F.fAnyOperationsAborted := False;
    F.hNameMappings := nil;
    ResultVal := SHFileOperationW(F);
    Result := (ResultVal = 0);
  finally
  end;
end;

function DocNameFilter(sDataX: string): string;
begin
  sDataX := StringReplace(sDataX, '!', '', [rfReplaceAll]);
  sDataX := StringReplace(sDataX, '@', '', [rfReplaceAll]);
  sDataX := StringReplace(sDataX, '#', '', [rfReplaceAll]);
  sDataX := StringReplace(sDataX, '$', '', [rfReplaceAll]);
  sDataX := StringReplace(sDataX, '%', '', [rfReplaceAll]);
  sDataX := StringReplace(sDataX, '\', '_', [rfReplaceAll]);
  sDataX := StringReplace(sDataX, '/', '_', [rfReplaceAll]);
  sDataX := StringReplace(sDataX, '(', '', [rfReplaceAll]);
  sDataX := StringReplace(sDataX, ')', '', [rfReplaceAll]);
  sDataX := StringReplace(sDataX, '+', '', [rfReplaceAll]);
  sDataX := StringReplace(sDataX, '[', '', [rfReplaceAll]);
  sDataX := StringReplace(sDataX, ']', '', [rfReplaceAll]);
  sDataX := StringReplace(sDataX, ':', '', [rfReplaceAll]);
  sDataX := StringReplace(sDataX, ';', '', [rfReplaceAll]);
  sDataX := StringReplace(sDataX, '?', '', [rfReplaceAll]);
  sDataX := StringReplace(sDataX, '"', '', [rfReplaceAll]);
  sDataX := StringReplace(sDataX, '''', '', [rfReplaceAll]);
  sDataX := StringReplace(sDataX, '*', '', [rfReplaceAll]);
  sDataX := StringReplace(sDataX, #9, '', [rfReplaceAll]);
  sDataX := StringReplace(sDataX, '^', '', [rfReplaceAll]);
  sDataX := StringReplace(sDataX, '|', '', [rfReplaceAll]);
  sDataX := StringReplace(sDataX, '^', '', [rfReplaceAll]);
  sDataX := StringReplace(sDataX, '&', '', [rfReplaceAll]);
  sDataX := StringReplace(sDataX, '.', '-', [rfReplaceAll]);
  Result := sDataX;
end;

function Remove2X(str: string): string;
begin
  if (pos('metadact/temp', lowercase(str)) >= 1) then begin
    Result := 'Metadact Summary';
    exit;
  end;
  if (pos('metadact/temp/summ', lowercase(str)) >= 1) then begin
    Result := 'Metadact Summary';
    exit;
  end;
  if (pos('metadacttempsumm', lowercase(str)) >= 1) then begin
    Result := 'Metadact Summary';
    exit;
  end;
  if (pos('literametadacttemp', lowercase(str)) >= 1) then begin
    Result := 'Metadact Summary';
    exit;
  end;
  Result := str;
end;

function RemoveBadChars(str: string): string;
const // Took out "\" as that conflicts
    FileFilter = ['\', '/', ':', '*', '?', '"', '<', '>', '|', #13, #10, #9];
var i: Integer;
begin
  Result := str;
  i := 1;
  while i <= Length(Result) do begin
    if CharInSet(Result[i], FileFilter) then begin
      System.Delete(Result, i, 1);
    end else begin
      Inc(i);
    end;
  end;
  Result := StringReplace(Result, '.', '-', [rfReplaceAll]);
end;

function GetProfileDirCP: string;
var sUserName: string; bIsSys: boolean;
begin
  Result := '';
  sUserName := GetUserA(bIsSys);
  Result := GetProfPathByUserName(sUserName);
end;

function GetLastBit: string;
var s2, s3: string; sLocal: string;
begin
  s2 := csFiles.GetQuickAppPath(CSIDL_PROFILE);
  s3 := csFiles.GetQuickAppPath(CSIDL_LOCAL_APPDATA);
  sLocal := s3;
  System.Delete(sLocal, 1, Length(s2));
  Result := sLocal;
end;

// ==============================================================================
// Parsing Functions
// ==============================================================================

function ParseCmd(): string;
  function ParamStrA(Index: Integer): string;
    function GetParamStr(P: PWideCHAR; var Param: string): PWideCHAR;
    var i, Len: Integer; Start, S, Q: PWideCHAR;
    begin
      while True do begin
        while (P[0] <> #0) and (P[0] <= ' ') do P := CharNextW(P);
        if (P[0] = '"') and (P[1] = '"') then Inc(P, 2)
        else Break;
      end;
      Len := 0;
      Start := P;
      while P[0] > ' ' do begin
        if P[0] = '"' then begin
          P := CharNextW(P);
          while (P[0] <> #0) and (P[0] <> '"') do begin
            Q := CharNextW(P);
            Inc(Len, Q - P);
            P := Q;
          end;
          if P[0] <> #0 then P := CharNextW(P);
        end else begin
          Q := CharNextW(P);
          Inc(Len, Q - P);
          P := Q;
        end;
      end;
      SetLength(Param, Len);
      P := Start;
      S := Pointer(Param);
      i := 0;
      while P[0] > ' ' do begin
        if P[0] = '"' then begin
          P := CharNextW(P);
          while (P[0] <> #0) and (P[0] <> '"') do begin
            Q := CharNextW(P);
            while P < Q do begin
              S[i] := P^;
              Inc(P);
              Inc(i);
            end;
          end;
          if P[0] <> #0 then P := CharNextW(P);
        end else begin
          Q := CharNextW(P);
          while P < Q do begin
            S[i] := P^;
            Inc(P);
            Inc(i);
          end;
        end;
      end;
      Result := P;
    end;

  var P: PWideCHAR; Buffer: array [0 .. 512] of WideChar;
  begin
    Result := '';
    if index = 0 then
        SetString(Result, Buffer, GetModuleFileNameW(0, Buffer, SizeOf(Buffer)))
    else begin
      P := GetCommandLineW;
      if index = 0 then begin
        while True do begin
          P := GetParamStr(P, Result);
          if (index = 0) or (Result = '') then Break;
          Dec(index);
        end;
      end else begin
        // CHANGE MADE-->
        P := GetParamStr(P, Result);
        Result := P;
      end;
    end;
  end;

begin
  Result := ParamStrA(1);
end;

function GetUserFromWindows: string;
var
  UserName: string;
  UserNameLen: Dword;
begin
  UserNameLen := 255;
  SetLength(userName, UserNameLen);
  if GetUserName(PChar(UserName), UserNameLen) then
    Result := Copy(UserName, 1, UserNameLen - 1)
  else
    Result := 'Unknown';
end;

function IsSystemUser: boolean;
var
  sUser: string;
begin
  Result := false;
  sUser := GetUserFromWindows;
  sUser := LowerCase(sUser);
  if sUser = '' then {// no user-name (assume: system user)} begin
    Result := true;
  end else if sUser = 'systemprofile' then begin
    Result := true;
  end else if sUser = 'system' then begin
    Result := true;
  end else if sUser = 'service' then {// French} begin
    Result := true;
  end else if sUser = 'syst鑝e' then {// French} begin
    Result := true;
  end else if sUser = 'service r閟eau' then {// French} begin
    Result := true;
  end else if sUser = 'network' then begin
    Result := true;
  end else if sUser = 'network service' then begin
    Result := true;
  end else if sUser = 'local' then begin
    Result := true;
  end else if sUser = 'lokaler dienst' then begin
    Result := true; // German
  end else if sUser = 'local service' then begin
    Result := true; // French
  end else if sUser = 'lokalerdienst' then begin
    Result := true; // German
  end else if sUser = 'localservice' then begin
    Result := true; // German
  end else if sUser = 'system local' then begin
    Result := true;
  end;
end;
function GetUserA(var bIsSystem: boolean): string;
var sStr: string; iSize: Cardinal; sResult: string; bDirect: boolean;
begin
  bIsSystem := False;
  bDirect := True;
  //
  SetLength(sStr, 256);
  iSize := 254;
  GetUserName(PChar(sStr), iSize);
  if iSize = 0 then begin
    sStr := '';
  end else begin
    SetLength(sStr, iSize);
  end;
  Result := WideLowerCase(trim(sStr));
  if bDirect then begin
    if Result = 'network' then { // French } begin
      bIsSystem := True;
      sResult := ReadVar('REDMON_USER');
      if sResult <> '' then Result := sResult;
    end;
    if Result = 'network service' then { // French } begin
      bIsSystem := True;
      sResult := ReadVar('REDMON_USER');
      if sResult <> '' then Result := sResult;
    end;
    if Result = 'local' then { // French } begin
      bIsSystem := True;
      sResult := ReadVar('REDMON_USER');
      if sResult <> '' then Result := sResult;
    end;
    if Result = 'local service' then { // English } begin
      bIsSystem := True;
      sResult := ReadVar('REDMON_USER');
      if sResult <> '' then Result := sResult;
    end;
    if Result = 'lokaler dienst' then { // German } begin
      bIsSystem := True;
      sResult := ReadVar('REDMON_USER');
      if sResult <> '' then Result := sResult;
    end;
    if Result = 'lokalerdienst' then { // German } begin
      bIsSystem := True;
      sResult := ReadVar('REDMON_USER');
      if sResult <> '' then Result := sResult;
    end;
    if Result = 'localservice' then { // German } begin
      bIsSystem := True;
      sResult := ReadVar('REDMON_USER');
      if sResult <> '' then Result := sResult;
    end;
    if Result = 'system' then begin
      bIsSystem := True;
      sResult := ReadVar('REDMON_USER');
      if sResult <> '' then Result := sResult;
    end;
    if Result = 'système' then { // French } begin
      bIsSystem := True;
      sResult := ReadVar('REDMON_USER');
      if sResult <> '' then Result := sResult;
    end;
    if Result = 'system local' then { // French } begin
      bIsSystem := True;
      sResult := ReadVar('REDMON_USER');
      if sResult <> '' then Result := sResult;
    end;
    if Result = 'service réseau' then { // French|Network service } begin
      bIsSystem := True;
      sResult := ReadVar('REDMON_USER');
      if sResult <> '' then Result := sResult;
    end;
    if Result = 'service' then { // French } begin
      bIsSystem := True;
      sResult := ReadVar('REDMON_USER');
      if sResult <> '' then Result := sResult;
    end;
    if Result = 'systemprofile' then { // German } begin
      bIsSystem := True;
      sResult := ReadVar('REDMON_USER');
      if sResult <> '' then Result := sResult;
    end;
    if Result = '' then begin
      bIsSystem := True;
      sResult := ReadVar('REDMON_USER');
      if sResult <> '' then Result := sResult;
    end;
  end;
end;

// ==============================================================================
// RunAs Logic
// ==============================================================================

function GetProfPathByUserName(var sUserName: string): string;
var PIDArray: array [0 .. 1023] of DWORD; cb: DWORD; i: Integer;
  ProcCount: Integer; hMod: HMODULE; hProcess: THandle;
  ModuleName: array [0 .. 300] of Char; hAccessToken: THandle;
  InfoBuffer: PChar; AccountName: array [0 .. 500] of Char;
  DomainName: array [0 .. 500] of Char; InfoBufferSize: Cardinal;
  AccountSize: Cardinal; DomainSize: Cardinal; snu: SID_NAME_USE; PC: PWideCHAR;
  Len: DWORD;
begin
  Result := '';
  EnumProcesses(@PIDArray, SizeOf(PIDArray), cb);
  ProcCount := cb div SizeOf(DWORD);
  for i := (ProcCount - 1) downto 0 do begin
    hProcess := OpenProcess(PROCESS_QUERY_INFORMATION or PROCESS_VM_READ, False,
      PIDArray[i]);
    if (hProcess <> 0) then begin
      EnumProcessModules(hProcess, @hMod, SizeOf(hMod), cb);
      GetModuleFilenameEx(hProcess, hMod, ModuleName, SizeOf(ModuleName));
      try
        if OpenProcessToken(hProcess, TOKEN_READ, hAccessToken) then begin
          InfoBufferSize := 1000;
          AccountSize := SizeOf(AccountName);
          DomainSize := SizeOf(DomainName);
          try
            GetMem(InfoBuffer, InfoBufferSize);
            try
              GetTokenInformation(hAccessToken, TokenUser, InfoBuffer,
                InfoBufferSize, InfoBufferSize);
              LookupAccountSid(nil, PSIDAndAttributes(InfoBuffer)^.sid,
                AccountName, AccountSize, DomainName, DomainSize, snu)
            finally FreeMem(InfoBuffer);
            end;
            if LowerCase(sUserName) = LowerCase(trim(AccountName)) then begin
              Len := 255;
              GetMem(PC, 255);
              if (not GetUserProfileDirectory(hAccessToken, PWideCHAR(PC), Len))
              then begin
                FreeMem(PC);
                GetMem(PC, Len);
                GetUserProfileDirectory(hAccessToken, PC, Len)
              end;
              Result := StrPas(PC);
              FreeMem(PC);
              if Result <> '' then begin
                CloseHandle(hAccessToken);
                CloseHandle(hProcess);
                Break;
              end;
            end;
          except
          end;
          CloseHandle(hAccessToken);
        end;
      except
      end;
      CloseHandle(hProcess);
    end;
  end;
end;

procedure CreateWinNTProcessList2(sUserName: string; var SessionID: Cardinal);
var Sessions, Session: PWTS_SESSION_INFO; NumSessions, i, NumBytes: DWORD;
  UserName: LPWSTR; // LPTSTR;
begin
  if not WTSEnumerateSessions(WTS_CURRENT_SERVER_HANDLE, 0, 1, Sessions,
    NumSessions) then RaiseLastOSError;
  try
    if NumSessions > 0 then begin
      Session := Sessions;
      for i := 0 to NumSessions - 1 do begin
        if (Session.State = WTSActive) or (Session.State = WTSConnected) or
          (Session.State = WTSDisconnected) then begin
          if WTSQuerySessionInformation(WTS_CURRENT_SERVER_HANDLE,
            Session.SessionID, WTSUserName, UserName, NumBytes) then begin
            try
              if LowerCase(UserName) = LowerCase(sUserName) then begin
              end;
              SessionID := Session.SessionID;
            finally WTSFreeMemory(UserName);
            end;
          end;
        end;
        Inc(Session);
      end;
    end;
  finally WTSFreeMemory(Sessions);
  end;

end;

function CreateWinNTProcessList(sUserName: string; var SessionID: Cardinal;
  var ProcessID, ProcessID2: Cardinal; var hToken, hToken2: Cardinal): boolean;
var PIDArray: array [0 .. 1023] of DWORD; cb: DWORD; i: Integer;
  ProcCount: Integer; hMod: HMODULE; hProcess: THandle;
  ModuleName: array [0 .. 300] of Char; hAccessToken: THandle;
  InfoBuffer: PChar; AccountName: array [0 .. 500] of Char;
  DomainName: array [0 .. 500] of Char; InfoBufferSize: Cardinal;
  AccountSize: Cardinal; DomainSize: Cardinal; snu: SID_NAME_USE;
  bFound: boolean;
begin

  //Logger.LogInfo('CreateWinNTProcessList/User: ' + sUserName);

  ProcessID := 0;
  Result := False;
  EnumProcesses(@PIDArray, SizeOf(PIDArray), cb);
  ProcCount := cb div SizeOf(DWORD);
  SessionID := 0;
  bFound := False;
  for i := 0 to ProcCount - 1 do begin
    hProcess := OpenProcess(PROCESS_QUERY_INFORMATION or PROCESS_VM_READ, False,
      PIDArray[i]);
    if (hProcess <> 0) then begin
      EnumProcessModules(hProcess, @hMod, SizeOf(hMod), cb);
      GetModuleFilenameEx(hProcess, hMod, ModuleName, SizeOf(ModuleName));
      if (pos('EXPLORER', UpperCase(ModuleName)) >= 1) or
        (pos('WINWORD', UpperCase(ModuleName)) >= 1) or
        (pos('OUTLOOK', UpperCase(ModuleName)) >= 1) or
        (pos('EXCEL', UpperCase(ModuleName)) >= 1) or
        (pos('POWER', UpperCase(ModuleName)) >= 1) or
        (pos('MSACC', UpperCase(ModuleName)) >= 1) or
        (pos('LCP_', UpperCase(ModuleName)) >= 1) or
        (pos('LCX_', UpperCase(ModuleName)) >= 1) or
        (pos('LMD_', UpperCase(ModuleName)) >= 1) or
        (pos('METADACT', UpperCase(ModuleName)) >= 1) then
        try
          InfoBufferSize := 1000;
          AccountSize := SizeOf(AccountName);
          DomainSize := SizeOf(DomainName);
          if (OpenProcessToken(hProcess, TOKEN_READ or TOKEN_DUPLICATE,
            hAccessToken)) then
            try
              GetMem(InfoBuffer, InfoBufferSize);
              try
                GetTokenInformation(hAccessToken, TokenUser, InfoBuffer,
                  InfoBufferSize, InfoBufferSize);
                LookupAccountSid(nil, PSIDAndAttributes(InfoBuffer)^.sid,
                  AccountName, AccountSize, DomainName, DomainSize, snu)
              except
              end;
              FreeMem(InfoBuffer);

              if (pos('LCP_AUTO', UpperCase(ModuleName)) >= 1) then begin
              end else begin

                if LowerCase(sUserName) = LowerCase(trim(AccountName)) then
                begin
                  ProcessID := PIDArray[i];
                  ProcessIdToSessionId(ProcessID, SessionID);
                  hToken := hAccessToken;
                  CloseHandle(hProcess);
                  Result := True;
                  bFound := True;
                end;
              end;
            except
            end;
          CloseHandle(hProcess);
        finally
        end;

      if bFound = False then begin
        if (pos('SYSTEM', UpperCase(ModuleName)) >= 1) or
          (pos('SVCHOST.EXE', UpperCase(ModuleName)) >= 1) then
          try
            InfoBufferSize := 1000;
            AccountSize := SizeOf(AccountName);
            DomainSize := SizeOf(DomainName);
            if (OpenProcessToken(hProcess, TOKEN_READ or TOKEN_DUPLICATE,
              hAccessToken)) then
              try
                GetMem(InfoBuffer, InfoBufferSize);
                try
                  GetTokenInformation(hAccessToken, TokenUser, InfoBuffer,
                    InfoBufferSize, InfoBufferSize);
                  LookupAccountSid(nil, PSIDAndAttributes(InfoBuffer)^.sid,
                    AccountName, AccountSize, DomainName, DomainSize, snu)
                except
                end;
                FreeMem(InfoBuffer);
                if LowerCase(sUserName) = LowerCase(trim(AccountName)) then
                begin
                  ProcessID2 := PIDArray[i];
                  ProcessIdToSessionId(ProcessID2, SessionID);
                  hToken2 := hAccessToken;
                  CloseHandle(hProcess);
                  // Break;
                  Result := True;
                end;
              except
              end;
            CloseHandle(hProcess);
          finally
          end;
      end;
    end;
  end;
end;

const TOKEN_ALL_ACCESS_NT4: Cardinal = STANDARD_RIGHTS_REQUIRED +
    TOKEN_ASSIGN_PRIMARY + TOKEN_DUPLICATE + TOKEN_IMPERSONATE + TOKEN_QUERY +
    TOKEN_QUERY_SOURCE + TOKEN_ADJUST_PRIVILEGES + TOKEN_ADJUST_GROUPS +
    TOKEN_ADJUST_DEFAULT;

function ReadVar(XENV: PWideCHAR): string;
  procedure NullString(var sStr: string);
  var iNo: Integer;
  begin
    iNo := pos(#0, sStr);
    if iNo >= 1 then begin
      SetLength(sStr, iNo - 1);
    end;
  end;

var EnvString: string;
begin
  SetLength(EnvString, 1024);
  if (GetEnvironmentVariableW(XENV, PWideCHAR(EnvString), 1023) <> 0) then begin
    Result := trim(EnvString);
  end else begin
    Result := '';
  end;
  NullString(Result);
end;

procedure RunAsUser(Application, Parameters: string;
  SessionID, hProcess, hProcess2, hToken, hToken2: Cardinal; sRunUser: string);
var Token: TJwSecurityToken;
  StartupInfo: Windows._STARTUPINFOW;
  ProcessInformation: Windows._PROCESS_INFORMATION; sVar, sNope: string;
  iSession2: Integer; pi: TJwProfileInfo; pEnv: Pointer; bOK: boolean;
begin
  FillChar(StartupInfo, SizeOf(StartupInfo), #0);
  StartupInfo.lpDesktop := 'winsta0\default';
  StartupInfo.cb := SizeOf(StartupInfo);
  StartupInfo.lpDesktop := 'default';
  //
  if (SessionID <= 0) then begin
    iSession2 := -1;
    sVar := ReadVar('REDMON_SESSIONID');
    TryStrToInt(sVar, iSession2);
    if iSession2 >= 0 then begin
      SessionID := iSession2;
    end;
  end;
  // Vista Check
  if (DSiGetTrueWindowsVersion >= wvWinVista) then begin
    if SessionID = 0 then begin
      SessionID := 1;
    end;
  end;
  //
  Token := nil;
  bOK := False;
  if bOK = False then begin
    try
      Token := TJwSecurityToken.CreateTokenByProcess(hProcess2,
        TOKEN_ALL_ACCESS);
      Token.SetTokenSessionId(SessionID);
      bOK := True;
    except
      on E: Exception do begin
        bOK := False;
      end;
    end;
  end;
  //
  if bOK = False then begin
    try
      Token := TJwSecurityToken.CreateWTSQueryUserToken(SessionID);
      bOK := True;
    except
      on E: Exception do begin
        bOK := False;
      end;
    end;
  end;

  if bOK = False then begin
    try
      Token := TJwSecurityToken.CreateTokenByProcessId(hToken2,
        TOKEN_ALL_ACCESS);
      Token.SetTokenSessionId(SessionID);
      bOK := True;
    except
      bOK := False;
    end;
  end;

  if bOK = False then begin
    try
      Token := TJwSecurityToken.CreateWTSQueryUserToken(0);
      Token.SetTokenSessionId(SessionID);
      bOK := True;
    except
      bOK := False;
    end;
  end;

  if bOK = False then begin
    try
      Token := TJwSecurityToken.CreateTokenByProcess(hProcess,
        TOKEN_ALL_ACCESS);
      Token.SetTokenSessionId(SessionID);
      bOK := True;
    except
      bOK := False;
    end;
  end;

  if bOK = False then begin
    try
      Token := TJwSecurityToken.CreateTokenByProcessId(hProcess,
        TOKEN_ALL_ACCESS);
      Token.SetTokenSessionId(SessionID);
      bOK := True;
    except bOK := False;
    end;
  end;

  if bOK = False then begin
    try
      Token := TJwSecurityToken.CreateTokenByProcessId(hToken,
        TOKEN_ALL_ACCESS);
      Token.SetTokenSessionId(SessionID);
      bOK := True;
    except
      bOK := False;
    end;
  end;

  if bOK = False then begin
    try
      Token := TJwSecurityToken.CreateTokenByProcessId(hProcess2,
        TOKEN_ALL_ACCESS);
      Token.SetTokenSessionId(SessionID);
      bOK := True;
    except
      bOK := False;
    end;
  end;

  if bOK then begin
    // Keep compiler happy
  end;

  sNope := sRunUser;
  Parameters := ' ! ' + Parameters + '^^^^' + sNope;

  try Token.SetTokenSessionId(SessionID);
  except
  end;

  try Token.SetPrivilegeEnabled('SeRestorePrivilege', True);
  except
  end;
  pi.UserName := sRunUser;
  try Token.LoadUserProfile(pi, []);
  except
    on E: Exception do begin
    end;
  end;
  if not CreateEnvironmentBlock(@pEnv, Token.TokenHandle, True) then begin
  end;

  try
    if Windows.CreateProcessAsUser(Token.TokenHandle, PWideCHAR(Application),
      PWideCHAR(Parameters), nil, nil, False, CREATE_DEFAULT_ERROR_MODE or
      NORMAL_PRIORITY_CLASS or CREATE_NEW_CONSOLE or CREATE_UNICODE_ENVIRONMENT,
      pEnv, nil, StartupInfo, ProcessInformation) = False then begin
    end else begin
    end;
  except
    on E: Exception do begin
    end;
  end;
  try DestroyEnvironmentBlock(pEnv);
  except
  end;
end;

procedure LoadProfileA(sUser: string = '');
var T: TJwSecurityToken; pi: TJwProfileInfo; bInit: boolean;
begin
  T := nil;
  bInit := True;
  try T := TJwSecurityToken.CreateTokenByProcess(0, TOKEN_ALL_ACCESS);
  except
    try T := TJwSecurityToken.CreateCompatibilityQueryUserToken
        (STANDARD_RIGHTS_REQUIRED);
    except bInit := False;
    end;
  end;
  try
    if sUser = '' then begin
      pi.UserName := T.GetTokenUserName;
    end else begin
      pi.UserName := sUser;
    end;
    T.LoadUserProfile(pi, []);
  except
    if bInit then T.Free;
  end;
end;

end.
