{ ===============================================================================
  Change-Pro Suite
  Copyright (c) Feb 2005-2017 by Litera Corp. All rights reserved.

  Description:
  Version Info API
  =============================================================================== }
unit cpsVerInfo;

interface

uses
  SysUtils,
  Windows;

type
  // Version Information Class
  csGlobalVerInfo = class
    // Get Version as String, (with Short or Long Filename). AShort - 2 numbers; AShortest - 1 number.
    class function GetVersionDigits(const AShort: boolean = false;
      const AShortest: boolean = false): widestring;
    class procedure GetExeVerInfo(sFile: string; var iMajor, iMinor, iRelease,
      iBuild: Integer);
  end;

implementation

class function csGlobalVerInfo.GetVersionDigits(const AShort: boolean = false;
  const AShortest: boolean = false): widestring;
var
  sz: longint; { used with buffer }
  Buf: pointer; { pointer to the VERINFO resource }
  VerInfoPresent: boolean; { Is verinfo present? }
  appName: string;

  procedure Init;
  var
    zSelfPath: array [0 .. 255] of char;
    L: cardinal;
  begin
    appName := {$IFDEF WXL} GetModuleName(hInstance) {$ELSE} ParamStr(0)
    {$ENDIF};
    sz := GetFileVersionInfoSize(StrPCopy(zSelfPath, appName), L);
    GetMem(Buf, sz);
    if (sz > 0) and GetFileVersionInfo(StrPCopy(zSelfPath, appName), 0, sz, Buf)
    then
      VerInfoPresent := true;
  end;

type
  // Fixed File Information in Version section
  TVS_FIXEDFILEINFO = record
    dwSignature: longint;
    dwStrucVersion: longint;
    dwFileVersionMS: longint;
    dwFileVersionLS: longint;
    dwFileFlagsMask: longint;
    dwFileFlags: longint;
    dwFileOS: longint;
    dwFileType: longint;
    dwFileSubtype: longint;
    dwFileDateMS: longint;
    dwFileDateLS: longint;
  end;

const
  // Version keys description
  acCompanyName = 'CompanyName';
  acFileDescription = 'FileDescription';
  acInternalName = 'InternalName';
  acLegalCopyright = 'LegalCopyright';
  acLegalTrademarks = 'LegalTrademarks';
  acOriginalFilename = 'OriginalFilename';
  acProductName = 'ProductName';
  acComments = 'Comments';

type
  PVerInfo = ^TVS_FIXEDFILEINFO;
var
  zKeyPath: array [0 .. 255] of char;
  Len: cardinal;
  VerInfo: PVerInfo;
begin
  // Initialize VerInfo
  Init;
  //
  // Body
  Result := 'Unknown';
  if VerInfoPresent then
  begin
    if VerQueryValue(Buf, StrPCopy(zKeyPath, '\'), pointer(VerInfo), Len) then
    begin
      if not AShort then
        Result := IntToStr(HIWORD(VerInfo.dwFileVersionMS)) + '.' +
          IntToStr(LOWORD(VerInfo.dwFileVersionMS)) + '.' +
          IntToStr(HIWORD(VerInfo.dwFileVersionLS)) + '.' +
          IntToStr(LOWORD(VerInfo.dwFileVersionLS))
      else if (not AShortest) then
        Result := IntToStr(HIWORD(VerInfo.dwFileVersionMS)) + '.' +
          IntToStr(LOWORD(VerInfo.dwFileVersionMS))
      else
        Result := IntToStr(HIWORD(VerInfo.dwFileVersionMS));
    end;
  end;
  //
  // Free
  FreeMem(Buf, sz);
end;

class procedure csGlobalVerInfo.GetExeVerInfo(sFile: string;
  var iMajor, iMinor, iRelease, iBuild: Integer);
var
  sz: longint; { used with buffer }
  Buf: pointer; { pointer to the VERINFO resource }
  VerInfoPresent: boolean; { Is verinfo present? }

  procedure Init;
  var
    zSelfPath: array [0 .. 255] of char;
    L: cardinal;
    bAlloc: boolean;
    sDir: string;
    sExe: string;
  begin
    bAlloc := false;
    VerInfoPresent := false;
    //
    sDir := ExtractFilePath(sFile);
    sExe := ExtractFileName(sFile);
    //
    if (sDir = '') then
    begin
      sFile := GetModuleName(hInstance);
    end;
    //
    //
    if FileExists(sFile) then
    begin
      sz := GetFileVersionInfoSize(StrPCopy(zSelfPath, sFile), L);
      bAlloc := true;
      GetMem(Buf, sz);
      if (sz > 0) and GetFileVersionInfo(StrPCopy(zSelfPath, sFile), 0, sz, Buf) then
      begin
        VerInfoPresent := true;
      end
      else
        VerInfoPresent := false;
    end;

    //
    if VerInfoPresent = false then
    begin
      if (bAlloc) then
      begin
        FreeMem(Buf);
      end;
    end;
  end;

type
  // Fixed File Information in Version section
  TVS_FIXEDFILEINFO = record
    dwSignature: longint;
    dwStrucVersion: longint;
    dwFileVersionMS: longint;
    dwFileVersionLS: longint;
    dwFileFlagsMask: longint;
    dwFileFlags: longint;
    dwFileOS: longint;
    dwFileType: longint;
    dwFileSubtype: longint;
    dwFileDateMS: longint;
    dwFileDateLS: longint;
  end;

const
  // Version keys description
  acCompanyName = 'CompanyName';
  acFileDescription = 'FileDescription';
  acInternalName = 'InternalName';
  acLegalCopyright = 'LegalCopyright';
  acLegalTrademarks = 'LegalTrademarks';
  acOriginalFilename = 'OriginalFilename';
  acProductName = 'ProductName';
  acComments = 'Comments';

type
  PVerInfo = ^TVS_FIXEDFILEINFO;

var
  zKeyPath: array [0 .. 255] of char;
  Len: cardinal;
  VerInfo: PVerInfo;

begin
  // Initialize VerInfo
  Init;
  //
  // Body
  if VerInfoPresent then
  begin
    if VerQueryValue(Buf, StrPCopy(zKeyPath, '\'), pointer(VerInfo), Len) then
    begin
      iMajor := (HIWORD(VerInfo.dwFileVersionMS));
      iMinor := (LOWORD(VerInfo.dwFileVersionMS));
      iRelease := (HIWORD(VerInfo.dwFileVersionLS));
      iBuild := (LOWORD(VerInfo.dwFileVersionLS));
    end;
    FreeMem(Buf, sz);
  end;
  //
  // Free
end;

end.
