{===============================================================================
  Change-Pro Suite
  Copyright (c) Feb 2005-2017 by Litera Corp. All rights reserved.

  Description:
  High-level GS API
===============================================================================}
unit pdsGs;
interface

uses Forms, Classes, Messages, Dialogs, Windows, SysUtils, Registry,
  winspool, printers;

{$B+}
type
  eGsLevel = (e12, e13, e14);
  eGsRes = (e300, e600);

type
  TpdfOutput = procedure(var s1, s2: string) of object;
  TpdfOutputDel = procedure() of object;
  TpdfAnimateStart = procedure() of object;
  TpdfAnimateStop = procedure() of object;
  TpdfSaveStream = procedure(ms: TMemoryStream) of object;

  TpdfPrintSetting = class(TObject)
  private
  public
    bPdfOrTifforPNG: integer;
    // dir_gsLib: string;
    // == General
    bNoSavePwd: boolean;
    // eGLevel: eGsLevel; // 1.3, 1.4, 1.5
    eGResolution: eGsRes; // 300, 600 (Default = 600)
    // iGRotate: Integer; // 1=None, 2=All, 3=ByPage
    meta_bBlackAndWhite: boolean; // Always false, True = B/W
    // == Security
    pass_bPass1: boolean;
    pass_bPass2: boolean;
    pass_sOwner: string;
    pass_sUser: string;
    // == Metadata Stuff
    pass_iT0: integer;
    pass_iT1: integer;
    pass_iT2: integer;
    pass_iT3: integer;
    pass_iT4: integer;
    pass_iT5: integer;
    //
    desktophide: boolean;
    //
    meta_bGLoadAdobe: boolean;
    meta_bNoMeta: boolean;
    meta_sAuthor: string;
    meta_bDateCreate: boolean;
    meta_bDateCreate2: TdateTime;
    meta_sCreator: string;
    meta_sKeywords: string;
    meta_sSubject: string;
    meta_sTitle: string;
    meta_sProducer: string;
    // MetaLists
    list_Title: TStringList;
    list_Subject: TStringList;
    list_Keywords: TStringList;
    list_Author: TStringList;
    list_Producer: TStringList;
    list_Creator: TStringList;
    sTempDir: string;

    bDefaultDir: boolean;
    sDefaultDir: string;
    //
    slug: boolean;
    bPDF2b: boolean;
    //
    bPDF2bFile: TpdfOutput;
    bPDF2bFileDel: TpdfOutputDel;

    bPDFMainAnimateStart: TpdfAnimateStart;
    bPDFMainAnimateStop: TpdfAnimateStop;
    bPDFMainSaveSlug: TpdfSaveStream;

    //
    constructor Create;
    destructor Destroy; override;
    procedure LoadSaveFromRegistry(bSaveOrLoad: boolean; sDrive: string);
    //
    procedure LoadSavePDF2B(var s1: string; var s2: string);
    procedure DeletePDF2BFiles;
    //
    procedure SaveSlug(ms: TMemoryStream);
    procedure AnimateStart;
    procedure AnimateStop;
  end;

function pdfCreate(sIn, sOut: string; hOpt: TpdfPrintSetting;
  var sOutPNG: string; sTiffDocName: string): boolean;
function EncodeDateA(bBool: boolean; TimeIn: TDateTime): string;
function EncodeChars(sIn: string): string;
function GetFileInUse(FileName: string): boolean;

implementation

uses pdrWinExec,
  cpsInstaller, cpsGlobal, pdfgs2;

constructor TpdfPrintSetting.Create;
begin
  inherited;
  bPdfOrTifforPNG := 0; // PDF is always true
  // == General =================================================================
  bPDF2b := false;
  eGResolution := e300;
  // iGRotate := 0;
  // == Security ================================================================
  pass_sOwner := '';
  pass_sUser := '';
  pass_bPass1 := True;
  pass_bPass2 := false;
  pass_iT0 := 0;
  pass_iT1 := 0;
  pass_iT2 := 0;
  pass_iT3 := 0;
  pass_iT4 := 0;
  pass_iT5 := 0;
  desktophide := false;
  // == Metadata ================================================================
  meta_sAuthor := '';
  meta_bDateCreate := false;
  // meta_sDateMod := '';
  meta_sCreator := '';
  meta_sKeywords := '';
  meta_sSubject := '';
  meta_sTitle := '';
  meta_sProducer := '';
  meta_sCreator := '';
  // == Metadata Lists ==========================================================
  list_Title := TStringList.Create;
  list_Subject := TStringList.Create;
  list_Keywords := TStringList.Create;
  list_Author := TStringList.Create;
  list_Producer := TStringList.Create;
  list_Creator := TStringList.Create;
  sTempDir := '';
  sDefaultDir := '';
  bDefaultDir := false;
  meta_bBlackAndWhite := false;
  slug := false;
end;

destructor TpdfPrintSetting.Destroy;
begin
  inherited;
  list_Title.Destroy;
  list_Subject.Destroy;
  list_Keywords.Destroy;
  list_Author.Destroy;
  list_Producer.Destroy;
  list_Creator.Destroy;
end;

procedure TpdfPrintSetting.LoadSavePDF2B(var s1: string; var s2: string);
begin
  if assigned(bPDF2bFile) then begin
    bPDF2bFile(s1, s2);
  end;
end;

procedure TpdfPrintSetting.DeletePDF2BFiles;
begin
  if assigned(bPDF2bFileDel) then begin
    bPDF2bFileDel;
  end;
end;

procedure TpdfPrintSetting.AnimateStart;
begin
  if assigned(bPDFMainAnimateStart) then begin
    bPDFMainAnimateStart;
  end;
  //
end;

procedure TpdfPrintSetting.AnimateStop;
begin
  if assigned(bPDFMainAnimateStop) then begin
    bPDFMainAnimateStop;
  end;
end;

procedure TpdfPrintSetting.SaveSlug(ms: TMemoryStream);
begin
  if assigned(bPDFMainSaveSlug) then begin
    bPDFMainSaveSlug(ms);
  end;
end;

// %%BeginNonPPDFeature: NumCopies 5

function PaperSize(sFilename: string): integer;
var isLetter: TStringList; iNo: integer; sNo: string; bResult: boolean;
begin
  bResult := false;
  isLetter := TStringList.Create;
  isLetter.LoadFromFile(sFilename);
  for iNo := 0 to isLetter.Count - 1 do begin
    sNo := isLetter.Strings[iNo];
    if Pos('*PageSize Letter', sNo) >= 1 then begin
      bResult := True;
    end;
  end;
  isLetter.Free;
  if bResult then begin
    Result := 2;
  end else begin
    Result := 0;
  end;
end;

procedure TpdfPrintSetting.LoadSaveFromRegistry(bSaveOrLoad: boolean;
  sDrive: string);
var reg: TRegistry; pass_bUse: boolean; bS1: integer;
  bS0, bS2, bS3, bS4, bS5, bS7: boolean;
begin
  pass_bUse := false;
  //
  reg := TRegistry.Create(KEY_READ or KEY_WRITE);
  reg.RootKey := HKEY_CURRENT_USER;
  reg.OpenKey(sRegCPPRN, True);
  if bSaveOrLoad then begin
    // == General ===============================================================
    // reg.WriteInteger(sRegCPPRN_eRotate, iGRotate);
    // == Security ==============================================================
    reg.WriteInteger(sRegCPPRN_bT1, pass_iT1);
    reg.WriteInteger(sRegCPPRN_bT2, pass_iT2);
    reg.WriteInteger(sRegCPPRN_bT3, pass_iT3);
    reg.WriteInteger(sRegCPPRN_bT4, pass_iT4);
    reg.WriteInteger(sRegCPPRN_bT5, pass_iT5);
    reg.WriteBool(sRegCPPRN_bPass1, pass_bPass1);
    reg.WriteBool(sRegCPPRN_bPass2, pass_bPass2);
    if bNoSavePwd then begin
    end else begin
      reg.WriteString(sRegCPPRN_sPass1, pass_sOwner);
      reg.WriteString(sRegCPPRN_sPass2, pass_sUser);
    end;
    reg.WriteBool(sRegCPPRN_Slug, slug);

    // == Metadata Lists ========================================================
    reg.WriteString(sRegCPPRN_Producer, meta_sProducer);
    reg.WriteString(sRegCPPRN_Creator, meta_sCreator);
    reg.WriteBool(sRegCPPRN_Acrobat, meta_bGLoadAdobe);
    reg.WriteBool(sRegCPPRN_NoMeta, meta_bNoMeta);
    reg.WriteString(sRegCPPRN_TitleA, list_Title.Text);
    reg.WriteString(sRegCPPRN_SubjectA, list_Subject.Text);
    reg.WriteString(sRegCPPRN_KeyWordsA, list_Keywords.Text);
    reg.WriteString(sRegCPPRN_AuthorA, list_Author.Text);
    reg.WriteString(sRegCPPRN_ProducerA, list_Producer.Text);
    reg.WriteString(sRegCPPRN_CreatorA, list_Creator.Text);
    reg.WriteBool(sRegCPPRN_bCreationDate, meta_bDateCreate);
    reg.WriteBool(sRegCPPRN_SilentImage, false);
    reg.WriteString(sRegCPPRN_sCustomDir, sDefaultDir);

  end else begin
    bPdfOrTifforPNG := 0;


    if reg.ValueExists(sRegCPPRN_Producer) then begin
      meta_sProducer := reg.ReadString(sRegCPPRN_Producer);
    end;
    if reg.ValueExists(sRegCPPRN_Creator) then begin
      meta_sCreator := reg.ReadString(sRegCPPRN_Creator);
    end;
    if reg.ValueExists(sRegCPPRN_Acrobat) then begin
      meta_bGLoadAdobe := reg.ReadBool(sRegCPPRN_Acrobat);
    end;
    if reg.ValueExists(sRegCPPRN_NoMeta) then begin
      meta_bNoMeta := reg.ReadBool(sRegCPPRN_NoMeta);
    end;
    // == Metadata Lists
    if reg.ValueExists(sRegCPPRN_TitleA) then begin
      list_Title.Text := reg.ReadString(sRegCPPRN_TitleA);
    end;
    if reg.ValueExists(sRegCPPRN_SubjectA) then begin
      list_Subject.Text := reg.ReadString(sRegCPPRN_SubjectA);
    end;
    if reg.ValueExists(sRegCPPRN_KeyWordsA) then begin
      list_Keywords.Text := reg.ReadString(sRegCPPRN_KeyWordsA);
    end;
    if reg.ValueExists(sRegCPPRN_AuthorA) then begin
      list_Author.Text := reg.ReadString(sRegCPPRN_AuthorA);
    end;
    if reg.ValueExists(sRegCPPRN_ProducerA) then begin
      list_Producer.Text := reg.ReadString(sRegCPPRN_ProducerA);
    end;
    if reg.ValueExists(sRegCPPRN_CreatorA) then begin
      list_Creator.Text := reg.ReadString(sRegCPPRN_CreatorA);
    end;
    if reg.ValueExists(sRegCPPRN_bCreationDate) then begin
      meta_bDateCreate := reg.ReadBool(sRegCPPRN_bCreationDate);
    end;

    if reg.ValueExists(sRegCPPRN_Slug) then begin
      slug := reg.ReadBool(sRegCPPRN_Slug);
    end;
    //
    if sDefaultDir <> '' then begin
      sDefaultDir := csFiles.SetAddSlash(sDefaultDir);
    end else begin
    end;

    if sDefaultDir = '' then begin
      if reg.ValueExists(sRegCPPRN_sCustomDir) then begin
        sDefaultDir := reg.ReadString(sRegCPPRN_sCustomDir);
      end;
    end;

    if sDefaultDir = '' then begin
      bDefaultDir := True;
    end;

    // == Logic 1: High Security
    if reg.ValueExists(sRegCPPRN_bS0a) then begin
      bS0 := reg.ReadBool(sRegCPPRN_bS0a);
    end else begin
      bS0 := false;
    end;
    if bS0 = True then begin
      if reg.ValueExists(sRegCPPRN_HighSecurityA) then begin
        pass_bUse := reg.ReadBool(sRegCPPRN_HighSecurityA);
      end;
      bS1 := 0;
      bS3 := True;
      bS2 := True;
      bS5 := True;
      bS4 := True;
      bS7 := True;
      if reg.ValueExists(sRegCPPRN_bS1a) then begin
        bS1 := reg.ReadInteger(sRegCPPRN_bS1a);
      end;
      if reg.ValueExists(sRegCPPRN_bS2a) then begin
        bS2 := reg.ReadBool(sRegCPPRN_bS2a);
      end;
      if reg.ValueExists(sRegCPPRN_bS3a) then begin
        bS3 := reg.ReadBool(sRegCPPRN_bS3a);
      end;
      if reg.ValueExists(sRegCPPRN_bS4a) then begin
        bS4 := reg.ReadBool(sRegCPPRN_bS4a);
      end;
      if reg.ValueExists(sRegCPPRN_bS5a) then begin
        bS5 := reg.ReadBool(sRegCPPRN_bS5a);
      end;
      if reg.ValueExists(sRegCPPRN_bS7a) then begin
        bS7 := reg.ReadBool(sRegCPPRN_bS7a);
      end;
      if pass_bUse then begin
        pass_iT1 := 1;
      end else begin
        pass_iT1 := 0;
      end;
      if bS1 = 0 then begin
        pass_iT2 := 0;
      end;
      if bS1 = 1 then begin
        pass_iT2 := 1;
      end;
      if bS1 = 2 then begin
        pass_iT2 := 2;
      end;
      // == Copying + Content
      if bS2 then begin
        pass_iT3 := 2;
      end else begin
        pass_iT3 := 0;
        if bS3 then begin
          pass_iT3 := 1;
        end else begin
        end;
      end;
      // == Doc Assembly
      if bS4 then begin
        pass_iT4 := 1;
      end else begin
        pass_iT4 := 0;
      end;
      if bS3 then begin
        pass_iT5 := 1;
      end else begin
        pass_iT5 := 0;
      end;
      if bS5 then begin
        pass_iT5 := 5;
      end else begin
        if bS7 then begin
          pass_iT5 := 3;
        end else begin
          pass_iT5 := 4;
        end;
      end;
    end;
  end;
  reg.Free;
end;

function EncodeChars(sIn: string): string;
var iNo, iCount: integer; sOutput: string;
begin
  StringReplace(sIn, '\', '\\', [rfReplaceAll]);
  StringReplace(sIn, '{', '\{', [rfReplaceAll]);
  StringReplace(sIn, '}', '\}', [rfReplaceAll]);
  StringReplace(sIn, '}', '\}', [rfReplaceAll]);
  StringReplace(sIn, '[', '\]', [rfReplaceAll]);
  StringReplace(sIn, ']', '\[', [rfReplaceAll]);
  StringReplace(sIn, '(', '\)', [rfReplaceAll]);
  StringReplace(sIn, ')', '\(', [rfReplaceAll]);
  iCount := Length(sIn);
  sOutput := '';
  for iNo := 1 to iCount do begin
    // ==
    if Ord(sIn[iNo]) > 127 then begin
      sOutput := '\' + sOutput + IntToHex(Ord(sIn[iNo]), 7);
    end else begin
      sOutput := sOutput + sIn[iNo]
    end;
  end;
  Result := sOutput;
end;

function GetFileInUse(FileName: string): boolean;
var hFileRes: HFILE;
begin
  Result := false;
  if not FileExists(FileName) then exit;
  hFileRes := CreateFileW(PWideChar(FileName), GENERIC_READ or GENERIC_WRITE, 0,
    nil, OPEN_EXISTING, FILE_ATTRIBUTE_NORMAL, 0);
  Result := (hFileRes = INVALID_HANDLE_VALUE);
  if not Result then CloseHandle(hFileRes);
end;

function FileSize(FileName: string): Int64;
var SearchRec: TSearchRec;
begin
  if FindFirst(FileName, faAnyFile, SearchRec) = 0 then
      Result := Int64(SearchRec.FindData.nFileSizeHigh) shl Int64(32) +

      Int64(SearchRec.FindData.nFileSizeLow)
  else Result := 0;
  FindClose(SearchRec);
end;

function EncodeDateA(bBool: boolean; TimeIn: TDateTime): string;
var wYear, wMonth, wDay: Word; wHour, wMin, wSec, wMSec: Word; sDate: string;
begin
  DecodeDate(TimeIn, wYear, wMonth, wDay);
  DecodeTime(TimeIn, wHour, wMin, wSec, wMSec);
  sDate := 'D:' + Format('%4d%.2d%.2d%.2d%.2d%.2d', [wYear, wMonth, wDay, wHour,
    wMin, wSec]);
  Result := sDate;
end;

function AB(sIn: string; hGsSetting: TpdfPrintSetting): boolean;
const crlf = #13#10;
var
  sMeta: ansistring;aFile: TFileStream; sNewIn: string;
begin
  sMeta := ansistring(crlf + '%!PS-Adobe-3.0 EPSF-3.0' + crlf +
    '%%BoundingBox: 0 0 72 72' + crlf + '%%EndProlog' + crlf +
    '/pdfmark where {pop} {userdict /pdfmark /cleartomark load put} ifelse' +
    crlf + '[/Author (' + EncodeChars(hGsSetting.meta_sAuthor) + ')' + crlf +
    '/CreationDate (' + EncodeChars(EncodeDateA(hGsSetting.meta_bDateCreate, hGsSetting.meta_bDateCreate2)) + ')' +
    crlf + '/Creator ( '+ EncodeChars(hGsSetting.meta_sCreator) + ')' + crlf +
    '/ModDate (' + EncodeChars(EncodeDateA(hGsSetting.meta_bDateCreate, hGsSetting.meta_bDateCreate2)) + ')' + crlf
    + '/Producer (' + EncodeChars(hGsSetting.meta_sProducer) + ')' + crlf +
    '/Subject (' + EncodeChars(hGsSetting.meta_sSubject) + ')' + crlf + '/Title (' +
    EncodeChars(hGsSetting.meta_sTitle) + ')' + crlf +
    '/DOCINFO pdfmark' + crlf + '%%EOF');
  if FileExists(sIn) then begin
    if GetFileInUse(sIn) then begin
      sNewIn := ChangeFileExt(sIn, '.ph2');
      CopyFile(PChar(sIn), PChar(sNewIn), True);
      if FileExists(sNewIn) then begin
        aFile := TFileStream.Create(sNewIn, fmOpenReadWrite + fmShareDenyNone);
        aFile.Size;
        aFile.Seek(aFile.Size, soBeginning);
        aFile.Write(sMeta[1], Length(sMeta));
        aFile.Destroy;
      end;
      sIn := sNewIn;
    end else begin
      aFile := TFileStream.Create(sIn, fmOpenReadWrite + fmShareDenyNone);
      aFile.Size;
      aFile.Seek(aFile.Size, soBeginning);
      aFile.Write(sMeta[1], Length(sMeta));
      aFile.Destroy;
    end;
  end;
  Result := True;
end;

function pdfCreate(sIn, sOut: string; hOpt: TpdfPrintSetting;
  var sOutPNG: string; sTiffDocName: string): boolean;
var sParams: TStringList; iPerm: integer;
  sP1, sP2: string; bPT1, bPT2, bPT3, bPT4, bPT5, bPT6, bPT7, bPT8: boolean;
  iSize: integer; iCountA: integer; iDoc1, iDoc2: integer; iCapture1: integer;
  PageHeight, PageWidth: Double; iPCount, iPNo: integer; Ms1: TMemoryStream;
  ms: TMemoryStream; sWin1, sWin2: string;
begin
  hOpt.AnimateStart;
  InitGSDLL;
  //
  AB(sIn, hOpt);
  //
  sParams := TStringList.Create;
  sParams.Add('pstopdf');
  sParams.Add('-I' + gsLib);
  sParams.Add('-q');
  sParams.Add('-dNOPAUSE');
  sParams.Add('-dBATCH');

  sParams.Add('-sFONTPATH=' + GetFontsDirectoryX);
  if hOpt.bPdfOrTifforPNG = 0 then begin
    sParams.Add('-sDEVICE=pdfwrite'); // for now.
    sParams.Add('-sOutputFile=' + sOut);
    sParams.Add('-dCompatibilityLevel#1.3');
    sParams.Add('-dAutoRotatePages=/All');
    if hOpt.meta_bBlackAndWhite then begin
      sParams.Add('-dProcessColorModel#/DeviceGray');
      sParams.Add('-sColorConversionStrategy=Gray');
    end;
    sParams.Add('-dDoNumCopies');
    sParams.Add('-dNumRenderingThreads=12');
    sParams.Add('-dNOGC');
    sParams.Add('-c "20000000 setvmthreshold"');
    sParams.Add('.setpdfwrite');
  end;

  if hOpt.bPdfOrTifforPNG = 2 then begin
    sParams.Add('-sDEVICE=pdfwrite'); // for now.
    if hOpt.bPDF2b = false then begin
      sParams.Add('-dPDFA=1');
    end else begin
      sParams.Add('-dPDFA=2');
    end;
    sParams.Add('-sOutputFile=' + sOut);
    sParams.Add('-dCompatibilityLevel#1.4');
    sParams.Add('-dAutoRotatePages=/All');
    if hOpt.meta_bBlackAndWhite then begin
      sParams.Add('-dProcessColorModel#/DeviceGray');
      sParams.Add('-sColorConversionStrategy=Gray');
      sParams.Add('-sColorConversionStrategyForImages=Gray');
      sParams.Add('-dOverrideICC');
      sParams.Add('-dPDFUseOldCMS=false');
    end else begin
      if hOpt.bPDF2b = false then begin
        sParams.Add('-sProcessColorModel=DeviceCMYK');
      end else begin
        sParams.Add('-sProcessColorModel=DeviceRGB');
        sParams.Add('-sColorConversionStrategy=RGB');
        sParams.Add('-sColorConversionStrategyForImages=RGB');
        sParams.Add('-dOverrideICC=true');
      end;
    end;
    sParams.Add('-dDoNumCopies');
    sParams.Add('-dNumRenderingThreads=12');
    sParams.Add('-dNOGC');
    sParams.Add('-c "20000000 setvmthreshold"');
    sParams.Add('.setpdfwrite');
  end;
  if hOpt.bPdfOrTifforPNG = 1 then begin
    sOutPNG := ExtractFilePath(sOut) +
      ChangeFileExt(ExtractFileName(sTiffDocName), '') + '-%00d.tif';
    sParams.Add('-sDEVICE=tiffg4');
    sParams.Add('-sOutputFile=' + sOutPNG);
  end;
  if hOpt.bPdfOrTifforPNG = 3 then begin
    sParams.Add('-sDEVICE=png16m');
    sParams.Add('-r75');
  end;
  bPT8 := True;
  iSize := 0;
  sParams.Add('-f');
  sParams.Add(sIn);
  if hOpt.bPdfOrTifforPNG = 2 then begin
    if hOpt.bPDF2b = false then begin
    end else begin
      hOpt.LoadSavePDF2B(sWin1, sWin2);
      sParams.Add('-sOutputICCProfile=' + sWin2);
      sParams.Add(sWin1);
    end;
  end;
  Result := CallGS(sParams);
  sParams.Free;
  if hOpt.bPdfOrTifforPNG = 2 then begin
    if hOpt.bPDF2b = false then begin
    end else begin
      hOpt.DeletePDF2BFiles;
    end;
  end;
  if iGSDLLHandle >= 32 then begin
    FreeLibrary(iGSDLLHandle);
  end;
  hOpt.AnimateStop;
end;

end.
