unit cpsLotusOcx;

// ************************************************************************ //
// WARNING                                                                    
// -------                                                                    
// The types declared in this file were generated from data read from a       
// Type Library. If this type library is explicitly or indirectly (via        
// another type library referring to this type library) re-imported, or the   
// 'Refresh' command of the Type Library Editor activated while editing the   
// Type Library, the contents of this file will be regenerated and all        
// manual modifications will be lost.                                         
// ************************************************************************ //

// PASTLWTR : 1.2
// File generated on 8/5/2006 10:27:36 PM from Type Library described below.

// ************************************************************************  //
// Type Lib: C:\Program Files\lotus\notes\notes32.tlb (1)
// LIBID: {1CF542E0-D988-11CF-B485-00805F98FACE}
// LCID: 0
// Helpfile: 
// HelpString: Lotus Notes Automation Classes
// DepndLst: 
//   (1) v2.0 stdole, (C:\WINDOWS\system32\stdole2.tlb)
// Errors:
//   Hint: Parameter 'OBJECT' of NOTESUIDOCUMENT.CREATEOBJECT changed to 'OBJECT_'
//   Hint: Parameter 'TYPE' of NOTESUIWORKSPACE.PICKLISTSTRINGS changed to 'TYPE_'
//   Hint: Parameter 'TYPE' of NOTESUIWORKSPACE.PROMPT changed to 'TYPE_'
//   Hint: Parameter 'TYPE' of NOTESUIWORKSPACE.PICKLISTCOLLECTION changed to 'TYPE_'
//   Hint: Parameter 'TYPE' of NOTESUISCHEDULER.ADDPARTICIPANT changed to 'TYPE_'
//   Hint: Symbol 'TYPE' renamed to 'type_'
//   Hint: Parameter 'TYPE' of NOTESITEM.NEW changed to 'TYPE_'
//   Hint: Symbol 'TYPE' renamed to 'type_'
//   Hint: Parameter 'TYPE' of NOTESRICHTEXTITEM.EMBEDOBJECT changed to 'TYPE_'
//   Hint: Parameter 'CLASS' of NOTESRICHTEXTITEM.EMBEDOBJECT changed to 'CLASS_'
//   Hint: Symbol 'TYPE' renamed to 'type_'
//   Hint: Symbol 'TYPE' renamed to 'type_'
//   Hint: Member 'CLASS' of 'NOTESEMBEDDEDOBJECT' changed to 'CLASS_'
//   Hint: Member 'OBJECT' of 'NOTESEMBEDDEDOBJECT' changed to 'OBJECT_'
//   Hint: Parameter 'FILE' of NOTESDATABASE.OPENWITHFAILOVER changed to 'FILE_'
//   Hint: Parameter 'FILE' of NOTESDATABASE.CREATEREPLICA changed to 'FILE_'
//   Hint: Parameter 'FILE' of NOTESDATABASE.CREATEFROMTEMPLATE changed to 'FILE_'
//   Hint: Parameter 'FILE' of NOTESDATABASE.CREATE changed to 'FILE_'
//   Hint: Parameter 'FILE' of NOTESDATABASE.OPENIFMODIFIED changed to 'FILE_'
//   Hint: Parameter 'FILE' of NOTESDATABASE.CREATECOPY changed to 'FILE_'
//   Hint: Parameter 'FILE' of NOTESDATABASE.OPEN changed to 'FILE_'
//   Hint: Parameter 'FILE' of NOTESDATABASE.NEW changed to 'FILE_'
//   Hint: Symbol 'TYPE' renamed to 'type_'
//   Hint: Parameter 'TYPE' of NOTESSESSION.GETUSERPOLICYSETTINGS changed to 'TYPE_'
//   Hint: Parameter 'FILE' of NOTESSESSION.GETDATABASE changed to 'FILE_'
//   Hint: Parameter 'FILE' of NOTESLOG.OPENNOTESLOG changed to 'FILE_'
//   Hint: Parameter 'TYPE' of NOTESRICHTEXTPARAGRAPHSTYLE.SETTABS changed to 'TYPE_'
//   Hint: Parameter 'TYPE' of NOTESRICHTEXTPARAGRAPHSTYLE.SETTAB changed to 'TYPE_'
//   Hint: Symbol 'TYPE' renamed to 'type_'
//   Hint: Parameter 'TYPE' of NOTESRICHTEXTNAVIGATOR.FINDNTHELEMENT changed to 'TYPE_'
//   Hint: Parameter 'TYPE' of NOTESRICHTEXTNAVIGATOR.FINDFIRSTELEMENT changed to 'TYPE_'
//   Hint: Parameter 'TYPE' of NOTESRICHTEXTNAVIGATOR.FINDNEXTELEMENT changed to 'TYPE_'
//   Hint: Parameter 'TYPE' of NOTESRICHTEXTNAVIGATOR.FINDLASTELEMENT changed to 'TYPE_'
//   Hint: Parameter 'TYPE' of NOTESRICHTEXTNAVIGATOR.GETFIRSTELEMENT changed to 'TYPE_'
//   Hint: Parameter 'TYPE' of NOTESRICHTEXTNAVIGATOR.GETNEXTELEMENT changed to 'TYPE_'
//   Hint: Parameter 'TYPE' of NOTESRICHTEXTNAVIGATOR.GETNTHELEMENT changed to 'TYPE_'
//   Hint: Parameter 'TYPE' of NOTESRICHTEXTNAVIGATOR.GETLASTELEMENT changed to 'TYPE_'
//   Hint: Parameter 'BEGIN' of NOTESRICHTEXTRANGE.RESET changed to 'BEGIN_'
//   Hint: Parameter 'END' of NOTESRICHTEXTRANGE.RESET changed to 'END_'
//   Hint: Symbol 'TYPE' renamed to 'type_'
//   Hint: Member 'LABEL' of 'NOTESOUTLINEENTRY' changed to 'LABEL_'
//   Hint: Symbol 'TYPE' renamed to 'type_'
// ************************************************************************ //
{$TYPEDADDRESS OFF} // Unit must be compiled without type-checked pointers. 
{$WARN SYMBOL_PLATFORM OFF}
{$WRITEABLECONST ON}
{$VARPROPSETTER ON}
interface

uses Windows, ActiveX, Classes, Graphics, StdVCL, Variants;
  

// *********************************************************************//
// GUIDS declared in the TypeLibrary. Following prefixes are used:        
//   Type Libraries     : LIBID_xxxx                                      
//   CoClasses          : CLASS_xxxx                                      
//   DISPInterfaces     : DIID_xxxx                                       
//   Non-DISP interfaces: IID_xxxx                                        
// *********************************************************************//
const
  // TypeLibrary Major and minor versions
  lotusMajorVersion = 6;
  lotusMinorVersion = 0;

  LIBID_lotus: TGUID = '{1CF542E0-D988-11CF-B485-00805F98FACE}';
  DIID_BUTTON: TGUID = '{29131601-2EED-1069-BF5D-00DD011186B7}';
  DIID_FIELD: TGUID = '{29131603-2EED-1069-BF5D-00DD011186B7}';
  DIID_NAVIGATOR: TGUID = '{29131605-2EED-1069-BF5D-00DD011186B7}';
  DIID_NOTESUIDOCUMENT: TGUID = '{29131504-2EED-1069-BF5D-00DD011186B7}';
  DIID_NOTESUIDATABASE: TGUID = '{29131503-2EED-1069-BF5D-00DD011186B7}';
  DIID_NOTESUIVIEW: TGUID = '{29131506-2EED-1069-BF5D-00DD011186B7}';
  DIID_NOTESUIWORKSPACE: TGUID = '{29131502-2EED-1069-BF5D-00DD011186B7}';
  DIID_NOTESUISCHEDULER: TGUID = '{2913150A-2EED-1069-BF5D-00DD011186B7}';
  DIID_WEBBROWSER: TGUID = '{8856F961-340A-11D0-A96B-00C04FD705A2}';
  DIID_NOTESMIMEENTITY: TGUID = '{29131432-2EED-1069-BF5D-00DD011186B7}';
  DIID_NOTESMIMEHEADER: TGUID = '{2913144E-2EED-1069-BF5D-00DD011186B7}';
  DIID_NOTESITEM: TGUID = '{29131405-2EED-1069-BF5D-00DD011186B7}';
  DIID_NOTESRICHTEXTITEM: TGUID = '{29131406-2EED-1069-BF5D-00DD011186B7}';
  DIID_NOTESEMBEDDEDOBJECT: TGUID = '{29131410-2EED-1069-BF5D-00DD011186B7}';
  DIID_NOTESDATETIME: TGUID = '{29131408-2EED-1069-BF5D-00DD011186B7}';
  DIID_NOTESDOCUMENT: TGUID = '{29131404-2EED-1069-BF5D-00DD011186B7}';
  DIID_NOTESDOCUMENTCOLLECTION: TGUID = '{2913140B-2EED-1069-BF5D-00DD011186B7}';
  DIID_NOTESVIEWCOLUMN: TGUID = '{2913140F-2EED-1069-BF5D-00DD011186B7}';
  DIID_NOTESVIEW: TGUID = '{29131403-2EED-1069-BF5D-00DD011186B7}';
  DIID_NOTESAGENT: TGUID = '{29131409-2EED-1069-BF5D-00DD011186B7}';
  DIID_NOTESREPLICATION: TGUID = '{2913142B-2EED-1069-BF5D-00DD011186B7}';
  DIID_NOTESCOLOROBJECT: TGUID = '{29131452-2EED-1069-BF5D-00DD011186B7}';
  DIID_NOTESDATABASE: TGUID = '{29131402-2EED-1069-BF5D-00DD011186B7}';
  DIID_NOTESDBDIRECTORY: TGUID = '{2913140A-2EED-1069-BF5D-00DD011186B7}';
  DIID_NOTESSESSION: TGUID = '{29131401-2EED-1069-BF5D-00DD011186B7}';
  DIID_NOTESNEWSLETTER: TGUID = '{29131407-2EED-1069-BF5D-00DD011186B7}';
  DIID_NOTESLOG: TGUID = '{2913140C-2EED-1069-BF5D-00DD011186B7}';
  DIID_NOTESACL: TGUID = '{2913140D-2EED-1069-BF5D-00DD011186B7}';
  DIID_NOTESACLENTRY: TGUID = '{2913140E-2EED-1069-BF5D-00DD011186B7}';
  DIID_NOTESREGISTRATION: TGUID = '{29131411-2EED-1069-BF5D-00DD011186B7}';
  DIID_NOTESTIMER: TGUID = '{29131412-2EED-1069-BF5D-00DD011186B7}';
  DIID_NOTESNAME: TGUID = '{29131413-2EED-1069-BF5D-00DD011186B7}';
  DIID_NOTESFORM: TGUID = '{29131414-2EED-1069-BF5D-00DD011186B7}';
  DIID_NOTESINTERNATIONAL: TGUID = '{29131415-2EED-1069-BF5D-00DD011186B7}';
  DIID_NOTESDATERANGE: TGUID = '{29131416-2EED-1069-BF5D-00DD011186B7}';
  DIID_NOTESRICHTEXTSTYLE: TGUID = '{2913141A-2EED-1069-BF5D-00DD011186B7}';
  DIID_NOTESVIEWENTRY: TGUID = '{2913141B-2EED-1069-BF5D-00DD011186B7}';
  DIID_NOTESVIEWENTRYCOLLECTION: TGUID = '{2913141C-2EED-1069-BF5D-00DD011186B7}';
  DIID_NOTESVIEWNAVIGATOR: TGUID = '{2913142C-2EED-1069-BF5D-00DD011186B7}';
  DIID_NOTESRICHTEXTPARAGRAPHSTYLE: TGUID = '{2913141D-2EED-1069-BF5D-00DD011186B7}';
  DIID_NOTESRICHTEXTTAB: TGUID = '{2913141E-2EED-1069-BF5D-00DD011186B7}';
  DIID_NOTESRICHTEXTTABLE: TGUID = '{29131433-2EED-1069-BF5D-00DD011186B7}';
  DIID_NOTESRICHTEXTNAVIGATOR: TGUID = '{29131434-2EED-1069-BF5D-00DD011186B7}';
  DIID_NOTESRICHTEXTRANGE: TGUID = '{29131435-2EED-1069-BF5D-00DD011186B7}';
  DIID_NOTESRICHTEXTDOCLINK: TGUID = '{29131451-2EED-1069-BF5D-00DD011186B7}';
  DIID_NOTESRICHTEXTSECTION: TGUID = '{29131453-2EED-1069-BF5D-00DD011186B7}';
  DIID_NOTESOUTLINEENTRY: TGUID = '{29131430-2EED-1069-BF5D-00DD011186B7}';
  DIID_NOTESOUTLINE: TGUID = '{29131431-2EED-1069-BF5D-00DD011186B7}';
  DIID_NOTESNOTECOLLECTION: TGUID = '{29131436-2EED-1069-BF5D-00DD011186B7}';
  DIID_NOTESXMLPROCESSOR: TGUID = '{29131441-2EED-1069-BF5D-00DD011186B7}';
  DIID_NOTESDXLEXPORTER: TGUID = '{29131437-2EED-1069-BF5D-00DD011186B7}';
  DIID_NOTESDXLIMPORTER: TGUID = '{29131438-2EED-1069-BF5D-00DD011186B7}';
  DIID_NOTESXSLTRANSFORMER: TGUID = '{29131439-2EED-1069-BF5D-00DD011186B7}';
  DIID_NOTESSAXPARSER: TGUID = '{2913143A-2EED-1069-BF5D-00DD011186B7}';
  DIID_NOTESSAXATTRIBUTELIST: TGUID = '{2913143B-2EED-1069-BF5D-00DD011186B7}';
  DIID_NOTESSAXEXCEPTION: TGUID = '{2913143C-2EED-1069-BF5D-00DD011186B7}';
  DIID_NOTESDOMPARSER: TGUID = '{2913143D-2EED-1069-BF5D-00DD011186B7}';
  DIID_NOTESDOMNAMEDNODEMAP: TGUID = '{2913143E-2EED-1069-BF5D-00DD011186B7}';
  DIID_NOTESDOMNODELIST: TGUID = '{2913143F-2EED-1069-BF5D-00DD011186B7}';
  DIID_NOTESDOMNODE: TGUID = '{29131440-2EED-1069-BF5D-00DD011186B7}';
  DIID_NOTESDOMDOCUMENTNODE: TGUID = '{29131443-2EED-1069-BF5D-00DD011186B7}';
  DIID_NOTESDOMELEMENTNODE: TGUID = '{29131444-2EED-1069-BF5D-00DD011186B7}';
  DIID_NOTESDOMATTRIBUTENODE: TGUID = '{29131445-2EED-1069-BF5D-00DD011186B7}';
  DIID_NOTESDOMCHARACTERDATANODE: TGUID = '{29131458-2EED-1069-BF5D-00DD011186B7}';
  DIID_NOTESDOMCOMMENTNODE: TGUID = '{2913144B-2EED-1069-BF5D-00DD011186B7}';
  DIID_NOTESDOMTEXTNODE: TGUID = '{29131446-2EED-1069-BF5D-00DD011186B7}';
  DIID_NOTESDOMCDATASECTIONNODE: TGUID = '{29131447-2EED-1069-BF5D-00DD011186B7}';
  DIID_NOTESDOMENTITYREFERENCENODE: TGUID = '{29131448-2EED-1069-BF5D-00DD011186B7}';
  DIID_NOTESDOMENTITYNODE: TGUID = '{29131449-2EED-1069-BF5D-00DD011186B7}';
  DIID_NOTESDOMPROCESSINGINSTRUCTIONNODE: TGUID = '{2913144A-2EED-1069-BF5D-00DD011186B7}';
  DIID_NOTESDOMDOCUMENTTYPENODE: TGUID = '{2913144D-2EED-1069-BF5D-00DD011186B7}';
  DIID_NOTESDOMDOCUMENTFRAGMENTNODE: TGUID = '{29131456-2EED-1069-BF5D-00DD011186B7}';
  DIID_NOTESDOMNOTATIONNODE: TGUID = '{29131457-2EED-1069-BF5D-00DD011186B7}';
  DIID_NOTESDOMXMLDECLNODE: TGUID = '{2913144C-2EED-1069-BF5D-00DD011186B7}';
  DIID_NOTESSTREAM: TGUID = '{2913144F-2EED-1069-BF5D-00DD011186B7}';
  DIID_NOTESADMINISTRATIONPROCESS: TGUID = '{29131450-2EED-1069-BF5D-00DD011186B7}';
  DIID_NOTESREPLICATIONENTRY: TGUID = '{29131454-2EED-1069-BF5D-00DD011186B7}';
type

// *********************************************************************//
// Forward declaration of types defined in TypeLibrary                    
// *********************************************************************//
  BUTTON = dispinterface;
  FIELD = dispinterface;
  NAVIGATOR = dispinterface;
  NOTESUIDOCUMENT = dispinterface;
  NOTESUIDATABASE = dispinterface;
  NOTESUIVIEW = dispinterface;
  NOTESUIWORKSPACE = dispinterface;
  NOTESUISCHEDULER = dispinterface;
  WEBBROWSER = dispinterface;
  NOTESMIMEENTITY = dispinterface;
  NOTESMIMEHEADER = dispinterface;
  NOTESITEM = dispinterface;
  NOTESRICHTEXTITEM = dispinterface;
  NOTESEMBEDDEDOBJECT = dispinterface;
  NOTESDATETIME = dispinterface;
  NOTESDOCUMENT = dispinterface;
  NOTESDOCUMENTCOLLECTION = dispinterface;
  NOTESVIEWCOLUMN = dispinterface;
  NOTESVIEW = dispinterface;
  NOTESAGENT = dispinterface;
  NOTESREPLICATION = dispinterface;
  NOTESCOLOROBJECT = dispinterface;
  NOTESDATABASE = dispinterface;
  NOTESDBDIRECTORY = dispinterface;
  NOTESSESSION = dispinterface;
  NOTESNEWSLETTER = dispinterface;
  NOTESLOG = dispinterface;
  NOTESACL = dispinterface;
  NOTESACLENTRY = dispinterface;
  NOTESREGISTRATION = dispinterface;
  NOTESTIMER = dispinterface;
  NOTESNAME = dispinterface;
  NOTESFORM = dispinterface;
  NOTESINTERNATIONAL = dispinterface;
  NOTESDATERANGE = dispinterface;
  NOTESRICHTEXTSTYLE = dispinterface;
  NOTESVIEWENTRY = dispinterface;
  NOTESVIEWENTRYCOLLECTION = dispinterface;
  NOTESVIEWNAVIGATOR = dispinterface;
  NOTESRICHTEXTPARAGRAPHSTYLE = dispinterface;
  NOTESRICHTEXTTAB = dispinterface;
  NOTESRICHTEXTTABLE = dispinterface;
  NOTESRICHTEXTNAVIGATOR = dispinterface;
  NOTESRICHTEXTRANGE = dispinterface;
  NOTESRICHTEXTDOCLINK = dispinterface;
  NOTESRICHTEXTSECTION = dispinterface;
  NOTESOUTLINEENTRY = dispinterface;
  NOTESOUTLINE = dispinterface;
  NOTESNOTECOLLECTION = dispinterface;
  NOTESXMLPROCESSOR = dispinterface;
  NOTESDXLEXPORTER = dispinterface;
  NOTESDXLIMPORTER = dispinterface;
  NOTESXSLTRANSFORMER = dispinterface;
  NOTESSAXPARSER = dispinterface;
  NOTESSAXATTRIBUTELIST = dispinterface;
  NOTESSAXEXCEPTION = dispinterface;
  NOTESDOMPARSER = dispinterface;
  NOTESDOMNAMEDNODEMAP = dispinterface;
  NOTESDOMNODELIST = dispinterface;
  NOTESDOMNODE = dispinterface;
  NOTESDOMDOCUMENTNODE = dispinterface;
  NOTESDOMELEMENTNODE = dispinterface;
  NOTESDOMATTRIBUTENODE = dispinterface;
  NOTESDOMCHARACTERDATANODE = dispinterface;
  NOTESDOMCOMMENTNODE = dispinterface;
  NOTESDOMTEXTNODE = dispinterface;
  NOTESDOMCDATASECTIONNODE = dispinterface;
  NOTESDOMENTITYREFERENCENODE = dispinterface;
  NOTESDOMENTITYNODE = dispinterface;
  NOTESDOMPROCESSINGINSTRUCTIONNODE = dispinterface;
  NOTESDOMDOCUMENTTYPENODE = dispinterface;
  NOTESDOMDOCUMENTFRAGMENTNODE = dispinterface;
  NOTESDOMNOTATIONNODE = dispinterface;
  NOTESDOMXMLDECLNODE = dispinterface;
  NOTESSTREAM = dispinterface;
  NOTESADMINISTRATIONPROCESS = dispinterface;
  NOTESREPLICATIONENTRY = dispinterface;

// *********************************************************************//
// DispIntf:  BUTTON
// Flags:     (4096) Dispatchable
// GUID:      {29131601-2EED-1069-BF5D-00DD011186B7}
// *********************************************************************//
  BUTTON = dispinterface
    ['{29131601-2EED-1069-BF5D-00DD011186B7}']
  end;

// *********************************************************************//
// DispIntf:  FIELD
// Flags:     (4096) Dispatchable
// GUID:      {29131603-2EED-1069-BF5D-00DD011186B7}
// *********************************************************************//
  FIELD = dispinterface
    ['{29131603-2EED-1069-BF5D-00DD011186B7}']
  end;

// *********************************************************************//
// DispIntf:  NAVIGATOR
// Flags:     (4096) Dispatchable
// GUID:      {29131605-2EED-1069-BF5D-00DD011186B7}
// *********************************************************************//
  NAVIGATOR = dispinterface
    ['{29131605-2EED-1069-BF5D-00DD011186B7}']
  end;

// *********************************************************************//
// DispIntf:  NOTESUIDOCUMENT
// Flags:     (4096) Dispatchable
// GUID:      {29131504-2EED-1069-BF5D-00DD011186B7}
// *********************************************************************//
  NOTESUIDOCUMENT = dispinterface
    ['{29131504-2EED-1069-BF5D-00DD011186B7}']
    procedure NAVBARSPINNERSTART; dispid 1788;
    procedure NAVBARSPINNERSTOP; dispid 1789;
    procedure FINDFREETIMEDIALOG(REQPEOPLEITEMS: OleVariant; OPTPEOPLEITEMS: OleVariant; 
                                 REQROOMSITEMS: OleVariant; OPTROOMSITEMS: OleVariant; 
                                 REQRESOURCESITEMS: OleVariant; OPTRESOURCESITEMS: OleVariant; 
                                 REMOVEDPEOPLEITEMS: OleVariant; STARTDATEITEM: OleVariant; 
                                 ENDDATEITEM: OleVariant); dispid 1779;
    procedure FORWARD; dispid 1755;
    procedure SEND; dispid 1754;
    function GETOBJECT(NAME: OleVariant): OleVariant; dispid 1782;
    procedure NAVBARSETTEXT(URLTEXT: OleVariant; WINDOWTITLE: OleVariant); dispid 1790;
    function CREATEOBJECT(NAME: OleVariant; OBJECT_: OleVariant; FILENAME: OleVariant): OleVariant; dispid 1781;
    procedure REFRESHHIDEFORMULAS; dispid 1783;
    function FIELDCONTAINS(FIELDNAME: OleVariant; TEXT: OleVariant): OleVariant; dispid 1780;
    procedure CATEGORIZE(CATEGORY: OleVariant); dispid 1756;
    procedure GOTOFIELD(FIELDNAME: OleVariant); dispid 1764;
    procedure FIELDCLEAR(FIELDNAME: OleVariant); dispid 1762;
    procedure RELOAD; dispid 1758;
    procedure FIELDSETTEXT(FIELDNAME: OleVariant; TEXT: OleVariant); dispid 1760;
    function FIELDGETTEXT(FIELDNAME: OleVariant): WideString; dispid 1759;
    procedure REFRESH(INCLUDERICHTEXTITEMS: OleVariant); dispid 1752;
    procedure CLOSE(IMMEDIATE: OleVariant); dispid 1751;
    procedure SAVE; dispid 1753;
    procedure FIELDAPPENDTEXT(FIELDNAME: OleVariant; TEXT: OleVariant); dispid 1761;
    procedure PRINT(NUMCOPIES: OleVariant; FROMPAGE: OleVariant; TOPAGE: OleVariant; 
                    DRAFT: OleVariant); dispid 1757;
    procedure IMPORT(FILTER: OleVariant; FILENAME: OleVariant); dispid 1796;
    procedure EXPANDALLSECTIONS; dispid 1777;
    procedure COLLAPSEALLSECTIONS; dispid 1778;
    procedure CUT; dispid 1772;
    procedure GOTOPREVFIELD; dispid 1766;
    procedure GOTOTOP; dispid 1767;
    procedure CLEAR; dispid 1774;
    procedure SELECTALL; dispid 1775;
    procedure PASTE; dispid 1773;
    procedure SAVENEWVERSION; dispid 1763;
    procedure DESELECTALL; dispid 1776;
    procedure GOTONEXTFIELD; dispid 1765;
    procedure FINDSTRING(SEARCHSTRING: OleVariant; WHOLEWORD: OleVariant; BACKWARDS: OleVariant; 
                         CASESENSITIVE: OleVariant; WILDCARDS: OleVariant; 
                         ACCENTSENSITIVE: OleVariant; SEARCHDOCUMENT: OleVariant; 
                         FINDNEXT: OleVariant; WRAPAROUND: OleVariant; IGNOREDIACRITICS: OleVariant); dispid 1791;
    function GETSELECTEDTEXT(FIELDNAME: OleVariant): WideString; dispid 1792;
    procedure SPELLCHECK; dispid 1509;
    procedure NAVBARSETPREVNEXTSTATE(COMMAND: Integer; BENABLE: OleVariant); dispid 1960;
    function GETSCHEDULEROBJECT(NAME: OleVariant): OleVariant; dispid 1962;
    procedure COPY; dispid 1771;
    procedure GOTOBOTTOM; dispid 1768;
    procedure INSERTTEXT(TEXT: OleVariant); dispid 1770;
    function FINDFREETIMEDIALOGEX(REQPEOPLEITEMS: OleVariant; OPTPEOPLEITEMS: OleVariant; 
                                  REQROOMSITEMS: OleVariant; OPTROOMSITEMS: OleVariant; 
                                  REQRESOURCESITEMS: OleVariant; OPTRESOURCESITEMS: OleVariant; 
                                  REMOVEDPEOPLEITEMS: OleVariant; STARTDATEITEM: OleVariant; 
                                  ENDDATEITEM: OleVariant): OleVariant; dispid 1793;
    procedure DELETEDOCUMENT; dispid 1769;
    property WINDOWHANDLE: WideString readonly dispid 1512;
    property MODIFIEDSINCESAVED: OleVariant readonly dispid 1961;
    property PARENTVIEWNAME: OleVariant readonly dispid 1714;
    property DIALOGBOXCANCELED: OleVariant readonly dispid 1713;
    property INPREVIEWPANE: OleVariant readonly dispid 1712;
    property AUTORELOAD: OleVariant dispid 1711;
    property ISNEWDOC: OleVariant readonly dispid 1710;
    property CURRENTFIELD: WideString readonly dispid 1709;
    property FIELDHELP: OleVariant dispid 1708;
    property HIDDENCHARS: OleVariant dispid 1707;
    property HORZSCROLLBAR: OleVariant dispid 1706;
    property RULER: OleVariant dispid 1705;
    property DOCUMENT: OleVariant readonly dispid 1704;
    property PREVIEWDOCLINK: OleVariant dispid 1703;
    property PREVIEWPARENTDOC: OleVariant dispid 1702;
    property EDITMODE: OleVariant dispid 1701;
    property WINDOWTITLE: WideString readonly dispid 1700;
  end;

// *********************************************************************//
// DispIntf:  NOTESUIDATABASE
// Flags:     (4096) Dispatchable
// GUID:      {29131503-2EED-1069-BF5D-00DD011186B7}
// *********************************************************************//
  NOTESUIDATABASE = dispinterface
    ['{29131503-2EED-1069-BF5D-00DD011186B7}']
    procedure CLOSE; dispid 1601;
    procedure OPENVIEW(VIEWNAME: OleVariant; KEY: OleVariant; NEWINSTANCE: OleVariant; 
                       REPLACEVIEW: OleVariant); dispid 1599;
    procedure OPENNAVIGATOR(NAVIGATORNAME: OleVariant; FULLWINDOW: OleVariant); dispid 1639;
    function EDITARCHIVESETTINGS: Integer; dispid 1640;
    property DOCUMENTS: OleVariant readonly dispid 1564;
    property DATABASE: OleVariant readonly dispid 1563;
  end;

// *********************************************************************//
// DispIntf:  NOTESUIVIEW
// Flags:     (4096) Dispatchable
// GUID:      {29131506-2EED-1069-BF5D-00DD011186B7}
// *********************************************************************//
  NOTESUIVIEW = dispinterface
    ['{29131506-2EED-1069-BF5D-00DD011186B7}']
    procedure DESELECTALL; dispid 1799;
    procedure CLOSE; dispid 1510;
    procedure PRINT(NUMCOPIES: OleVariant; FROMPAGE: OleVariant; TOPAGE: OleVariant; 
                    DRAFT: OleVariant; PAGESEPARATOR: OleVariant; FORMOVERRIDE: OleVariant; 
                    PRINTVIEW: OleVariant; DATERANGEBEGIN: OleVariant; DATERANGEEND: OleVariant); dispid 1794;
    procedure SELECTDOCUMENT(NOTESDOCUMENT: OleVariant); dispid 1787;
    property VIEWALIAS: OleVariant dispid 1567;
    property VIEW: OleVariant readonly dispid 1784;
    property CARETCATEGORY: OleVariant dispid 1795;
    property VIEWNAME: OleVariant dispid 1566;
    property DOCUMENTS: OleVariant readonly dispid 1786;
    property VIEWINHERITEDFROM: OleVariant dispid 1798;
    property CARETNOTEID: OleVariant readonly dispid 1511;
    property CALENDARDATETIME: OleVariant readonly dispid 1785;
    property CALENDARDATETIMEEND: OleVariant readonly dispid 1797;
  end;

// *********************************************************************//
// DispIntf:  NOTESUIWORKSPACE
// Flags:     (4096) Dispatchable
// GUID:      {29131502-2EED-1069-BF5D-00DD011186B7}
// *********************************************************************//
  NOTESUIWORKSPACE = dispinterface
    ['{29131502-2EED-1069-BF5D-00DD011186B7}']
    function EDITDOCUMENT(EDITMODE: OleVariant; NOTESDOCUMENT: OleVariant;
                          NOTESDOCUMENTREADONLY: OleVariant; NOTESDOCUMENTANCHOR: OleVariant;
                          RETURNNOTESUIDOCUMENT: OleVariant; NEWINSTANCE: OleVariant): OleVariant; dispid 1531;
    procedure VIEWREFRESH; dispid 1538;
    function COMPOSEDOCUMENT(SERVER: OleVariant; DATABASEFILENAME: OleVariant;
                             FORMNAME: OleVariant; WINDOWWIDTH: OleVariant;
                             WINDOWHEIGHT: OleVariant; RETURNNOTESUIDOCUMENT: OleVariant): OleVariant; dispid 1532;
    function NEW: OleVariant; dispid 1536;
    function GETLISTOFTUNES: OleVariant; dispid 1545;
    function GET_DIALENTRY_INFO(REMOTEACCESSMETHOD: OleVariant; NAMEOFENTRY: OleVariant): OleVariant; dispid 1955;
    procedure USELSX(LSXPATH: OleVariant); dispid 1537;
    function DIALOGBOX(FORMNAME: OleVariant; AUTOHORZFIT: OleVariant; AUTOVERTFIT: OleVariant;
                       NOCANCEL: OleVariant; NONEWFIELDS: OleVariant; NOFIELDUPDATE: OleVariant;
                       READONLY: OleVariant; TITLE: OleVariant; NOTESDOCUMENT: OleVariant;
                       SIZETOTABLE: OleVariant; NOOKCANCEL: OleVariant; OKCANCELATBOTTOM: OleVariant): OleVariant; dispid 1530;
    procedure ADDDATABASE(SERVER: OleVariant; DATABASEFILENAME: OleVariant); dispid 1528;
    procedure CHECKALARMS; dispid 1541;
    function URLOPEN(URL: OleVariant; RELOAD: OleVariant; URLLIST: OleVariant; CHARSET: OleVariant;
                     WEBUSERNAME: OleVariant; WEBPASSWORD: OleVariant;
                     PROXYWEBUSERNAME: OleVariant; PROXYWEBPASSWORD: OleVariant;
                     NOTESRETRIEVER: OleVariant): OleVariant; dispid 1540;
    function EDITPROFILE(PROFILENAME: OleVariant; USERNAME: OleVariant): OleVariant; dispid 1539;
    procedure ENABLEALARMS(ENABLE: OleVariant); dispid 1542;
    procedure OPENDATABASE(SERVER: OleVariant; DATABASEFILENAME: OleVariant; VIEWNAME: OleVariant;
                           KEY: OleVariant; NEWINSTANCE: OleVariant; TEMPORARY: OleVariant); dispid 1535;
    function ADDBOOKMARK(BOOKMARKTITLE: OleVariant): OleVariant; dispid 1544;
    procedure ADDDATABASETOPORTFOLIO; dispid 1543;
    procedure SETTARGETFRAME(TARGETFRAME: OleVariant); dispid 1956;
    function PICKLISTSTRINGS(TYPE_: Smallint; MULTIPLESELECTION: OleVariant; SERVER: OleVariant;
                             DATABASEFILENAME: OleVariant; VIEWNAME: OleVariant; TITLE: OleVariant;
                             PROMPT: OleVariant; COLUMN: OleVariant; SINGLECATEGORY: OleVariant): OleVariant; dispid 1547;
    function SAVEFILEDIALOG(DIRECTORIESONLY: OleVariant; TITLE: OleVariant; FILTERS: OleVariant;
                            INITIALDIR: OleVariant; INITIALFILE: OleVariant): OleVariant; dispid 1850;
    function OPENFILEDIALOG(MULTIPLESELECTION: OleVariant; TITLE: OleVariant; FILTERS: OleVariant;
                            INITIALDIR: OleVariant; INITIALFILE: OleVariant): OleVariant; dispid 1549;
    procedure PLAYTUNE(TUNENAMETOPLAY: OleVariant); dispid 1546;
    procedure SETCURRENTLOCATION(LOCATION: OleVariant); dispid 1852;
    function PROMPT(TYPE_: Smallint; TITLE: OleVariant; PROMPT: OleVariant; DEFAULT: OleVariant;
                    VALUES: OleVariant): OleVariant; dispid 1853;
    function FOLDER(FOLDERNAME: OleVariant; MOVEORCOPY: OleVariant): OleVariant; dispid 1854;
    procedure REFRESHPARENTNOTE; dispid 1565;
    procedure OPENPAGE(PAGENAME: OleVariant); dispid 1957;
    procedure VIEWREBUILD(VIEWREBUILD: OleVariant; LOADPREFERENCES: OleVariant); dispid 1568;
    function GET_DIALENTRY_LIST(REMOTEACCESSMETHOD: OleVariant): OleVariant; dispid 1953;
    procedure CREATE_DIALENTRY_DIALOG(REMOTEACCESSMETHOD: OleVariant); dispid 1954;
    procedure RELOADWINDOW; dispid 1959;
    function PICKLISTCOLLECTION(TYPE_: Smallint; MULTIPLESELECTION: OleVariant; SERVER: OleVariant;
                                DATABASEFILENAME: OleVariant; VIEWNAME: OleVariant;
                                TITLE: OleVariant; PROMPT: OleVariant; SINGLECATEGORY: OleVariant): OleVariant; dispid 1548;
    function GETCURRENTDATABASE: OleVariant; dispid 1529;
    procedure OPENFRAMESET(FRAMESETNAME: OleVariant); dispid 1958;
    property CURRENTDATABASE: OleVariant readonly dispid 1508;
    property CURRENTVIEW: OleVariant readonly dispid 1507;
    property CURRENTCALENDARDATETIME: OleVariant readonly dispid 1503;
    property CURRENTDOCUMENT: OleVariant readonly dispid 1506;
  end;

// *********************************************************************//
// DispIntf:  NOTESUISCHEDULER
// Flags:     (4096) Dispatchable
// GUID:      {2913150A-2EED-1069-BF5D-00DD011186B7}
// *********************************************************************//
  NOTESUISCHEDULER = dispinterface
    ['{2913150A-2EED-1069-BF5D-00DD011186B7}']
    procedure UPDATEPARTICIPANTSFROMITEMS(FLAGS: OleVariant); dispid 1989;
    procedure SETPARTICIPANTSFROMITEMS(FLAGS: OleVariant); dispid 1988;
    procedure UPDATEPARTICIPANTSFROMTABLE(TABLE: OleVariant; ROLESFLAGS: OleVariant; 
                                          APPFLAGS: OleVariant); dispid 1987;
    procedure SETPARTICIPANTSFROMTABLE(PARTICIPANTTABLE: OleVariant); dispid 1983;
    procedure UPDATEPARTICIPANTSTATUS(PARTICIPANTTABLE: OleVariant); dispid 1986;
    procedure REFRESH(GETSCHEDULEDATA: OleVariant; FLAGS: OleVariant); dispid 1984;
    function PARTICIPANTTABLECOPY(SORTORDER: Smallint): OleVariant; dispid 1982;
    function REMOVEPARTICIPANTS(NAMES: OleVariant): OleVariant; dispid 1971;
    procedure ADDPARTICIPANT(NAME: OleVariant; ROLE: Integer; STATUS: Integer; TYPE_: OleVariant; 
                             ALTERNATENAME: OleVariant; INETNAME: OleVariant; 
                             STORAGETYPE: OleVariant; FLAGS: OleVariant); dispid 1970;
    function GETPARTICIPANTS(ATTENDEETYPE: Integer): OleVariant; dispid 1969;
    procedure GETSCHEDULEDATA(FLAGS: OleVariant); dispid 1968;
    property SCHEDULEGRIDSTART: OleVariant dispid 1981;
    property DISPLAYMEETINGSUGGESTIONS: OleVariant dispid 1980;
    property DISPLAYPEOPLE: OleVariant dispid 1976;
    property TIMEZONE: WideString dispid 1985;
    property DISPLAYTWISTIES: OleVariant dispid 1979;
    property DISPLAYRESOURCES: OleVariant dispid 1978;
    property DISPLAYROOMS: OleVariant dispid 1977;
    property DISPLAYHOURSPERDAY: Integer dispid 1966;
    property COLORLEGEND: OleVariant dispid 1967;
    property IGNOREUNIVERSALID: WideString dispid 2005;
    property SCHEDULERNAME: WideString readonly dispid 2004;
    property DISPLAYALTERNATENAMES: OleVariant dispid 1972;
    property INTERVAL: OleVariant dispid 1965;
    property MEETINGINDICATOR: OleVariant dispid 1964;
    property DISPLAYPARTICIPANTSTATUS: OleVariant dispid 1973;
  end;

// *********************************************************************//
// DispIntf:  WEBBROWSER
// Flags:     (4096) Dispatchable
// GUID:      {8856F961-340A-11D0-A96B-00C04FD705A2}
// *********************************************************************//
  WEBBROWSER = dispinterface
    ['{8856F961-340A-11D0-A96B-00C04FD705A2}']
    procedure SHOWBROWSERBAR(PVACLSID: OleVariant; PVARSHOW: OleVariant; PVARSIZE: OleVariant); dispid 503;
    procedure EXECWB(CMDID: Integer; CMDEXECOPT: Integer; PVAIN: OleVariant; PVAOUT: OleVariant); dispid 502;
    function QUERYSTATUSWB(CMDID: Integer): Integer; dispid 501;
    procedure NAVIGATE2(URL: OleVariant; FLAGS: OleVariant; TARGETFRAMENAME: OleVariant; 
                        POSTDATA: OleVariant; HEADERS: OleVariant); dispid 500;
    function GETPROPERTY(const PROPERT_: WideString): OleVariant; dispid 303;
    procedure PUTPROPERTY(const PROPERT_: WideString; VTVALUE: OleVariant); dispid 302;
    procedure CLIENTTOWINDOW(PCX: OleVariant; PCY: OleVariant); dispid 301;
    procedure QUIT; dispid 300;
    procedure STOP; dispid 106;
    procedure REFRESH2(LEVEL: OleVariant); dispid 105;
    procedure REFRESH; dispid -550;
    procedure NAVIGATE(const URL: WideString; FLAGS: OleVariant; TARGETFRAMENAME: OleVariant; 
                       POSTDATA: OleVariant; HEADERS: OleVariant); dispid 104;
    procedure GOSEARCH; dispid 103;
    procedure GOHOME; dispid 102;
    procedure GOFORWARD; dispid 101;
    procedure GOBACK; dispid 100;
    property STATUSTEXT: WideString dispid 404;
    property STATUSBAR: Smallint dispid 403;
    property TOOLBAR: OleVariant dispid 405;
    property LOCATIONURL: WideString dispid 211;
    property CONTAINER: OleVariant dispid 202;
    property TOPLEVELCONTAINER: Smallint dispid 204;
    property DOCUMENT: OleVariant dispid 203;
    property FULLSCREEN: Smallint dispid 407;
    property HWND: Integer dispid -515;
    property PATH: WideString dispid 401;
    property FULLNAME: WideString dispid 400;
    property BUSY: Smallint dispid 212;
    property MENUBAR: Smallint dispid 406;
    property VISIBLE: Smallint dispid 402;
    property NAME: WideString dispid 0;
    property APPLICATION: OleVariant dispid 200;
    property RESIZABLE: Smallint dispid 556;
    property ADDRESSBAR: Smallint dispid 555;
    property THEATERMODE: Smallint dispid 554;
    property REGISTERASDROPTARGET: Smallint dispid 553;
    property REGISTERASBROWSER: Smallint dispid 552;
    property SILENT: Smallint dispid 551;
    property OFFLINE: Smallint dispid 550;
    property READYSTATE: Integer dispid -525;
    property HEIGHT: Integer dispid 209;
    property type_: WideString dispid 205;
    property PARENT: OleVariant dispid 201;
    property LOCATIONNAME: WideString dispid 210;
    property TOP: Integer dispid 207;
    property LEFT: Integer dispid 206;
    property WIDTH: Integer dispid 208;
  end;

// *********************************************************************//
// DispIntf:  NOTESMIMEENTITY
// Flags:     (4096) Dispatchable
// GUID:      {29131432-2EED-1069-BF5D-00DD011186B7}
// *********************************************************************//
  NOTESMIMEENTITY = dispinterface
    ['{29131432-2EED-1069-BF5D-00DD011186B7}']
    function GETNTHHEADER(const HEADERNAME: WideString; INSTANCE: OleVariant): OleVariant; dispid 1747;
    function CREATEHEADER(const HEADERNAME: WideString): OleVariant; dispid 1749;
    procedure REMOVE; dispid 1750;
    procedure SETCONTENTFROMBYTES(STREAM: OleVariant; const MIMECONTENTTYPE: WideString; 
                                  MIMECONTENTTRANSFERENCODING: Smallint); dispid 1754;
    function GETFIRSTCHILDENTITY: OleVariant; dispid 1744;
    function GETPREVSIBLING: OleVariant; dispid 1743;
    function GETNEXTSIBLING: OleVariant; dispid 1742;
    function GETPREVENTITY(SEARCHDEPTHORBREADTH: OleVariant): OleVariant; dispid 1741;
    function GETNEXTENTITY(SEARCHDEPTHORBREADTH: OleVariant): OleVariant; dispid 1740;
    function GETSOMEHEADERS(HEADERFILTERSTRINGS: OleVariant; INCLUSIVE: OleVariant): WideString; dispid 1755;
    procedure SETCONTENTFROMTEXT(STREAM: OleVariant; const MIMECONTENTTYPE: WideString; 
                                 MIMECONTENTTRANSFERENCODING: Smallint); dispid 1748;
    procedure GETENTITYASTEXT(STREAM: OleVariant; HEADERFILTERSTRINGS: OleVariant; 
                              INCLUSIVE: OleVariant); dispid 1738;
    procedure GETCONTENTASTEXT(STREAM: OleVariant; DECODED: OleVariant); dispid 1739;
    procedure GETCONTENTASBYTES(STREAM: OleVariant; DECODED: OleVariant); dispid 1753;
    function GETPARENTENTITY: OleVariant; dispid 1745;
    procedure DECODECONTENT; dispid 1751;
    procedure ENCODECONTENT(MIMECONTENTTRANSFERENCODING: Smallint); dispid 1752;
    function CREATECHILDENTITY(NEXTSIBLINGMIMEENTITY: OleVariant): OleVariant; dispid 1746;
    function CREATEPARENTENTITY: OleVariant; dispid 1737;
    property BOUNDARYEND: WideString readonly dispid 1719;
    property BOUNDARYSTART: WideString readonly dispid 1718;
    property PREAMBLE: WideString dispid 1717;
    property ENCODING: Smallint readonly dispid 1716;
    property CHARSET: WideString readonly dispid 1715;
    property HEADEROBJECTS: OleVariant readonly dispid 1714;
    property HEADERS: WideString readonly dispid 1713;
    property CONTENTASTEXT: WideString readonly dispid 1712;
    property CONTENTSUBTYPE: WideString readonly dispid 1711;
    property CONTENTTYPE: WideString readonly dispid 1710;
  end;

// *********************************************************************//
// DispIntf:  NOTESMIMEHEADER
// Flags:     (4096) Dispatchable
// GUID:      {2913144E-2EED-1069-BF5D-00DD011186B7}
// *********************************************************************//
  NOTESMIMEHEADER = dispinterface
    ['{2913144E-2EED-1069-BF5D-00DD011186B7}']
    function GETHEADERVAL(FOLDED: OleVariant; RFC2047DECODED: OleVariant): WideString; dispid 3374;
    procedure REMOVE; dispid 3377;
    function GETPARAMVAL(const PARAMETERNAME: WideString; FOLDED: OleVariant): WideString; dispid 3373;
    function GETHEADERVALANDPARAMS(FOLDED: OleVariant; RFC2047DECODED: OleVariant): WideString; dispid 3375;
    function SETHEADERVAL(const HEADERVALUE: WideString): OleVariant; dispid 3378;
    function SETHEADERVALANDPARAMS(const HEADERVALUEANDPARAMS: WideString): OleVariant; dispid 3379;
    function SETPARAMVAL(const PARAMETERNAME: WideString; const PARAMTERVALUE: WideString): OleVariant; dispid 3376;
    function ADDVALTEXT(const HEADERVALUETEXT: WideString; RFC2047CHARSET: OleVariant): OleVariant; dispid 3372;
    property HEADERNAME: WideString readonly dispid 3360;
  end;

// *********************************************************************//
// DispIntf:  NOTESITEM
// Flags:     (4096) Dispatchable
// GUID:      {29131405-2EED-1069-BF5D-00DD011186B7}
// *********************************************************************//
  NOTESITEM = dispinterface
    ['{29131405-2EED-1069-BF5D-00DD011186B7}']
    function GETVALUEDATETIMEARRAY: OleVariant; dispid 3862;
    function GETMIMEENTITY: OleVariant; dispid 1139;
    function PARTIALTEXT: OleVariant; dispid 1109;
    procedure APPENDTOTEXTLIST(VALUE: OleVariant); dispid 1368;
    function ABSTRACT(MAXLENGTH: Integer; DROPVOWELS: Smallint; USEDICTIONARY: Smallint): WideString; dispid 1068;
    function CONTAINS(VALUE: OleVariant): OleVariant; dispid 1067;
    function COPYITEMTODOCUMENT(DOCUMENT: OleVariant; const ITEMNAME: WideString): OleVariant; dispid 1065;
    procedure REMOVE; dispid 1066;
    function NEW(DOCUMENT: OleVariant; const ITEMNAME: WideString; VALUE: OleVariant; 
                 TYPE_: OleVariant): OleVariant; dispid 1064;
    property TEXT: WideString dispid 1059;
    property ISNAMES: OleVariant dispid 1060;
    property type_: Integer dispid 1051;
    property VALUES: OleVariant dispid 1053;
    property ISPROTECTED: OleVariant dispid 1057;
    property PARENT: OleVariant dispid 1058;
    property ISREADERS: OleVariant dispid 1061;
    property ISSUMMARY: OleVariant dispid 1056;
    property LASTMODIFIED: OleVariant dispid 1092;
    property ISAUTHORS: OleVariant dispid 1062;
    property DATETIMEVALUE: OleVariant dispid 1063;
    property SAVETODISK: OleVariant dispid 1091;
    property ISSIGNED: OleVariant dispid 1055;
    property NAME: WideString dispid 1050;
    property VALUELENGTH: Integer dispid 1052;
    property ISENCRYPTED: OleVariant dispid 1054;
  end;

// *********************************************************************//
// DispIntf:  NOTESRICHTEXTITEM
// Flags:     (4096) Dispatchable
// GUID:      {29131406-2EED-1069-BF5D-00DD011186B7}
// *********************************************************************//
  NOTESRICHTEXTITEM = dispinterface
    ['{29131406-2EED-1069-BF5D-00DD011186B7}']
    function CREATERANGE: OleVariant; dispid 1371;
    function GETVALUEDATETIMEARRAY: OleVariant; dispid 3862;
    procedure ENDINSERT; dispid 1370;
    function CREATENAVIGATOR: OleVariant; dispid 1367;
    procedure UPDATE; dispid 1375;
    procedure COMPACT; dispid 1376;
    procedure APPENDTABLE(ROWCOUNT: Smallint; COLUMNCOUNT: Smallint; ROWLABELS: OleVariant; 
                          LEFTMARGIN: OleVariant; RTPSTYLEARRAY: OleVariant); dispid 1366;
    procedure BEGININSERT(ELEMENT: OleVariant; AFTER: OleVariant); dispid 1369;
    procedure APPENDDOCLINK(LINKOBJECT: OleVariant; const COMMENT: WideString; 
                            HOTSPOTTEXT: OleVariant); dispid 1360;
    procedure APPENDTEXT(const TEXT: WideString); dispid 1359;
    function GETFORMATTEDTEXT(STRIPTABS: Smallint; LINELENGTH: Smallint): WideString; dispid 1358;
    procedure APPENDRTFILE(const PATHNAME: WideString); dispid 1357;
    procedure APPENDRTITEM(RTITEM: OleVariant); dispid 1356;
    procedure ADDTAB(COUNT: Smallint); dispid 1355;
    procedure ADDNEWLINE(COUNT: Smallint; NEWPARAGRAPH: OleVariant); dispid 1354;
    function NEW(PARENT: OleVariant; const ITEMNAME: WideString): OleVariant; dispid 1353;
    function GETUNFORMATTEDTEXT: WideString; dispid 1377;
    function ABSTRACT(MAXLENGTH: Integer; DROPVOWELS: Smallint; USEDICTIONARY: Smallint): WideString; dispid 1068;
    procedure APPENDTOTEXTLIST(VALUE: OleVariant); dispid 1368;
    function GETEMBEDDEDOBJECT(const OBJECTNAME: WideString): OleVariant; dispid 1362;
    procedure APPENDSTYLE(RTSTYLE: OleVariant); dispid 1363;
    function COPYITEMTODOCUMENT(DOCUMENT: OleVariant; const ITEMNAME: WideString): OleVariant; dispid 1065;
    function CONTAINS(VALUE: OleVariant): OleVariant; dispid 1067;
    function PARTIALTEXT: OleVariant; dispid 1109;
    procedure REMOVE; dispid 1066;
    procedure ENDSECTION; dispid 1374;
    function GETMIMEENTITY: OleVariant; dispid 1139;
    function GETNOTESFONT(const FACENAME: WideString; ADDONFAIL: OleVariant): Smallint; dispid 1372;
    procedure BEGINSECTION(const TITLE: WideString; TITLESTYLE: OleVariant; BARCOLOR: OleVariant; 
                           EXPAND: OleVariant); dispid 1373;
    procedure ADDLINKBYIDS(const REPLICAID: WideString; const SERVERHINT: WideString; 
                           VIEWUNID: OleVariant; NOTEUNID: OleVariant; COMMENT: OleVariant; 
                           HOTSPOTTEXT: OleVariant); dispid 2127;
    function EMBEDOBJECT(TYPE_: Smallint; const CLASS_: WideString; const SOURCE: WideString; 
                         OBJECTNAME: OleVariant): OleVariant; dispid 1361;
    procedure APPENDPARAGRAPHSTYLE(RTPSTYLE: OleVariant); dispid 1364;
    procedure ADDPAGEBREAK(RTPSTYLE: OleVariant); dispid 1365;
    property LASTMODIFIED: OleVariant dispid 1092;
    property SAVETODISK: OleVariant dispid 1091;
    property DATETIMEVALUE: OleVariant dispid 1063;
    property ISAUTHORS: OleVariant dispid 1062;
    property ISREADERS: OleVariant dispid 1061;
    property ISNAMES: OleVariant dispid 1060;
    property TEXT: WideString dispid 1059;
    property PARENT: OleVariant dispid 1058;
    property ISPROTECTED: OleVariant dispid 1057;
    property ISSUMMARY: OleVariant dispid 1056;
    property ISSIGNED: OleVariant dispid 1055;
    property ISENCRYPTED: OleVariant dispid 1054;
    property VALUELENGTH: Integer dispid 1052;
    property VALUES: OleVariant dispid 1053;
    property type_: Integer dispid 1051;
    property NAME: WideString dispid 1050;
    property EMBEDDEDOBJECTS: OleVariant readonly dispid 1352;
  end;

// *********************************************************************//
// DispIntf:  NOTESEMBEDDEDOBJECT
// Flags:     (4096) Dispatchable
// GUID:      {29131410-2EED-1069-BF5D-00DD011186B7}
// *********************************************************************//
  NOTESEMBEDDEDOBJECT = dispinterface
    ['{29131410-2EED-1069-BF5D-00DD011186B7}']
    function DOVERB(const VERBNAME: WideString): OleVariant; dispid 1450;
    function ACTIVATE(SHOW: Smallint): OleVariant; dispid 1448;
    procedure REMOVE; dispid 1451;
    procedure EXTRACTFILE(const PATHNAME: WideString); dispid 1449;
    property type_: Smallint readonly dispid 1443;
    property NAME: WideString readonly dispid 1440;
    property VERBS: OleVariant readonly dispid 1446;
    property FILESIZE: Integer readonly dispid 1444;
    property PARENT: OleVariant readonly dispid 1445;
    property CLASS_: WideString readonly dispid 1441;
    property FITTOWINDOW: OleVariant dispid 1456;
    property RUNREADONLY: OleVariant dispid 1455;
    property FITBELOWFIELDS: OleVariant dispid 1457;
    property SOURCE: WideString readonly dispid 1442;
    property OBJECT_: OleVariant readonly dispid 1447;
  end;

// *********************************************************************//
// DispIntf:  NOTESDATETIME
// Flags:     (4096) Dispatchable
// GUID:      {29131408-2EED-1069-BF5D-00DD011186B7}
// *********************************************************************//
  NOTESDATETIME = dispinterface
    ['{29131408-2EED-1069-BF5D-00DD011186B7}']
    function TIMEDIFFERENCE(DATETIME: OleVariant): Integer; dispid 1276;
    procedure SETANYDATE; dispid 1275;
    procedure CONVERTTOZONECANONICAL(const ZONESPEC: WideString); dispid 2093;
    procedure CONVERTTOZONE(NEWZONE: Smallint; DST: Smallint); dispid 1277;
    procedure ADJUSTSECOND(ADJUSTMENT: Smallint; PRESERVELOCALTIME: OleVariant); dispid 1267;
    function NEW(const DATEEXPR: WideString): OleVariant; dispid 1266;
    procedure ADJUSTMINUTE(ADJUSTMENT: Smallint; PRESERVELOCALTIME: OleVariant); dispid 1268;
    procedure MERGE(DATETIME: OleVariant; ZONESPEC: OleVariant); dispid 2092;
    procedure SETANYTIME; dispid 1274;
    procedure SETNOW; dispid 1273;
    procedure ADJUSTYEAR(ADJUSTMENT: Smallint; PRESERVELOCALTIME: OleVariant); dispid 1272;
    procedure ADJUSTHOUR(ADJUSTMENT: Smallint; PRESERVELOCALTIME: OleVariant); dispid 1269;
    function TIMEDIFFERENCEDOUBLE(DATETIME: OleVariant): Double; dispid 2090;
    procedure ADJUSTMONTH(ADJUSTMENT: Smallint; PRESERVELOCALTIME: OleVariant); dispid 1271;
    procedure ADJUSTDAY(ADJUSTMENT: Smallint; PRESERVELOCALTIME: OleVariant); dispid 1270;
    property ISVALIDDATE: Smallint readonly dispid 2091;
    property TIMEONLY: WideString readonly dispid 1900;
    property DATEONLY: WideString readonly dispid 1279;
    property ZONETIME: WideString readonly dispid 1278;
    property ISDST: Smallint readonly dispid 1265;
    property TIMEZONE: Smallint readonly dispid 1264;
    property LSGMTTIME: OleVariant readonly dispid 1263;
    property LSLOCALTIME: OleVariant dispid 1262;
    property GMTTIME: WideString readonly dispid 1261;
    property LOCALTIME: WideString dispid 1260;
  end;

// *********************************************************************//
// DispIntf:  NOTESDOCUMENT
// Flags:     (4096) Dispatchable
// GUID:      {29131404-2EED-1069-BF5D-00DD011186B7}
// *********************************************************************//
  NOTESDOCUMENT = dispinterface
    ['{29131404-2EED-1069-BF5D-00DD011186B7}']
    function GETRECEIVEDITEMTEXT: OleVariant; dispid 3835;
    function GETITEMVALUEDATETIMEARRAY(const ITEMNAME: WideString): OleVariant; dispid 3849;
    function CLOSEMIMEENTITIES(SAVE: OleVariant; ITEMNAME: OleVariant): OleVariant; dispid 2396;
    procedure UNLOCK; dispid 3833;
    function LOCKPROVISIONAL(NAME: OleVariant): OleVariant; dispid 3832;
    function LOCK(NAME: OleVariant; PROVISIONALOK: OleVariant): OleVariant; dispid 3831;
    function REMOVEPERMANENTLY(FORCE: Smallint): Smallint; dispid 2397;
    function GETMIMEENTITY(ITEMNAME: OleVariant): OleVariant; dispid 2398;
    function CREATEMIMEENTITY(ITEMNAME: OleVariant): OleVariant; dispid 2399;
    procedure REMOVEFROMFOLDERBYUNID(const UNID: WideString); dispid 2961;
    procedure PUTINFOLDERBYUNID(const UNID: WideString); dispid 2960;
    function GENERATEMESSAGEID: WideString; dispid 2955;
    function CREATERICHTEXTITEM(const ITEMNAME: WideString): OleVariant; dispid 1189;
    function GETATTACHMENT(const FILENAME: WideString): OleVariant; dispid 1188;
    procedure COPYALLITEMS(DESTINATION: OleVariant; REPLACE: OleVariant); dispid 1181;
    function COMPUTEWITHFORM(DATATYPEVALIDATION: Smallint; RAISEERROR: Smallint): OleVariant; dispid 1186;
    function RENDERTORTITEM(DESTINATION: OleVariant): OleVariant; dispid 1178;
    procedure REMOVEFROMFOLDER(const FOLDERNAME: WideString); dispid 1185;
    procedure PUTINFOLDER(const FOLDERNAME: WideString; CREATEONFAIL: OleVariant); dispid 1184;
    procedure MAKERESPONSE(NEWPARENT: OleVariant); dispid 1183;
    procedure ENCRYPT; dispid 1182;
    procedure SEND(ATTACHFORM: Smallint; RECIPIENTS: OleVariant); dispid 1180;
    function CREATEREPLYMESSAGE(REPLYTOALL: Smallint): OleVariant; dispid 1179;
    procedure SIGN; dispid 1177;
    function COPYTODATABASE(DESTINATION: OleVariant): OleVariant; dispid 1176;
    function REPLACEITEMVALUE(const ITEMNAME: WideString; NEWVALUE: OleVariant): OleVariant; dispid 1175;
    function APPENDITEMVALUE(const ITEMNAME: WideString; NEWVALUE: OleVariant): OleVariant; dispid 1174;
    function GETITEMVALUE(const ITEMNAME: WideString): OleVariant; dispid 1173;
    function SAVE(FORCE: Smallint; MAKERESPONSE: Smallint; MARKREAD: OleVariant): Smallint; dispid 1172;
    function REMOVE(FORCE: Smallint): Smallint; dispid 1171;
    function HASITEM(const ITEMNAME: WideString): Smallint; dispid 1170;
    procedure REMOVEITEM(const ITEMNAME: WideString); dispid 1169;
    function COPYITEM(ITEM: OleVariant; const ITEMNAME: WideString): OleVariant; dispid 1168;
    function GETNEXTITEM(arg0: OleVariant): OleVariant; dispid 1167;
    function GETFIRSTITEM(const arg0: WideString): OleVariant; dispid 1166;
    function NEW(DATABASE: OleVariant): OleVariant; dispid 1165;
    property ISENCRYPTED: OleVariant readonly dispid 3834;
    property ISVALID: OleVariant readonly dispid 2959;
    property NOTESURL: WideString readonly dispid 3836;
    property LOCKHOLDERS: OleVariant readonly dispid 3830;
    property FORMDBIDITEM: WideString dispid 2962;
    property FOLDERREFERENCES: OleVariant readonly dispid 2957;
    property ISNEWNOTE: OleVariant readonly dispid 1146;
    property ISDELETED: OleVariant readonly dispid 2958;
    property HANDLE: Integer readonly dispid 2956;
    property KEY: WideString readonly dispid 2954;
    property ISUIDOCOPEN: OleVariant readonly dispid 2951;
    property SIZE: Integer readonly dispid 1163;
    property ISPROFILE: OleVariant readonly dispid 2952;
    property EMBEDDEDOBJECTS: OleVariant readonly dispid 2950;
    property COLUMNVALUES: OleVariant readonly dispid 1164;
    property ENCRYPTIONKEYS: OleVariant dispid 1161;
    property NAMEOFPROFILE: WideString readonly dispid 2953;
    property SENTBYAGENT: OleVariant readonly dispid 1162;
    property RESPONSES: OleVariant readonly dispid 1160;
    property VERIFIER: WideString readonly dispid 1159;
    property PARENTDOCUMENTUNID: WideString readonly dispid 1154;
    property HASEMBEDDED: OleVariant readonly dispid 1151;
    property SAVEMESSAGEONSEND: OleVariant dispid 1157;
    property ENCRYPTONSEND: OleVariant dispid 1155;
    property SIGNER: WideString readonly dispid 1158;
    property SEQUENCETIME: OleVariant readonly dispid 3838;
    property HTTPURL: WideString readonly dispid 3837;
    property PARENTDATABASE: OleVariant readonly dispid 1152;
    property ITEMS: OleVariant readonly dispid 1150;
    property PARENTVIEW: OleVariant readonly dispid 1153;
    property ISRESPONSE: OleVariant readonly dispid 1144;
    property LASTMODIFIED: OleVariant readonly dispid 1141;
    property AUTHORS: OleVariant readonly dispid 1147;
    property FTSEARCHSCORE: Smallint readonly dispid 1145;
    property NOTEID: WideString readonly dispid 1148;
    property UNIVERSALID: WideString dispid 1149;
    property SIGNONSEND: OleVariant dispid 1156;
    property LASTACCESSED: OleVariant readonly dispid 1142;
    property ISSIGNED: OleVariant readonly dispid 1140;
    property CREATED: OleVariant readonly dispid 1143;
  end;

// *********************************************************************//
// DispIntf:  NOTESDOCUMENTCOLLECTION
// Flags:     (4096) Dispatchable
// GUID:      {2913140B-2EED-1069-BF5D-00DD011186B7}
// *********************************************************************//
  NOTESDOCUMENTCOLLECTION = dispinterface
    ['{2913140B-2EED-1069-BF5D-00DD011186B7}']
    function GETLASTDOCUMENT: OleVariant; dispid 1335;
    procedure FTSEARCH(const QUERY: WideString; MAXDOCS: Smallint); dispid 1339;
    procedure DELETEDOCUMENT(DELETEDOCUMENT: OleVariant); dispid 1347;
    function GETFIRSTDOCUMENT: OleVariant; dispid 1334;
    function GETPREVDOCUMENT(CURRENTDOC: OleVariant): OleVariant; dispid 1337;
    function GETNTHDOCUMENT(INDEX: Integer): OleVariant; dispid 1338;
    function GETNEXTDOCUMENT(CURRENTDOC: OleVariant): OleVariant; dispid 1336;
    procedure ADDDOCUMENT(ADDDOCUMENT: OleVariant); dispid 1346;
    procedure REMOVEALL(FORCE: Smallint); dispid 1340;
    procedure PUTALLINFOLDER(const FOLDERNAME: WideString; CREATEONFAIL: OleVariant); dispid 1344;
    procedure STAMPALL(const ITEMNAME: WideString; VALUE: OleVariant); dispid 1342;
    procedure UPDATEALL; dispid 1341;
    function GETNOTEIDS: OleVariant; dispid 1349;
    function GETDOCUMENT(DOCUMENT: OleVariant): OleVariant; dispid 1348;
    procedure REMOVEALLFROMFOLDER(const FOLDERNAME: WideString); dispid 1345;
    property PARENT: OleVariant readonly dispid 1333;
    property QUERY: WideString readonly dispid 1332;
    property ISSORTED: OleVariant readonly dispid 1331;
    property COUNT: Integer readonly dispid 1330;
  end;

// *********************************************************************//
// DispIntf:  NOTESVIEWCOLUMN
// Flags:     (4096) Dispatchable
// GUID:      {2913140F-2EED-1069-BF5D-00DD011186B7}
// *********************************************************************//
  NOTESVIEWCOLUMN = dispinterface
    ['{2913140F-2EED-1069-BF5D-00DD011186B7}']
    property TITLE: WideString dispid 1430;
    property ITEMNAME: WideString readonly dispid 1431;
    property POSITION: Smallint readonly dispid 1432;
    property FORMULA: WideString dispid 1433;
    property ISSORTED: OleVariant dispid 1434;
    property ISCATEGORY: OleVariant readonly dispid 1435;
    property ISHIDDEN: OleVariant dispid 1436;
    property ISRESPONSE: OleVariant readonly dispid 1437;
    property FONTFACE: WideString dispid 1896;
    property LISTSEP: Smallint dispid 1881;
    property ALIGNMENT: Smallint dispid 1882;
    property HEADERALIGNMENT: Smallint dispid 1883;
    property WIDTH: Smallint dispid 1438;
    property FONTSTYLE: Smallint dispid 1897;
    property FONTCOLOR: Smallint dispid 1898;
    property FONTPOINTSIZE: Smallint dispid 1905;
    property NUMBERDIGITS: Smallint dispid 1906;
    property NUMBERFORMAT: Smallint dispid 1907;
    property NUMBERATTRIB: Smallint dispid 1908;
    property DATEFMT: Smallint dispid 1909;
    property TIMEFMT: Smallint dispid 1910;
    property TIMEZONEFMT: Smallint dispid 1911;
    property TIMEDATEFMT: Smallint dispid 1912;
    property ISSORTDESCENDING: OleVariant dispid 1884;
    property ISHIDEDETAIL: OleVariant dispid 1885;
    property ISICON: OleVariant readonly dispid 1886;
    property ISRESIZE: OleVariant dispid 1887;
    property ISRESORTASCENDING: OleVariant dispid 1888;
    property ISRESORTDESCENDING: OleVariant dispid 1889;
    property ISSHOWTWISTIE: OleVariant dispid 1890;
    property ISRESORTTOVIEW: OleVariant dispid 1891;
    property ISSECONDARYRESORT: OleVariant dispid 1892;
    property ISSECONDARYRESORTDESCENDING: OleVariant dispid 1893;
    property ISCASESENSITIVESORT: OleVariant dispid 1894;
    property ISACCENTSENSITIVESORT: OleVariant dispid 1895;
    property ISFIELD: OleVariant readonly dispid 1930;
    property ISFORMULA: OleVariant readonly dispid 1931;
    property PARENT: OleVariant readonly dispid 1932;
    property HEADERFONTFACE: WideString dispid 2129;
    property HEADERFONTSTYLE: Smallint dispid 2130;
    property HEADERFONTCOLOR: Smallint dispid 2131;
    property HEADERFONTPOINTSIZE: Smallint dispid 2132;
    property ISFONTBOLD: OleVariant dispid 2133;
    property ISFONTITALIC: OleVariant dispid 2134;
    property ISFONTUNDERLINE: OleVariant dispid 2135;
    property ISFONTSTRIKETHROUGH: OleVariant dispid 2136;
    property ISHEADERFONTBOLD: OleVariant dispid 2137;
    property ISHEADERFONTITALIC: OleVariant dispid 2138;
    property ISHEADERFONTUNDERLINE: OleVariant dispid 2139;
    property ISHEADERFONTSTRIKETHROUGH: OleVariant dispid 2140;
    property ISNUMBERATTRIBPARENS: OleVariant dispid 1915;
    property ISNUMBERATTRIBPUNCTUATED: OleVariant dispid 1916;
    property ISNUMBERATTRIBPERCENT: OleVariant dispid 1917;
    property RESORTTOVIEWNAME: WideString dispid 1899;
    property SECONDARYRESORTCOLUMNINDEX: Smallint dispid 2145;
  end;

// *********************************************************************//
// DispIntf:  NOTESVIEW
// Flags:     (4096) Dispatchable
// GUID:      {29131403-2EED-1069-BF5D-00DD011186B7}
// *********************************************************************//
  NOTESVIEW = dispinterface
    ['{29131403-2EED-1069-BF5D-00DD011186B7}']
    function GETENTRYBYID(const NOTEID: WideString): OleVariant; dispid 3858;
    procedure UNLOCK; dispid 3853;
    function LOCKPROVISIONAL(NAME: OleVariant): OleVariant; dispid 3852;
    function LOCK(NAME: OleVariant; PROVISIONALOK: OleVariant): OleVariant; dispid 3851;
    function COPYCOLUMN(SOURCE_COLUMN: OleVariant; DESTINATION_INDEX: OleVariant): OleVariant; dispid 2107;
    function SETALIASES(const ALIAS: WideString): Integer; dispid 2106;
    procedure REMOVECOLUMN(COLUMN_NAME_OR_INDEX: OleVariant); dispid 2105;
    function CREATECOLUMN(POSITION: OleVariant; COLUMN_NAME: OleVariant; FORMULA: OleVariant): OleVariant; dispid 2108;
    function CREATEVIEWNAVFROMCATEGORY(const CATEGORY: WideString): OleVariant; dispid 1554;
    function CREATEVIEWNAVFROMDESCENDANTS(NAVOBJECT: OleVariant): OleVariant; dispid 1553;
    function CREATEVIEWNAVFROMCHILDREN(NAVOBJECT: OleVariant): OleVariant; dispid 1552;
    function CREATEVIEWNAVFROM(NAVOBJECT: OleVariant): OleVariant; dispid 1551;
    function CREATEVIEWNAV: OleVariant; dispid 1550;
    function GETALLENTRIESBYKEY(KEYARRAY: OleVariant; EXACTMATCH: OleVariant): OleVariant; dispid 1560;
    function GETENTRYBYKEY(KEYARRAY: OleVariant; EXACTMATCH: OleVariant): OleVariant; dispid 1559;
    function CREATEVIEWFROMTEMPLATE(const VIEWNAME: WideString): Integer; dispid 1307;
    function GETALLDOCUMENTSBYKEY(KEYARRAY: OleVariant; EXACTMATCH: OleVariant): OleVariant; dispid 1306;
    procedure CLEAR; dispid 1300;
    procedure REMOVE; dispid 1299;
    procedure REFRESH; dispid 1298;
    function FTSEARCH(const QUERY: WideString; MAXDOCS: OleVariant): Integer; dispid 1297;
    function GETDOCUMENTBYKEY(KEYARRAY: OleVariant; EXACTMATCH: OleVariant): OleVariant; dispid 1296;
    function GETNTHDOCUMENT(INDEX: Integer): OleVariant; dispid 1292;
    function GETCHILD(DOCUMENT: OleVariant): OleVariant; dispid 1295;
    function GETPARENTDOCUMENT(DOCUMENT: OleVariant): OleVariant; dispid 1301;
    function GETPREVSIBLING(DOCUMENT: OleVariant): OleVariant; dispid 1294;
    function GETNEXTSIBLING(DOCUMENT: OleVariant): OleVariant; dispid 1293;
    function GETPREVDOCUMENT(DOCUMENT: OleVariant): OleVariant; dispid 1291;
    function GETNEXTDOCUMENT(DOCUMENT: OleVariant): OleVariant; dispid 1290;
    function GETLASTDOCUMENT: OleVariant; dispid 1289;
    function GETFIRSTDOCUMENT: OleVariant; dispid 1288;
    property NOTESURL: WideString readonly dispid 3856;
    property VIEWINHERITEDNAME: WideString readonly dispid 1326;
    property ISPROHIBITDESIGNREFRESH: OleVariant dispid 2104;
    property LOCKHOLDERS: OleVariant readonly dispid 3850;
    property ENTRYCOUNT: Integer readonly dispid 1935;
    property ISCONFLICT: OleVariant readonly dispid 1921;
    property ISPRIVATE: OleVariant readonly dispid 1310;
    property SELECTIONFORMULA: WideString dispid 2103;
    property TOPLEVELENTRYCOUNT: Smallint readonly dispid 1929;
    property SPACING: Smallint dispid 1924;
    property BACKGROUNDCOLOR: Smallint dispid 1926;
    property COLUMNCOUNT: Smallint readonly dispid 1928;
    property HEADERLINES: Smallint readonly dispid 1923;
    property ALLENTRIES: OleVariant readonly dispid 1308;
    property ISCATEGORIZED: OleVariant readonly dispid 1927;
    property ROWLINES: Smallint readonly dispid 1922;
    property ISHIERARCHICAL: OleVariant readonly dispid 1920;
    property ISCALENDAR: OleVariant readonly dispid 1305;
    property PROTECTREADERS: OleVariant dispid 1309;
    property ISMODIFIED: OleVariant readonly dispid 1925;
    property ALIASES: OleVariant dispid 1304;
    property HTTPURL: WideString readonly dispid 3857;
    property READERS: OleVariant dispid 1302;
    property AUTOUPDATE: OleVariant dispid 1303;
    property COLUMNS: OleVariant readonly dispid 1286;
    property UNIVERSALID: WideString readonly dispid 1283;
    property PARENT: OleVariant readonly dispid 1284;
    property ISDEFAULTVIEW: OleVariant dispid 1285;
    property CREATED: OleVariant readonly dispid 1282;
    property ISFOLDER: OleVariant readonly dispid 1287;
    property NAME: WideString dispid 1280;
    property LASTMODIFIED: OleVariant readonly dispid 1281;
  end;

// *********************************************************************//
// DispIntf:  NOTESAGENT
// Flags:     (4096) Dispatchable
// GUID:      {29131409-2EED-1069-BF5D-00DD011186B7}
// *********************************************************************//
  NOTESAGENT = dispinterface
    ['{29131409-2EED-1069-BF5D-00DD011186B7}']
    procedure UNLOCK; dispid 1135;
    function LOCKPROVISIONAL(NAME: OleVariant): OleVariant; dispid 1134;
    function LOCK(NAME: OleVariant; PROVISIONALOK: OleVariant): OleVariant; dispid 1133;
    function RUNONSERVER(arg0: OleVariant): Smallint; dispid 1123;
    procedure SAVE; dispid 1122;
    procedure REMOVE; dispid 1121;
    function RUN(arg0: OleVariant): Smallint; dispid 1120;
    property TARGET: Smallint readonly dispid 1125;
    property ISNOTESAGENT: OleVariant readonly dispid 1126;
    property LASTRUN: OleVariant readonly dispid 1112;
    property NAME: WideString readonly dispid 1110;
    property OWNER: WideString readonly dispid 1111;
    property ISPUBLIC: OleVariant readonly dispid 1118;
    property COMMONOWNER: WideString readonly dispid 1119;
    property PARENT: OleVariant readonly dispid 1117;
    property ISWEBAGENT: OleVariant readonly dispid 1127;
    property TRIGGER: Smallint readonly dispid 1124;
    property ISENABLED: OleVariant dispid 1113;
    property LOCKHOLDERS: OleVariant readonly dispid 1132;
    property HTTPURL: WideString readonly dispid 1138;
    property HASRUNSINCEMODIFIED: OleVariant readonly dispid 1128;
    property ONBEHALFOF: WideString readonly dispid 1131;
    property PARAMETERDOCID: WideString readonly dispid 1129;
    property QUERY: WideString readonly dispid 1115;
    property COMMENT: WideString readonly dispid 1116;
    property SERVERNAME: WideString dispid 1114;
    property NOTESURL: WideString readonly dispid 1137;
    property ISACTIVATABLE: OleVariant readonly dispid 1136;
  end;

// *********************************************************************//
// DispIntf:  NOTESREPLICATION
// Flags:     (4096) Dispatchable
// GUID:      {2913142B-2EED-1069-BF5D-00DD011186B7}
// *********************************************************************//
  NOTESREPLICATION = dispinterface
    ['{2913142B-2EED-1069-BF5D-00DD011186B7}']
    function GETENTRY(const SOURCE_SERVER: WideString; const DESTINATION_SERVER: WideString; 
                      CREATE: OleVariant): OleVariant; dispid 3698;
    function SAVE: Smallint; dispid 1563;
    function RESET: Smallint; dispid 1562;
    function CLEARHISTORY: Smallint; dispid 1561;
    property ABSTRACT: OleVariant dispid 1541;
    property CUTOFFINTERVAL: Integer dispid 1533;
    property IGNOREDELETES: OleVariant dispid 1536;
    property CUTOFFDELETE: OleVariant dispid 1539;
    property CUTOFFDATE: OleVariant readonly dispid 1534;
    property DONTSENDLOCALSECURITYUPDATES: OleVariant dispid 3950;
    property PRIORITY: Integer dispid 1546;
    property DISABLED: OleVariant dispid 1535;
    property IGNOREDESTDELETES: OleVariant dispid 1544;
  end;

// *********************************************************************//
// DispIntf:  NOTESCOLOROBJECT
// Flags:     (4096) Dispatchable
// GUID:      {29131452-2EED-1069-BF5D-00DD011186B7}
// *********************************************************************//
  NOTESCOLOROBJECT = dispinterface
    ['{29131452-2EED-1069-BF5D-00DD011186B7}']
    function SETHSL(arg0: Smallint; arg1: Smallint; arg2: Smallint): Smallint; dispid 3524;
    function SETRGB(arg0: Smallint; arg1: Smallint; arg2: Smallint): Smallint; dispid 3523;
    property NOTESCOLOR: Smallint dispid 3516;
    property BLUE: Smallint readonly dispid 3519;
    property GREEN: Smallint readonly dispid 3518;
    property RED: Smallint readonly dispid 3517;
    property SATURATION: Smallint readonly dispid 3521;
    property LUMINANCE: Smallint readonly dispid 3522;
    property HUE: Smallint readonly dispid 3520;
  end;

// *********************************************************************//
// DispIntf:  NOTESDATABASE
// Flags:     (4096) Dispatchable
// GUID:      {29131402-2EED-1069-BF5D-00DD011186B7}
// *********************************************************************//
  NOTESDATABASE = dispinterface
    ['{29131402-2EED-1069-BF5D-00DD011186B7}']
    function QUERYACCESSPRIVILEGES(const USERNAME: WideString): Integer; dispid 3916;
    function QUERYACCESSROLES(const USERNAME: WideString): OleVariant; dispid 3912;
    function FTSEARCHRANGE(const QUERY: WideString; MAXDOCS: Smallint; SORTOPTION: OleVariant; 
                           OTHEROPTIONS: OleVariant; START: OleVariant): OleVariant; dispid 3939;
    function UNPROCESSEDFTSEARCHRANGE(const QUERY: WideString; MAXDOCS: Smallint; 
                                      SORTOPTION: OleVariant; OTHEROPTIONS: OleVariant; 
                                      START: OleVariant): OleVariant; dispid 3938;
    procedure MARKFORDELETE; dispid 3829;
    procedure REMOVEFTINDEX; dispid 3828;
    procedure SIGN(DOCUMENTTYPE: OleVariant; EXISTINGSIGSONLY: OleVariant; NAMESTR: OleVariant; 
                   NAMESTRISNOTEID: OleVariant); dispid 3825;
    procedure CREATEFTINDEX(OPTIONS: Integer; RECREATE: OleVariant); dispid 3823;
    function COMPACTWITHOPTIONS(OPTIONS: OleVariant; PERCENT_M_K_REDUCTION: OleVariant): Integer; dispid 3821;
    procedure FIXUP(OPTIONS: OleVariant); dispid 1537;
    function GETOPTION(OPTION: Smallint): OleVariant; dispid 3780;
    procedure SETOPTION(OPTION: Smallint; ENABLE: Smallint); dispid 3781;
    function GETARCHIVEPATH(const POLICY: WideString; PATHTYPE: OleVariant): WideString; dispid 3560;
    function CREATENOTECOLLECTION(SELECTALLFLAG: Smallint): OleVariant; dispid 3450;
    function CREATEVIEW(VIEWNAME: OleVariant; VIEWSELECTIONFORMULA: OleVariant; 
                        TEMPLATEVIEW: OleVariant; PROHIBITDESIGNREFRESHMODIFICATIONS: OleVariant): OleVariant; dispid 2102;
    function ARCHIVENOW(DOCUMENTCOLLECTION: OleVariant; POLICY: OleVariant): Integer; dispid 2402;
    procedure ENABLEFOLDER(const FOLDERNAME: WideString); dispid 2163;
    function CREATEOUTLINE(const OUTLINENAME: WideString; GENERATEDEFAULTOUTLINE: OleVariant): OleVariant; dispid 2160;
    function GETOUTLINE(const OUTLINENAME: WideString): OleVariant; dispid 2159;
    function GETPROFILEDOCCOLLECTION(PROFILENAME: OleVariant): OleVariant; dispid 1618;
    function FTDOMAINSEARCH(const QUERY: WideString; MAXDOCS: Smallint; SORTOPTION: OleVariant; 
                            OTHEROPTIONS: OleVariant; START: OleVariant; COUNT: OleVariant; 
                            ENTRYFORM: OleVariant): OleVariant; dispid 1617;
    procedure ENABLEDBOPTIONS(OPTION: Smallint; ENABLE: Smallint); dispid 1566;
    function CREATENEWSGROUP(const GROUPNAME: WideString; TITLE: OleVariant; 
                             SUBDIRECTORY: OleVariant): Integer; dispid 1526;
    function GETFIELDS(ALLFIELDS: Smallint): OleVariant; dispid 1524;
    function RETRIEVEPOP3MAIL(const SERVER: WideString; PORT: Smallint; const USERNAME: WideString; 
                              const PASSWORD: WideString; RETAINMAIL: Smallint; USESSL: Smallint): Integer; dispid 1523;
    function GETFORM(const FORMNAME: WideString): OleVariant; dispid 1516;
    function GETAGENT(const AGENTNAME: WideString): OleVariant; dispid 1513;
    function GETPROFILEDOCUMENT(const PROFILENAME: WideString; PROFILEUSERNAME: OleVariant): OleVariant; dispid 1512;
    function OPENWITHFAILOVER(const SERVER: WideString; const FILE_: WideString): OleVariant; dispid 1508;
    function GETURLHEADERINFO(const URL: WideString; const HEADERNAME: WideString; 
                              WEBUSERNAME: OleVariant; WEBPSWD: OleVariant; 
                              PROXYUSERNAME: OleVariant; PROXYPSWD: OleVariant): WideString; dispid 1511;
    function GETDOCUMENTBYURL(const URL: WideString; RELOAD: OleVariant; URLLIST: OleVariant; 
                              CHARSET: OleVariant; WEBUSERNAME: OleVariant; WEBPSWD: OleVariant; 
                              PROXYUSERNAME: OleVariant; PROXYPSWD: OleVariant; 
                              RETURNIMMEDIATELY: OleVariant): OleVariant; dispid 1510;
    function OPENURLDB: OleVariant; dispid 1509;
    function CREATEDOCUMENT: OleVariant; dispid 1507;
    function OPENBYREPLICAID(const SERVER: WideString; const REPLICAID: WideString): OleVariant; dispid 1505;
    function COMPACT: Integer; dispid 1500;
    function REPLICATE(const SERVER: WideString): OleVariant; dispid 1049;
    function GETVIEW(const VIEWNAME: WideString): OleVariant; dispid 1046;
    function CREATEREPLICA(const SERVER: WideString; const FILE_: WideString): OleVariant; dispid 1044;
    function CREATEFROMTEMPLATE(const SERVER: WideString; const FILE_: WideString; 
                                INHERITFLAG: Smallint; MAXSIZE: OleVariant): OleVariant; dispid 1043;
    procedure REVOKEACCESS(const USERNAME: WideString); dispid 1041;
    function QUERYACCESS(const USERNAME: WideString): Smallint; dispid 1040;
    procedure GRANTACCESS(const USERNAME: WideString; LEVEL: Smallint); dispid 1039;
    function GETDOCUMENTBYUNID(const NOTEUNID: WideString): OleVariant; dispid 1038;
    function GETDOCUMENTBYID(const NOTEID: WideString): OleVariant; dispid 1037;
    procedure REMOVE; dispid 1036;
    procedure UPDATEFTINDEX(CREATEFLAG: Smallint); dispid 1035;
    procedure CREATE(const SERVER: WideString; const FILE_: WideString; OPENFLAG: Smallint; 
                     MAXSIZE: OleVariant); dispid 1034;
    procedure OPENMAIL; dispid 1033;
    function OPENIFMODIFIED(const SERVER: WideString; const FILE_: WideString; DATETIME: OleVariant): Smallint; dispid 1032;
    function CREATECOPY(const SERVER: WideString; const FILE_: WideString; MAXSIZE: OleVariant): OleVariant; dispid 1031;
    function UNPROCESSEDSEARCH(const FORMULA: WideString; DATETIME: OleVariant; MAXDOCS: Smallint): OleVariant; dispid 1030;
    function UNPROCESSEDFTSEARCH(const QUERY: WideString; MAXDOCS: Smallint; 
                                 SORTOPTION: OleVariant; OTHEROPTIONS: OleVariant): OleVariant; dispid 1029;
    function SEARCH(const FORMULA: WideString; DATETIME: OleVariant; MAXDOCS: Smallint): OleVariant; dispid 1028;
    function FTSEARCH(const QUERY: WideString; MAXDOCS: Smallint; SORTOPTION: OleVariant; 
                      OTHEROPTIONS: OleVariant): OleVariant; dispid 1027;
    procedure CLOSE; dispid 1045;
    function OPEN(const SERVER: WideString; const FILE_: WideString): OleVariant; dispid 1026;
    function NEW(const SERVER: WideString; const FILE_: WideString): OleVariant; dispid 1042;
    property HTTPURL: WideString readonly dispid 3931;
    property NOTESURL: WideString readonly dispid 3930;
    property LISTINDBCATALOG: OleVariant dispid 3911;
    property ISCLUSTERREPLICATION: OleVariant dispid 3910;
    property ISPENDINGDELETE: OleVariant readonly dispid 3909;
    property ISINSERVICE: OleVariant dispid 3908;
    property LIMITREVISIONS: Double dispid 3915;
    property LIMITUPDATEDBY: Double dispid 3914;
    property UNDELETEEXPIRETIME: Smallint dispid 3913;
    property type_: Smallint readonly dispid 3827;
    property ISINMULTIDBINDEXING: OleVariant dispid 3826;
    property ISCURRENTACCESSPUBLICWRITER: OleVariant readonly dispid 3907;
    property ISCURRENTACCESSPUBLICREADER: OleVariant readonly dispid 3906;
    property ISLINK: OleVariant readonly dispid 3566;
    property FTINDEXFREQUENCY: Smallint dispid 3822;
    property ISDESIGNLOCKINGENABLED: OleVariant dispid 3820;
    property ISDOCUMENTLOCKINGENABLED: OleVariant dispid 3819;
    property ACLACTIVITYLOG: OleVariant readonly dispid 3569;
    property ISCONFIGURATIONDIRECTORY: OleVariant readonly dispid 3567;
    property LASTFIXUP: OleVariant readonly dispid 3564;
    property FILEFORMAT: Smallint readonly dispid 3562;
    property SIZEWARNING: Integer dispid 3563;
    property ARCHIVEDESTINATIONS: OleVariant readonly dispid 3561;
    property ISDIRECTORYCATALOG: OleVariant readonly dispid 1108;
    property REPLICATIONINFO: OleVariant readonly dispid 1564;
    property MAXSIZE: Double readonly dispid 1531;
    property FOLDERREFERENCESENABLED: OleVariant dispid 1530;
    property ISNNT: OleVariant readonly dispid 1525;
    property ISMULTIDBSEARCH: OleVariant dispid 1517;
    property FORMS: OleVariant readonly dispid 1515;
    property DELAYUPDATES: OleVariant dispid 1514;
    property PERCENTUSED: Double readonly dispid 1506;
    property SIZEQUOTA: Integer dispid 1504;
    property SIZE: Double readonly dispid 1503;
    property CURRENTACCESSLEVEL: Smallint readonly dispid 1502;
    property SERVER: WideString readonly dispid 1501;
    property UNPROCESSEDDOCUMENTS: OleVariant readonly dispid 1048;
    property ALLDOCUMENTS: OleVariant readonly dispid 1047;
    property CREATED: OleVariant readonly dispid 1018;
    property ACL: OleVariant readonly dispid 1017;
    property ISPRIVATEADDRESSBOOK: OleVariant readonly dispid 1016;
    property ISPUBLICADDRESSBOOK: OleVariant readonly dispid 1015;
    property LASTFTINDEXED: OleVariant readonly dispid 1014;
    property PARENT: OleVariant readonly dispid 1013;
    property REPLICAID: WideString readonly dispid 1012;
    property AGENTS: OleVariant readonly dispid 1011;
    property VIEWS: OleVariant readonly dispid 1010;
    property ISOPEN: OleVariant readonly dispid 1009;
    property MANAGERS: OleVariant readonly dispid 1008;
    property LASTMODIFIED: OleVariant readonly dispid 1007;
    property FILEPATH: WideString readonly dispid 1006;
    property FILENAME: WideString readonly dispid 1005;
    property DESIGNTEMPLATENAME: WideString readonly dispid 1004;
    property TEMPLATENAME: WideString readonly dispid 1003;
    property CATEGORIES: OleVariant dispid 1002;
    property TITLE: WideString dispid 1001;
    property ISFTINDEXED: OleVariant readonly dispid 1000;
  end;

// *********************************************************************//
// DispIntf:  NOTESDBDIRECTORY
// Flags:     (4096) Dispatchable
// GUID:      {2913140A-2EED-1069-BF5D-00DD011186B7}
// *********************************************************************//
  NOTESDBDIRECTORY = dispinterface
    ['{2913140A-2EED-1069-BF5D-00DD011186B7}']
    function NEW(const SERVER: WideString): OleVariant; dispid 1242;
    function GETNEXTDATABASE: OleVariant; dispid 1243;
    function GETFIRSTDATABASE(FILETYPE: Smallint): OleVariant; dispid 1244;
    property NAME: WideString readonly dispid 1240;
  end;

// *********************************************************************//
// DispIntf:  NOTESSESSION
// Flags:     (4096) Dispatchable
// GUID:      {29131401-2EED-1069-BF5D-00DD011186B7}
// *********************************************************************//
  NOTESSESSION = dispinterface
    ['{29131401-2EED-1069-BF5D-00DD011186B7}']
    function CREATEDXLEXPORTER(INPUT: OleVariant; OUTPUT: OleVariant): OleVariant; dispid 1231;
    function CREATEDXLIMPORTER(INPUT: OleVariant; OUTPUT: OleVariant): OleVariant; dispid 1232;
    function CREATESTREAM: OleVariant; dispid 3419;
    function CREATESAXPARSER(INPUT: OleVariant; OUTPUT: OleVariant): OleVariant; dispid 1234;
    function CREATEXSLTRANSFORMER(INPUT: OleVariant; STYLESHEET: OleVariant; OUTPUT: OleVariant): OleVariant; dispid 1233;
    function RESOLVE(const URL: WideString): OleVariant; dispid 3418;
    function GETUSERPOLICYSETTINGS(const SERVER: WideString; const NAME: WideString; 
                                   TYPE_: Smallint; EXPLICITPOLICY: OleVariant; RESERVED: OleVariant): OleVariant; dispid 1239;
    function HASHPASSWORD(const PASSWORD: WideString): WideString; dispid 3421;
    function VERIFYPASSWORD(const PASSWORD: WideString; const HASH: WideString): OleVariant; dispid 3422;
    procedure UPDATEPROCESSEDDOC(DOCUMENT: OleVariant); dispid 1207;
    function NEW: OleVariant; dispid 1202;
    function GETENVIRONMENTVALUE(const VARNAME: WideString; ISSYSTEMVAR: OleVariant): OleVariant; dispid 1205;
    function GETENVIRONMENTSTRING(const VARNAME: WideString; ISSYSTEMVAR: OleVariant): WideString; dispid 1206;
    procedure CLOSE; dispid 1203;
    function CREATEDOMPARSER(INPUT: OleVariant; OUTPUT: OleVariant): OleVariant; dispid 1235;
    function CREATEXMLREFORMATTER(INPUT: OleVariant; OUTPUT: OleVariant): OleVariant; dispid 3453;
    procedure SETENVIRONMENTVAR(const VARNAME: WideString; VALUE: OleVariant; 
                                ISSYSTEMVAR: OleVariant); dispid 1204;
    function GETDATABASE(const SERVER: WideString; const FILE_: WideString; CREATEONFAIL: OleVariant): OleVariant; dispid 1208;
    function CREATERICHTEXTPARAGRAPHSTYLE: OleVariant; dispid 1876;
    procedure STARTPROFILE(const OUTPUTFILENAME: WideString; OUTPUTTHRESHOLD: OleVariant; 
                           RECORDTHREADS: OleVariant; RECORDENTRYPOINTS: OleVariant); dispid 1228;
    function CREATELOG(const PROGRAMNAME: WideString): OleVariant; dispid 1210;
    function CREATENEWSLETTER(COLLECTION: OleVariant): OleVariant; dispid 1211;
    procedure STOPPROFILE; dispid 1229;
    function GETWIN32DOMAIN(SERVER: OleVariant): OleVariant; dispid 1219;
    function CREATERICHTEXTSTYLE: OleVariant; dispid 1818;
    function GETNEWSGROUPPATH(const arg0: WideString): WideString; dispid 1904;
    function CREATENAME(const NAME: WideString; LANGUAGE: OleVariant): OleVariant; dispid 1218;
    function SENDCONSOLECOMMAND(const SERVER: WideString; const COMMAND: WideString): WideString; dispid 1237;
    procedure TAGPROFILE(const TAGSTRING: WideString); dispid 1230;
    function CREATEADMINISTRATIONPROCESS(const SERVERNAME: WideString): OleVariant; dispid 1236;
    function CREATECOLOROBJECT: OleVariant; dispid 3420;
    function CREATEDATERANGE: OleVariant; dispid 1214;
    function GETDBDIRECTORY(const SERVER: WideString): OleVariant; dispid 1212;
    function CREATEDATETIME(const DATEEXPR: WideString): OleVariant; dispid 1209;
    function FREETIMESEARCH(WINDOW: OleVariant; DURATION: Smallint; NAMES: OleVariant; 
                            FIRSTFIT: OleVariant): OleVariant; dispid 1215;
    function CREATETIMER: OleVariant; dispid 1217;
    property URLDATABASE: OleVariant readonly dispid 3425;
    property HTTPURL: WideString readonly dispid 3424;
    property USERGROUPNAMELIST: OleVariant readonly dispid 3423;
    property ORGDIRECTORYPATH: WideString readonly dispid 1238;
    property CONVERTMIME: OleVariant dispid 1226;
    property USERNAMELIST: OleVariant readonly dispid 2158;
    property NOTESBUILDVERSION: Integer readonly dispid 2049;
    property INTERNETHOSTNAME: WideString readonly dispid 1902;
    property INTERNETDOMAINNAME: WideString readonly dispid 1903;
    property DOCUMENTCONTEXT: OleVariant readonly dispid 1216;
    property INTERNATIONAL: OleVariant readonly dispid 1213;
    property COMMONUSERNAME: WideString readonly dispid 1201;
    property NOTESVERSION: WideString readonly dispid 1200;
    property ADDRESSBOOKS: OleVariant readonly dispid 1198;
    property SAVEDDATA: OleVariant readonly dispid 1199;
    property LASTEXITSTATUS: Integer readonly dispid 1197;
    property ISONSERVER: OleVariant readonly dispid 1196;
    property EFFECTIVEUSERNAME: WideString readonly dispid 1195;
    property LASTRUN: OleVariant readonly dispid 1194;
    property CURRENTAGENT: OleVariant readonly dispid 1193;
    property CURRENTDATABASE: OleVariant readonly dispid 1192;
    property PLATFORM: WideString readonly dispid 1191;
    property USERNAME: WideString readonly dispid 1190;
  end;

// *********************************************************************//
// DispIntf:  NOTESNEWSLETTER
// Flags:     (4096) Dispatchable
// GUID:      {29131407-2EED-1069-BF5D-00DD011186B7}
// *********************************************************************//
  NOTESNEWSLETTER = dispinterface
    ['{29131407-2EED-1069-BF5D-00DD011186B7}']
    function FORMATDOCUMENT(DATABASE: OleVariant; INDEX: Smallint): OleVariant; dispid 1225;
    function FORMATMSGWITHDOCLINKS(DATABASE: OleVariant): OleVariant; dispid 1224;
    function NEW(COLLECTION: OleVariant): OleVariant; dispid 1223;
    property SUBJECTITEMNAME: WideString dispid 1222;
    property DOSCORE: OleVariant dispid 1221;
    property DOSUBJECT: OleVariant dispid 1220;
  end;

// *********************************************************************//
// DispIntf:  NOTESLOG
// Flags:     (4096) Dispatchable
// GUID:      {2913140C-2EED-1069-BF5D-00DD011186B7}
// *********************************************************************//
  NOTESLOG = dispinterface
    ['{2913140C-2EED-1069-BF5D-00DD011186B7}']
    procedure CLOSE; dispid 1323;
    procedure LOGEVENT(const TEXT: WideString; const QUEUENAME: WideString; EVENTTYPE: Smallint; 
                       SEVERITY: Smallint); dispid 1324;
    function NEW(const PROGRAMNAME: WideString): OleVariant; dispid 1317;
    procedure OPENNOTESLOG(const SERVER: WideString; const FILE_: WideString); dispid 1318;
    procedure OPENAGENTLOG; dispid 1325;
    procedure LOGACTION(const ACTION: WideString); dispid 1320;
    procedure LOGERROR(ERRORCODE: Integer; const ERRORTEXT: WideString); dispid 1321;
    procedure OPENMAILLOG(RECIPIENTS: OleVariant; const SUBJECT: WideString); dispid 1322;
    procedure OPENFILELOG(const PATHNAME: WideString); dispid 1319;
    property PROGRAMNAME: WideString dispid 1316;
    property OVERWRITEFILE: OleVariant dispid 1315;
    property NUMERRORS: Smallint readonly dispid 1314;
    property NUMACTIONS: Smallint readonly dispid 1313;
    property LOGACTIONS: OleVariant dispid 1312;
    property LOGERRORS: OleVariant dispid 1311;
  end;

// *********************************************************************//
// DispIntf:  NOTESACL
// Flags:     (4096) Dispatchable
// GUID:      {2913140D-2EED-1069-BF5D-00DD011186B7}
// *********************************************************************//
  NOTESACL = dispinterface
    ['{2913140D-2EED-1069-BF5D-00DD011186B7}']
    function CREATEACLENTRY(const ENTRYNAME: WideString; LEVEL: Smallint): OleVariant; dispid 1409;
    procedure DELETEROLE(const ROLENAME: WideString); dispid 1408;
    procedure ADDROLE(const ROLENAME: WideString); dispid 1407;
    procedure RENAMEROLE(const OLDNAME: WideString; const NEWNAME: WideString); dispid 1406;
    procedure SAVE; dispid 1405;
    function GETENTRY(const ENTRYNAME: WideString): OleVariant; dispid 1404;
    function GETNEXTENTRY(CURRENTENTRY: OleVariant): OleVariant; dispid 1403;
    function GETFIRSTENTRY: OleVariant; dispid 1402;
    property ISEXTENDEDACCESS: OleVariant dispid 1396;
    property ADMINISTRATIONSERVER: WideString dispid 1397;
    property ISADMINNAMES: OleVariant dispid 1399;
    property ISADMINREADERAUTHOR: OleVariant dispid 1398;
    property INTERNETLEVEL: Smallint dispid 1463;
    property UNIFORMACCESS: OleVariant dispid 1423;
    property PARENT: OleVariant readonly dispid 1401;
    property ROLES: OleVariant readonly dispid 1400;
  end;

// *********************************************************************//
// DispIntf:  NOTESACLENTRY
// Flags:     (4096) Dispatchable
// GUID:      {2913140E-2EED-1069-BF5D-00DD011186B7}
// *********************************************************************//
  NOTESACLENTRY = dispinterface
    ['{2913140E-2EED-1069-BF5D-00DD011186B7}']
    procedure REMOVE; dispid 1422;
    function ISROLEENABLED(const ROLENAME: WideString): OleVariant; dispid 1421;
    procedure DISABLEROLE(const ROLENAME: WideString); dispid 1420;
    procedure ENABLEROLE(const ROLENAME: WideString); dispid 1419;
    function NEW(ACL: OleVariant; const ENTRYNAME: WideString; LEVEL: Smallint): OleVariant; dispid 1418;
    property LEVEL: Smallint dispid 1412;
    property ISPUBLICWRITER: OleVariant dispid 1425;
    property ROLES: OleVariant readonly dispid 1410;
    property NAME: WideString dispid 1411;
    property CANCREATELSORJAVAAGENT: OleVariant dispid 1426;
    property PARENT: OleVariant readonly dispid 1417;
    property ISPUBLICREADER: OleVariant dispid 1424;
    property ISSERVER: OleVariant dispid 1427;
    property CANDELETEDOCUMENTS: OleVariant dispid 1416;
    property CANCREATEDOCUMENTS: OleVariant dispid 1415;
    property ISPERSON: OleVariant dispid 1428;
    property ISADMINREADERAUTHOR: OleVariant dispid 1461;
    property CANCREATESHAREDFOLDER: OleVariant dispid 1460;
    property ISGROUP: OleVariant dispid 1429;
    property CANREPLICATEORCOPYDOCUMENTS: OleVariant dispid 1467;
    property CANCREATEPERSONALAGENT: OleVariant dispid 1413;
    property CANCREATEPERSONALFOLDER: OleVariant dispid 1414;
    property USERTYPE: Smallint dispid 1464;
    property ISADMINSERVER: OleVariant dispid 1462;
  end;

// *********************************************************************//
// DispIntf:  NOTESREGISTRATION
// Flags:     (4096) Dispatchable
// GUID:      {29131411-2EED-1069-BF5D-00DD011186B7}
// *********************************************************************//
  NOTESREGISTRATION = dispinterface
    ['{29131411-2EED-1069-BF5D-00DD011186B7}']
    function REGISTERNEWUSERWITHPOLICY(const LASTNAME: WideString; const CERTPW: WideString; 
                                       const USERPW: WideString; const POLICYSERVER: WideString; 
                                       FIRSTNAME: OleVariant; MIDDLE: OleVariant; 
                                       ALTNAME: OleVariant; ALTNAMELANG: OleVariant): OleVariant; dispid 3651;
    procedure GETUSERINFO(const USERNAME: WideString; MAILSERVER: OleVariant; MAILFILE: OleVariant; 
                          DOMAIN: OleVariant; MAILSYSTEM: OleVariant; PROFILE: OleVariant); dispid 1497;
    procedure ADDUSERPROFILE(const USERNAME: WideString; const PROFILENAME: WideString); dispid 1496;
    procedure DELETEIDONSERVER(const USERNAME: WideString; ISSERVERID: Smallint); dispid 1495;
    procedure GETIDFROMSERVER(const USERNAME: WideString; const IDFILEPATH: WideString; 
                              ISSERVERID: Smallint); dispid 1494;
    function ADDCERTIFIERTOADDRESSBOOK(const IDFILE: WideString; CERTPW: OleVariant; 
                                       LOCATION: OleVariant; COMMENT: OleVariant): OleVariant; dispid 1490;
    function ADDSERVERTOADDRESSBOOK(const IDFILE: WideString; const SERVER: WideString; 
                                    const DOMAIN: WideString; USERPW: OleVariant; 
                                    NETWORK: OleVariant; ADMINNAME: OleVariant; TITLE: OleVariant; 
                                    LOCATION: OleVariant; COMMENT: OleVariant): OleVariant; dispid 1489;
    function ADDUSERTOADDRESSBOOK(const IDFILE: WideString; const FULLNAME: WideString; 
                                  const LASTNAME: WideString; USERPW: OleVariant; 
                                  FIRSTNAME: OleVariant; MIDDLE: OleVariant; 
                                  MAILSERVER: OleVariant; MAILDBPATH: OleVariant; 
                                  FWDADDRESS: OleVariant; LOCATION: OleVariant; COMMENT: OleVariant): OleVariant; dispid 1488;
    function SWITCHTOID(const IDFILE: WideString; USERPW: OleVariant): WideString; dispid 1487;
    function REGISTERNEWCERTIFIER(const ORGANIZATION: WideString; const IDFILE: WideString; 
                                  CERTPW: OleVariant; COUNTRY: OleVariant): OleVariant; dispid 1486;
    function RECERTIFY(const IDFILE: WideString; CERTPW: OleVariant; COMMENT: OleVariant): OleVariant; dispid 1485;
    function CROSSCERTIFY(const IDFILE: WideString; CERTPW: OleVariant; COMMENT: OleVariant): OleVariant; dispid 1484;
    function REGISTERNEWSERVER(const SERVER: WideString; const IDFILE: WideString; 
                               const DOMAIN: WideString; SERVERPW: OleVariant; CERTPW: OleVariant; 
                               LOCATION: OleVariant; COMMENT: OleVariant; NETWORK: OleVariant; 
                               ADMINNAME: OleVariant; TITLE: OleVariant): OleVariant; dispid 1483;
    function REGISTERNEWUSER(const LASTNAME: WideString; const IDFILE: WideString; 
                             const MAILSERVER: WideString; FIRSTNAME: OleVariant; 
                             MIDDLE: OleVariant; CERTPW: OleVariant; LOCATION: OleVariant; 
                             COMMENT: OleVariant; MAILDBPATH: OleVariant; FWDDOMAIN: OleVariant; 
                             USERPW: OleVariant; USERTYPE: OleVariant; ALTNAME: OleVariant; 
                             ALTNAMELANG: OleVariant): OleVariant; dispid 1482;
    function NEW: OleVariant; dispid 1481;
    property MAILINTERNETADDRESS: WideString dispid 3638;
    property MAILTEMPLATENAME: WideString dispid 3639;
    property MAILQUOTASIZELIMIT: Integer dispid 3642;
    property MAILSYSTEM: Smallint dispid 3637;
    property ISNORTHAMERICAN: Smallint dispid 1473;
    property REGISTRATIONLOG: WideString dispid 1470;
    property EXPIRATION: OleVariant dispid 1471;
    property CERTIFIERIDFILE: WideString dispid 1474;
    property REGISTRATIONSERVER: WideString dispid 1475;
    property ENFORCEUNIQUESHORTNAME: OleVariant dispid 3634;
    property NOIDFILE: OleVariant dispid 3652;
    property SHORTNAME: WideString dispid 3632;
    property USEADMINPROCESS: OleVariant dispid 3633;
    property USECERTIFICATEAUTHORITY: OleVariant dispid 3630;
    property MAILOWNERACCESS: Smallint dispid 3640;
    property MAILACLMANAGER: WideString dispid 3641;
    property CERTIFIERNAME: WideString dispid 3631;
    property GROUPLIST: OleVariant dispid 3635;
    property MINPASSWORDLENGTH: Smallint dispid 1472;
    property STOREIDINMAILFILE: OleVariant dispid 3665;
    property ROAMINGSUBDIR: WideString dispid 3648;
    property POLICYNAME: WideString dispid 3636;
    property SYNCHINTERNETPASSWORD: OleVariant dispid 3666;
    property MAILCREATEFTINDEX: OleVariant dispid 3644;
    property ROAMINGSERVER: WideString dispid 3647;
    property ISROAMINGUSER: OleVariant dispid 3646;
    property MAILQUOTAWARNINGTHRESHOLD: Integer dispid 3643;
    property MAILREPLICASERVERS: OleVariant dispid 3645;
    property ALTORGUNIT: OleVariant dispid 2141;
    property ALTORGUNITLANG: OleVariant dispid 2142;
    property ORGUNIT: WideString dispid 1476;
    property STOREIDINADDRESSBOOK: OleVariant dispid 1480;
    property IDTYPE: Smallint dispid 1477;
    property ROAMINGCLEANUPPERIOD: Smallint dispid 3650;
    property ROAMINGCLEANUPSETTING: Smallint dispid 3649;
    property CREATEMAILDB: OleVariant dispid 1478;
    property UPDATEADDRESSBOOK: OleVariant dispid 1479;
  end;

// *********************************************************************//
// DispIntf:  NOTESTIMER
// Flags:     (4096) Dispatchable
// GUID:      {29131412-2EED-1069-BF5D-00DD011186B7}
// *********************************************************************//
  NOTESTIMER = dispinterface
    ['{29131412-2EED-1069-BF5D-00DD011186B7}']
    function NEW(INTERVAL: OleVariant; COMMENT: OleVariant): OleVariant; dispid 1603;
    property COMMENT: WideString dispid 1601;
    property INTERVAL: Smallint dispid 1600;
    property ENABLED: OleVariant dispid 1602;
  end;

// *********************************************************************//
// DispIntf:  NOTESNAME
// Flags:     (4096) Dispatchable
// GUID:      {29131413-2EED-1069-BF5D-00DD011186B7}
// *********************************************************************//
  NOTESNAME = dispinterface
    ['{29131413-2EED-1069-BF5D-00DD011186B7}']
    function NEW(const NAME: WideString; LANGUAGE: OleVariant): OleVariant; dispid 1637;
    property ADMD: WideString readonly dispid 1620;
    property ABBREVIATED: WideString readonly dispid 1621;
    property COUNTRY: WideString readonly dispid 1622;
    property CANONICAL: WideString readonly dispid 1623;
    property COMMON: WideString readonly dispid 1624;
    property GIVEN: WideString readonly dispid 1625;
    property INITIALS: WideString readonly dispid 1626;
    property ORGANIZATION: WideString readonly dispid 1627;
    property ORGUNIT1: WideString readonly dispid 1628;
    property ORGUNIT2: WideString readonly dispid 1629;
    property ORGUNIT3: WideString readonly dispid 1630;
    property ORGUNIT4: WideString readonly dispid 1631;
    property GENERATION: WideString readonly dispid 1633;
    property SURNAME: WideString readonly dispid 1634;
    property ADDR822PHRASE: WideString readonly dispid 2150;
    property ISHIERARCHICAL: OleVariant readonly dispid 1636;
    property LANGUAGE: WideString readonly dispid 1638;
    property KEYWORD: WideString readonly dispid 1635;
    property ADDR822LOCALPART: WideString readonly dispid 2151;
    property ADDR822COMMENT1: WideString readonly dispid 2153;
    property PRMD: WideString readonly dispid 1632;
    property ADDR822COMMENT3: WideString readonly dispid 2155;
    property ADDR821: WideString readonly dispid 2156;
    property ADDR822COMMENT2: WideString readonly dispid 2154;
  end;

// *********************************************************************//
// DispIntf:  NOTESFORM
// Flags:     (4096) Dispatchable
// GUID:      {29131414-2EED-1069-BF5D-00DD011186B7}
// *********************************************************************//
  NOTESFORM = dispinterface
    ['{29131414-2EED-1069-BF5D-00DD011186B7}']
    procedure UNLOCK; dispid 1653;
    function LOCKPROVISIONAL(NAME: OleVariant): OleVariant; dispid 1652;
    function LOCK(NAME: OleVariant; PROVISIONALOK: OleVariant): OleVariant; dispid 1651;
    function GETFIELDTYPE(const arg0: WideString): Smallint; dispid 1649;
    procedure REMOVE; dispid 1645;
    property PROTECTREADERS: OleVariant dispid 1647;
    property NAME: WideString readonly dispid 1641;
    property PROTECTUSERS: OleVariant dispid 1648;
    property FIELDS: OleVariant readonly dispid 1646;
    property FORMUSERS: OleVariant dispid 1644;
    property ISSUBFORM: OleVariant readonly dispid 1640;
    property NOTESURL: WideString readonly dispid 1654;
    property LOCKHOLDERS: OleVariant readonly dispid 1650;
    property HTTPURL: WideString readonly dispid 1655;
    property READERS: OleVariant dispid 1643;
    property ALIASES: OleVariant readonly dispid 1642;
  end;

// *********************************************************************//
// DispIntf:  NOTESINTERNATIONAL
// Flags:     (4096) Dispatchable
// GUID:      {29131415-2EED-1069-BF5D-00DD011186B7}
// *********************************************************************//
  NOTESINTERNATIONAL = dispinterface
    ['{29131415-2EED-1069-BF5D-00DD011186B7}']
    property ISCURRENCYSUFFIX: OleVariant readonly dispid 1660;
    property ISCURRENCYSPACE: OleVariant readonly dispid 1661;
    property ISCURRENCYZERO: OleVariant readonly dispid 1662;
    property ISTIME24HOUR: OleVariant readonly dispid 1663;
    property ISDST: OleVariant readonly dispid 1664;
    property ISDATEMDY: OleVariant readonly dispid 1665;
    property ISDATEDMY: OleVariant readonly dispid 1666;
    property ISDATEYMD: OleVariant readonly dispid 1667;
    property CURRENCYDIGITS: Smallint readonly dispid 1668;
    property TIMEZONE: Smallint readonly dispid 1669;
    property AMSTRING: WideString readonly dispid 1670;
    property PMSTRING: WideString readonly dispid 1671;
    property CURRENCYSYMBOL: WideString readonly dispid 1672;
    property THOUSANDSSEP: WideString readonly dispid 1673;
    property DECIMALSEP: WideString readonly dispid 1674;
    property DATESEP: WideString readonly dispid 1675;
    property TIMESEP: WideString readonly dispid 1676;
    property YESTERDAY: WideString readonly dispid 1677;
    property TODAY: WideString readonly dispid 1678;
    property TOMORROW: WideString readonly dispid 1679;
  end;

// *********************************************************************//
// DispIntf:  NOTESDATERANGE
// Flags:     (4096) Dispatchable
// GUID:      {29131416-2EED-1069-BF5D-00DD011186B7}
// *********************************************************************//
  NOTESDATERANGE = dispinterface
    ['{29131416-2EED-1069-BF5D-00DD011186B7}']
    property STARTDATETIME: OleVariant dispid 1690;
    property ENDDATETIME: OleVariant dispid 1691;
    property TEXT: WideString dispid 1692;
  end;

// *********************************************************************//
// DispIntf:  NOTESRICHTEXTSTYLE
// Flags:     (4096) Dispatchable
// GUID:      {2913141A-2EED-1069-BF5D-00DD011186B7}
// *********************************************************************//
  NOTESRICHTEXTSTYLE = dispinterface
    ['{2913141A-2EED-1069-BF5D-00DD011186B7}']
    property BOLD: Smallint dispid 1805;
    property ITALIC: Smallint dispid 1806;
    property UNDERLINE: Smallint dispid 1807;
    property STRIKETHROUGH: Smallint dispid 1808;
    property EFFECTS: Smallint dispid 1810;
    property NOTESFONT: Smallint dispid 1809;
    property FONTSIZE: Smallint dispid 1811;
    property NOTESCOLOR: Smallint dispid 1812;
    property PASSTHRUHTML: Smallint dispid 1814;
    property ISDEFAULT: OleVariant readonly dispid 1804;
  end;

// *********************************************************************//
// DispIntf:  NOTESVIEWENTRY
// Flags:     (4096) Dispatchable
// GUID:      {2913141B-2EED-1069-BF5D-00DD011186B7}
// *********************************************************************//
  NOTESVIEWENTRY = dispinterface
    ['{2913141B-2EED-1069-BF5D-00DD011186B7}']
    function GETPOSITION(const SEPARATOR: WideString): WideString; dispid 1999;
    property NOTEID: WideString readonly dispid 1988;
    property UNIVERSALID: WideString readonly dispid 1989;
    property COLUMNVALUES: OleVariant readonly dispid 1990;
    property FTSEARCHSCORE: Smallint readonly dispid 1986;
    property INDENTLEVEL: Smallint readonly dispid 1985;
    property SIBLINGCOUNT: Smallint readonly dispid 1982;
    property CHILDCOUNT: Smallint readonly dispid 1983;
    property DESCENDANTCOUNT: Smallint readonly dispid 1984;
    property ISCATEGORY: OleVariant readonly dispid 1978;
    property PARENT: OleVariant readonly dispid 1992;
    property ISCONFLICT: OleVariant readonly dispid 1980;
    property ISTOTAL: OleVariant readonly dispid 1979;
    property DOCUMENT: OleVariant readonly dispid 1991;
    property ISDOCUMENT: OleVariant readonly dispid 1977;
    property COLUMNINDENTLEVEL: Smallint readonly dispid 1994;
    property ISVALID: OleVariant readonly dispid 1993;
  end;

// *********************************************************************//
// DispIntf:  NOTESVIEWENTRYCOLLECTION
// Flags:     (4096) Dispatchable
// GUID:      {2913141C-2EED-1069-BF5D-00DD011186B7}
// *********************************************************************//
  NOTESVIEWENTRYCOLLECTION = dispinterface
    ['{2913141C-2EED-1069-BF5D-00DD011186B7}']
    function GETLASTENTRY: OleVariant; dispid 2035;
    procedure REMOVEALL(FORCE: Smallint); dispid 2039;
    procedure ADDENTRY(ADDENTRY: OleVariant); dispid 2045;
    function GETFIRSTENTRY: OleVariant; dispid 2034;
    function GETPREVENTRY(CURRENTENTRY: OleVariant): OleVariant; dispid 2037;
    function GETNTHENTRY(INDEX: Integer): OleVariant; dispid 2038;
    function GETNEXTENTRY(CURRENTENTRY: OleVariant): OleVariant; dispid 2036;
    procedure UPDATEALL; dispid 2040;
    procedure REMOVEALLFROMFOLDER(const FOLDERNAME: WideString); dispid 2043;
    procedure PUTALLINFOLDER(const FOLDERNAME: WideString; CREATEONFAIL: OleVariant); dispid 2042;
    procedure STAMPALL(const ITEMNAME: WideString; VALUE: OleVariant); dispid 2041;
    procedure FTSEARCH(const QUERY: WideString; MAXDOCS: Smallint); dispid 2044;
    function GETENTRY(ENTRY: OleVariant): OleVariant; dispid 2047;
    procedure DELETEENTRY(DELETEENTRY: OleVariant); dispid 2046;
    property PARENT: OleVariant readonly dispid 2033;
    property QUERY: WideString readonly dispid 2032;
    property COUNT: Integer readonly dispid 2030;
  end;

// *********************************************************************//
// DispIntf:  NOTESVIEWNAVIGATOR
// Flags:     (4096) Dispatchable
// GUID:      {2913142C-2EED-1069-BF5D-00DD011186B7}
// *********************************************************************//
  NOTESVIEWNAVIGATOR = dispinterface
    ['{2913142C-2EED-1069-BF5D-00DD011186B7}']
    function GETLAST: OleVariant; dispid 2112;
    function GETFIRST: OleVariant; dispid 2110;
    function GETPREVDOCUMENT(CURRENTENTRY: OleVariant): OleVariant; dispid 2118;
    function GETFIRSTDOCUMENT: OleVariant; dispid 2111;
    function GETPREV(CURRENTENTRY: OleVariant): OleVariant; dispid 2117;
    function GETNEXT(CURRENTENTRY: OleVariant): OleVariant; dispid 2114;
    function GETLASTDOCUMENT: OleVariant; dispid 2113;
    function GETCHILD(CURRENTENTRY: OleVariant): OleVariant; dispid 2122;
    function GETPREVCATEGORY(CURRENTENTRY: OleVariant): OleVariant; dispid 2119;
    function GETPREVSIBLING(CURRENTENTRY: OleVariant): OleVariant; dispid 2121;
    function GETPARENT(CURRENTENTRY: OleVariant): OleVariant; dispid 2123;
    function GETNEXTCATEGORY(CURRENTENTRY: OleVariant): OleVariant; dispid 2116;
    function GETNEXTDOCUMENT(CURRENTENTRY: OleVariant): OleVariant; dispid 2115;
    function GETENTRY(ENTRY: OleVariant): OleVariant; dispid 2126;
    function GETPOS(const POSITION: WideString; const SEPARATOR: WideString): OleVariant; dispid 2125;
    function GETNEXTSIBLING(CURRENTENTRY: OleVariant): OleVariant; dispid 2120;
    function GETNTH(INDEX: Integer): OleVariant; dispid 2124;
    property COUNT: Integer readonly dispid 2109;
    property PARENTVIEW: OleVariant readonly dispid 2101;
    property MAXLEVEL: Integer dispid 2100;
  end;

// *********************************************************************//
// DispIntf:  NOTESRICHTEXTPARAGRAPHSTYLE
// Flags:     (4096) Dispatchable
// GUID:      {2913141D-2EED-1069-BF5D-00DD011186B7}
// *********************************************************************//
  NOTESRICHTEXTPARAGRAPHSTYLE = dispinterface
    ['{2913141D-2EED-1069-BF5D-00DD011186B7}']
    procedure SETTABS(NUMBER: Smallint; STARTPOSITION: Integer; INTERVAL: Integer; TYPE_: OleVariant); dispid 1871;
    procedure CLEARALLTABS; dispid 1870;
    procedure SETTAB(POSITION: Integer; TYPE_: Smallint); dispid 1869;
    property RIGHTMARGIN: Integer dispid 1865;
    property ALIGNMENT: Smallint dispid 1860;
    property SPACINGBELOW: Smallint dispid 1863;
    property LEFTMARGIN: Integer dispid 1864;
    property INTERLINESPACING: Smallint dispid 1861;
    property TABS: OleVariant readonly dispid 1868;
    property FIRSTLINELEFTMARGIN: Integer dispid 1866;
    property SPACINGABOVE: Smallint dispid 1862;
    property PAGINATION: Smallint dispid 1867;
  end;

// *********************************************************************//
// DispIntf:  NOTESRICHTEXTTAB
// Flags:     (4096) Dispatchable
// GUID:      {2913141E-2EED-1069-BF5D-00DD011186B7}
// *********************************************************************//
  NOTESRICHTEXTTAB = dispinterface
    ['{2913141E-2EED-1069-BF5D-00DD011186B7}']
    procedure CLEAR; dispid 1879;
    property POSITION: Integer dispid 1877;
    property type_: Smallint dispid 1878;
  end;

// *********************************************************************//
// DispIntf:  NOTESRICHTEXTTABLE
// Flags:     (4096) Dispatchable
// GUID:      {29131433-2EED-1069-BF5D-00DD011186B7}
// *********************************************************************//
  NOTESRICHTEXTTABLE = dispinterface
    ['{29131433-2EED-1069-BF5D-00DD011186B7}']
    procedure SETALTERNATECOLOR(arg0: OleVariant); dispid 1779;
    procedure SETCOLOR(arg0: OleVariant); dispid 1778;
    procedure REMOVE; dispid 1775;
    procedure REMOVEROW(COUNT: OleVariant; TARGETROW: OleVariant); dispid 1773;
    procedure ADDROW(COUNT: OleVariant; TARGETROW: OleVariant); dispid 1771;
    property ALTERNATECOLOR: OleVariant readonly dispid 1777;
    property COLOR: OleVariant readonly dispid 1776;
    property ROWLABELS: OleVariant dispid 1769;
    property STYLE: Smallint dispid 1760;
    property RIGHTTOLEFT: OleVariant dispid 1780;
    property COLUMNCOUNT: Smallint readonly dispid 1765;
    property ROWCOUNT: Smallint readonly dispid 1764;
  end;

// *********************************************************************//
// DispIntf:  NOTESRICHTEXTNAVIGATOR
// Flags:     (4096) Dispatchable
// GUID:      {29131434-2EED-1069-BF5D-00DD011186B7}
// *********************************************************************//
  NOTESRICHTEXTNAVIGATOR = dispinterface
    ['{29131434-2EED-1069-BF5D-00DD011186B7}']
    function FINDNTHELEMENT(TYPE_: Smallint; OCCURRENCE: OleVariant): OleVariant; dispid 2975;
    function FINDFIRSTELEMENT(TYPE_: Smallint): OleVariant; dispid 2976;
    function FINDNEXTELEMENT(TYPE_: OleVariant; OCCURRENCE: OleVariant): OleVariant; dispid 2977;
    function FINDLASTELEMENT(TYPE_: Smallint): OleVariant; dispid 2978;
    function FINDFIRSTSTRING(const TARGET: WideString; OPTIONS: OleVariant): OleVariant; dispid 2987;
    function FINDNEXTSTRING(const TARGET: WideString; OPTIONS: OleVariant): OleVariant; dispid 2988;
    function GETELEMENT: OleVariant; dispid 2979;
    function GETFIRSTELEMENT(TYPE_: Smallint): OleVariant; dispid 2981;
    function GETNEXTELEMENT(TYPE_: OleVariant; OCCURRENCE: OleVariant): OleVariant; dispid 2982;
    function GETNTHELEMENT(TYPE_: Smallint; OCCURRENCE: OleVariant): OleVariant; dispid 2980;
    function GETLASTELEMENT(TYPE_: Smallint): OleVariant; dispid 2983;
    function CLONE: OleVariant; dispid 2984;
    procedure SETPOSITIONATEND(arg0: OleVariant); dispid 2985;
    procedure SETPOSITION(arg0: OleVariant); dispid 2986;
    procedure SETCHAROFFSET(arg0: Smallint); dispid 2989;
  end;

// *********************************************************************//
// DispIntf:  NOTESRICHTEXTRANGE
// Flags:     (4096) Dispatchable
// GUID:      {29131435-2EED-1069-BF5D-00DD011186B7}
// *********************************************************************//
  NOTESRICHTEXTRANGE = dispinterface
    ['{29131435-2EED-1069-BF5D-00DD011186B7}']
    function CLONE: OleVariant; dispid 3006;
    procedure RESET(BEGIN_: OleVariant; END_: OleVariant); dispid 3005;
    procedure REMOVE; dispid 3002;
    function FINDANDREPLACE(const arg0: WideString; const arg1: WideString; arg2: OleVariant): Integer; dispid 3007;
    procedure SETEND(arg0: OleVariant); dispid 3004;
    procedure SETBEGIN(arg0: OleVariant); dispid 3003;
    procedure SETSTYLE(arg0: OleVariant); dispid 3001;
    property NAVIGATOR: OleVariant readonly dispid 2999;
    property STYLE: OleVariant readonly dispid 2998;
    property TEXTPARAGRAPH: WideString readonly dispid 2997;
    property TEXTRUN: WideString readonly dispid 2996;
    property type_: Integer readonly dispid 2995;
  end;

// *********************************************************************//
// DispIntf:  NOTESRICHTEXTDOCLINK
// Flags:     (4096) Dispatchable
// GUID:      {29131451-2EED-1069-BF5D-00DD011186B7}
// *********************************************************************//
  NOTESRICHTEXTDOCLINK = dispinterface
    ['{29131451-2EED-1069-BF5D-00DD011186B7}']
    procedure SETHOTSPOTTEXTSTYLE(arg0: OleVariant); dispid 3509;
    procedure REMOVE; dispid 3508;
    property DBREPLICAID: WideString dispid 3500;
    property DISPLAYCOMMENT: WideString dispid 3503;
    property DOCUNID: WideString dispid 3502;
    property VIEWUNID: WideString dispid 3501;
    property HOTSPOTTEXT: WideString dispid 3505;
    property HOTSPOTTEXTSTYLE: OleVariant readonly dispid 3506;
    property SERVERHINT: WideString dispid 3504;
  end;

// *********************************************************************//
// DispIntf:  NOTESRICHTEXTSECTION
// Flags:     (4096) Dispatchable
// GUID:      {29131453-2EED-1069-BF5D-00DD011186B7}
// *********************************************************************//
  NOTESRICHTEXTSECTION = dispinterface
    ['{29131453-2EED-1069-BF5D-00DD011186B7}']
    procedure SETBARCOLOR(arg0: OleVariant); dispid 3534;
    procedure SETTITLESTYLE(arg0: OleVariant); dispid 3533;
    procedure REMOVE; dispid 3532;
    property TITLESTYLE: OleVariant readonly dispid 3527;
    property ISEXPANDED: OleVariant dispid 3528;
    property BARCOLOR: OleVariant readonly dispid 3529;
    property TITLE: WideString dispid 3526;
  end;

// *********************************************************************//
// DispIntf:  NOTESOUTLINEENTRY
// Flags:     (4096) Dispatchable
// GUID:      {29131430-2EED-1069-BF5D-00DD011186B7}
// *********************************************************************//
  NOTESOUTLINEENTRY = dispinterface
    ['{29131430-2EED-1069-BF5D-00DD011186B7}']
    function SETACTION(const FORMULA: WideString): OleVariant; dispid 2167;
    function SETNAMEDELEMENT(DATABASE: OleVariant; const DESIGNDOCUMENTNAME: WideString; 
                             ENTRYCLASS: Integer): OleVariant; dispid 2166;
    function SETURL(const URL: WideString): OleVariant; dispid 2165;
    function SETNOTELINK(DATABASE: OleVariant; VIEW: OleVariant; DOCUMENT: OleVariant): OleVariant; dispid 2164;
    property ISHIDDEN: OleVariant dispid 1570;
    property LABEL_: WideString dispid 1575;
    property ISINTHISDB: OleVariant readonly dispid 1569;
    property ENTRYCLASS: Integer readonly dispid 2128;
    property HASCHILDREN: OleVariant readonly dispid 1568;
    property LEVEL: Integer readonly dispid 1579;
    property IMAGESTEXT: WideString dispid 1577;
    property FRAMETEXT: WideString dispid 1578;
    property ONCLICKTEXT: WideString dispid 1576;
    property ALIAS: WideString dispid 2162;
    property DATABASE: OleVariant readonly dispid 2168;
    property type_: Integer readonly dispid 1574;
    property NAMEDELEMENT: WideString readonly dispid 2182;
    property ISHIDDENFROMNOTES: OleVariant dispid 1580;
    property DOCUMENT: OleVariant readonly dispid 2181;
    property URL: WideString readonly dispid 2183;
    property FORMULA: WideString readonly dispid 2184;
    property HIDEFORMULA: WideString dispid 1583;
    property VIEW: OleVariant readonly dispid 2169;
    property ISPRIVATE: OleVariant readonly dispid 1571;
    property KEEPSELECTIONFOCUS: OleVariant dispid 1582;
    property USEHIDEFORMULA: OleVariant dispid 1584;
    property ISHIDDENFROMWEB: OleVariant dispid 1581;
  end;

// *********************************************************************//
// DispIntf:  NOTESOUTLINE
// Flags:     (4096) Dispatchable
// GUID:      {29131431-2EED-1069-BF5D-00DD011186B7}
// *********************************************************************//
  NOTESOUTLINE = dispinterface
    ['{29131431-2EED-1069-BF5D-00DD011186B7}']
    function GETPREV(OUTLINEENTRY: OleVariant): OleVariant; dispid 1599;
    function GETNEXT(OUTLINEENTRY: OleVariant): OleVariant; dispid 1598;
    function GETCHILD(OUTLINEENTRY: OleVariant): OleVariant; dispid 1615;
    function GETLAST: OleVariant; dispid 1608;
    function GETPREVSIBLING(OUTLINEENTRY: OleVariant): OleVariant; dispid 1606;
    function GETNEXTSIBLING(OUTLINEENTRY: OleVariant): OleVariant; dispid 1605;
    function GETPARENT(OUTLINEENTRY: OleVariant): OleVariant; dispid 1597;
    function GETFIRST: OleVariant; dispid 1607;
    procedure ADDENTRY(NEWENTRY: OleVariant; REFERENCEENTRY: OleVariant; ADDAFTER: OleVariant; 
                       ASCHILD: OleVariant); dispid 1610;
    procedure REMOVEENTRY(REMOVEENTRY: OleVariant); dispid 1611;
    procedure MOVEENTRY(MOVEENTRY: OleVariant; REFERENCEENTRY: OleVariant; MOVEAFTER: OleVariant; 
                        ASCHILD: OleVariant); dispid 1612;
    function SAVE: Smallint; dispid 1619;
    function GETENTRY(const ENTRYNAME: WideString): OleVariant; dispid 3452;
    function CREATEENTRYFROM(ENTRY: OleVariant; REFERENCE_ENTRY: OleVariant; ADD_AFTER: OleVariant; 
                             AS_CHILD: OleVariant): OleVariant; dispid 1596;
    function CREATEENTRY(const ENTRYNAME: WideString; REFERENCE_ENTRY: OleVariant; 
                         ADD_AFTER: OleVariant; AS_CHILD: OleVariant): OleVariant; dispid 1594;
    function REMOVE: Smallint; dispid 3451;
    property COMMENT: WideString dispid 1573;
    property ALIAS: WideString dispid 1595;
    property NAME: WideString dispid 1572;
  end;

// *********************************************************************//
// DispIntf:  NOTESNOTECOLLECTION
// Flags:     (4096) Dispatchable
// GUID:      {29131436-2EED-1069-BF5D-00DD011186B7}
// *********************************************************************//
  NOTESNOTECOLLECTION = dispinterface
    ['{29131436-2EED-1069-BF5D-00DD011186B7}']
    function GETNEXTNOTEID(const NOTEID: WideString): WideString; dispid 3556;
    function GETFIRSTNOTEID: WideString; dispid 3555;
    procedure INTERSECT(INTERSECTSPECIFIER: OleVariant); dispid 3554;
    procedure REMOVE(REMOVESPECIFIER: OleVariant); dispid 3553;
    procedure ADD(ADDSPECIFIER: OleVariant); dispid 3552;
    procedure CLEARCOLLECTION; dispid 3551;
    procedure BUILDCOLLECTION; dispid 3550;
    procedure SELECTALLCODEELEMENTS(SELECTORVALUE: OleVariant); dispid 3545;
    procedure SELECTALLINDEXELEMENTS(SELECTORVALUE: OleVariant); dispid 3544;
    procedure SELECTALLFORMATELEMENTS(SELECTORVALUE: OleVariant); dispid 3543;
    procedure SELECTALLDESIGNELEMENTS(SELECTORVALUE: OleVariant); dispid 3542;
    procedure SELECTALLADMINNOTES(SELECTORVALUE: OleVariant); dispid 3541;
    procedure SELECTALLDATANOTES(SELECTORVALUE: OleVariant); dispid 3546;
    procedure SELECTALLNOTES(SELECTORVALUE: OleVariant); dispid 3540;
    property SELECTSCRIPTLIBRARIES: OleVariant dispid 3039;
    property SELECTVIEWS: OleVariant dispid 3031;
    property SELECTDATACONNECTIONS: OleVariant dispid 3040;
    property SELECTDATABASESCRIPT: OleVariant dispid 3038;
    property SELECTFORMS: OleVariant dispid 3021;
    property SELECTDOCUMENTS: OleVariant dispid 3020;
    property SELECTSUBFORMS: OleVariant dispid 3022;
    property SELECTACTIONS: OleVariant dispid 3023;
    property SELECTMISCINDEXELEMENTS: OleVariant dispid 3034;
    property SELECTFOLDERS: OleVariant dispid 3032;
    property SELECTICON: OleVariant dispid 3035;
    property SELECTAGENTS: OleVariant dispid 3036;
    property SELECTMISCCODEELEMENTS: OleVariant dispid 3041;
    property SELECTSHAREDFIELDS: OleVariant dispid 3042;
    property SELECTNAVIGATORS: OleVariant dispid 3033;
    property SELECTOUTLINES: OleVariant dispid 3037;
    property SELECTPROFILES: OleVariant dispid 3048;
    property COUNT: Integer readonly dispid 3454;
    property SELECTIONFORMULA: WideString dispid 3055;
    property SINCETIME: OleVariant dispid 3056;
    property PARENT: OleVariant readonly dispid 3455;
    property SELECTACL: OleVariant dispid 3047;
    property SELECTREPLICATIONFORMULAS: OleVariant dispid 3046;
    property SELECTHELPINDEX: OleVariant dispid 3045;
    property SELECTHELPUSING: OleVariant dispid 3044;
    property SELECTMISCFORMATELEMENTS: OleVariant dispid 3030;
    property SELECTSTYLESHEETRESOURCES: OleVariant dispid 3027;
    property SELECTFRAMESETS: OleVariant dispid 3024;
    property SELECTJAVARESOURCES: OleVariant dispid 3028;
    property SELECTHELPABOUT: OleVariant dispid 3043;
    property LASTBUILDTIME: OleVariant readonly dispid 3057;
    property SELECTPAGES: OleVariant dispid 3025;
    property SELECTIMAGERESOURCES: OleVariant dispid 3026;
  end;

// *********************************************************************//
// DispIntf:  NOTESXMLPROCESSOR
// Flags:     (4096) Dispatchable
// GUID:      {29131441-2EED-1069-BF5D-00DD011186B7}
// *********************************************************************//
  NOTESXMLPROCESSOR = dispinterface
    ['{29131441-2EED-1069-BF5D-00DD011186B7}']
    procedure PROCESS; dispid 3882;
    procedure SETOUTPUT(OUTPUT: OleVariant); dispid 3881;
    procedure SETINPUT(INPUT: OleVariant); dispid 3880;
    property EXITONFIRSTFATALERROR: OleVariant dispid 3872;
    property LOGCOMMENT: WideString dispid 3871;
    property LOG: WideString readonly dispid 3870;
  end;

// *********************************************************************//
// DispIntf:  NOTESDXLEXPORTER
// Flags:     (4096) Dispatchable
// GUID:      {29131437-2EED-1069-BF5D-00DD011186B7}
// *********************************************************************//
  NOTESDXLEXPORTER = dispinterface
    ['{29131437-2EED-1069-BF5D-00DD011186B7}']
    procedure PROCESS; dispid 3882;
    procedure SETOUTPUT(OUTPUT: OleVariant); dispid 3881;
    procedure SETINPUT(INPUT: OleVariant); dispid 3880;
    property FORCENOTEFORMAT: OleVariant dispid 3062;
    property LOG: WideString readonly dispid 3870;
    property DOCTYPESYSTEM: WideString dispid 3067;
    property EXITONFIRSTFATALERROR: OleVariant dispid 3872;
    property LOGCOMMENT: WideString dispid 3871;
    property OUTPUTDOCTYPE: OleVariant dispid 3066;
  end;

// *********************************************************************//
// DispIntf:  NOTESDXLIMPORTER
// Flags:     (4096) Dispatchable
// GUID:      {29131438-2EED-1069-BF5D-00DD011186B7}
// *********************************************************************//
  NOTESDXLIMPORTER = dispinterface
    ['{29131438-2EED-1069-BF5D-00DD011186B7}']
    procedure PROCESS; dispid 3882;
    procedure SETOUTPUT(OUTPUT: OleVariant); dispid 3881;
    procedure SETINPUT(INPUT: OleVariant); dispid 3880;
    function GETNEXTIMPORTEDNOTEID(const NOTEID: WideString): WideString; dispid 3102;
    function GETFIRSTIMPORTEDNOTEID: WideString; dispid 3101;
    property IMPORTEDNOTECOUNT: Integer readonly dispid 3091;
    property DESIGNIMPORTOPTION: Smallint dispid 3086;
    property ACLIMPORTOPTION: Smallint dispid 3085;
    property CREATEFTINDEX: OleVariant dispid 3090;
    property INPUTVALIDATIONOPTION: Smallint dispid 3089;
    property REPLICAREQUIREDFORREPLACEORUPDATE: OleVariant dispid 3092;
    property EXITONFIRSTFATALERROR: OleVariant dispid 3872;
    property LOGCOMMENT: WideString dispid 3871;
    property LOG: WideString readonly dispid 3870;
    property REPLACEDBPROPERTIES: OleVariant dispid 3088;
    property DOCUMENTIMPORTOPTION: Smallint dispid 3087;
    property UNKNOWNTOKENLOGOPTION: Smallint dispid 3093;
  end;

// *********************************************************************//
// DispIntf:  NOTESXSLTRANSFORMER
// Flags:     (4096) Dispatchable
// GUID:      {29131439-2EED-1069-BF5D-00DD011186B7}
// *********************************************************************//
  NOTESXSLTRANSFORMER = dispinterface
    ['{29131439-2EED-1069-BF5D-00DD011186B7}']
    procedure SETOUTPUT(OUTPUT: OleVariant); dispid 3881;
    procedure SETSTYLESHEET(STYLESHEET: OleVariant); dispid 3111;
    procedure PROCESS; dispid 3882;
    procedure SETINPUT(INPUT: OleVariant); dispid 3880;
    procedure ADDPARAMETER(const PARAMETERNAME: WideString; const PARAMETERVALUE: WideString); dispid 3112;
    property EXITONFIRSTFATALERROR: OleVariant dispid 3872;
    property LOGCOMMENT: WideString dispid 3871;
    property LOG: WideString readonly dispid 3870;
    property INPUTVALIDATIONOPTION: Smallint dispid 3115;
  end;

// *********************************************************************//
// DispIntf:  NOTESSAXPARSER
// Flags:     (4096) Dispatchable
// GUID:      {2913143A-2EED-1069-BF5D-00DD011186B7}
// *********************************************************************//
  NOTESSAXPARSER = dispinterface
    ['{2913143A-2EED-1069-BF5D-00DD011186B7}']
    procedure PROCESS; dispid 3882;
    procedure SETOUTPUT(OUTPUT: OleVariant); dispid 3881;
    procedure SETINPUT(INPUT: OleVariant); dispid 3880;
    procedure OUTPUT(const arg0: WideString); dispid 3121;
    property EXITONFIRSTFATALERROR: OleVariant dispid 3872;
    property LOGCOMMENT: WideString dispid 3871;
    property LOG: WideString readonly dispid 3870;
    property INPUTVALIDATIONOPTION: Smallint dispid 3123;
  end;

// *********************************************************************//
// DispIntf:  NOTESSAXATTRIBUTELIST
// Flags:     (4096) Dispatchable
// GUID:      {2913143B-2EED-1069-BF5D-00DD011186B7}
// *********************************************************************//
  NOTESSAXATTRIBUTELIST = dispinterface
    ['{2913143B-2EED-1069-BF5D-00DD011186B7}']
    function GETNAME(INDEX: Integer): WideString; dispid 3141;
    function GETVALUE(NAMEORINDEX: OleVariant): WideString; dispid 3143;
    function GETTYPE(NAMEORINDEX: OleVariant): WideString; dispid 3142;
    property LENGTH: Integer dispid 3140;
  end;

// *********************************************************************//
// DispIntf:  NOTESSAXEXCEPTION
// Flags:     (4096) Dispatchable
// GUID:      {2913143C-2EED-1069-BF5D-00DD011186B7}
// *********************************************************************//
  NOTESSAXEXCEPTION = dispinterface
    ['{2913143C-2EED-1069-BF5D-00DD011186B7}']
    property ROW: Integer readonly dispid 3150;
    property COLUMN: Integer readonly dispid 3151;
    property MESSAGE: WideString readonly dispid 3152;
    property PUBLICID: WideString readonly dispid 3153;
    property SYSTEMID: WideString readonly dispid 3154;
  end;

// *********************************************************************//
// DispIntf:  NOTESDOMPARSER
// Flags:     (4096) Dispatchable
// GUID:      {2913143D-2EED-1069-BF5D-00DD011186B7}
// *********************************************************************//
  NOTESDOMPARSER = dispinterface
    ['{2913143D-2EED-1069-BF5D-00DD011186B7}']
    procedure PROCESS; dispid 3882;
    procedure SETOUTPUT(OUTPUT: OleVariant); dispid 3881;
    procedure SETINPUT(INPUT: OleVariant); dispid 3880;
    procedure SERIALIZE; dispid 3172;
    procedure OUTPUT(const OUTPUTTEXT: WideString); dispid 3171;
    property LOG: WideString readonly dispid 3870;
    property DONAMESPACES: OleVariant dispid 3160;
    property ADDXMLDECLNODE: OleVariant dispid 3163;
    property DOCUMENT: OleVariant readonly dispid 3164;
    property LOGCOMMENT: WideString dispid 3871;
    property EXITONFIRSTFATALERROR: OleVariant dispid 3872;
    property INPUTVALIDATIONOPTION: Smallint dispid 3161;
    property EXPANDENTITYREFERENCES: OleVariant dispid 3162;
  end;

// *********************************************************************//
// DispIntf:  NOTESDOMNAMEDNODEMAP
// Flags:     (4096) Dispatchable
// GUID:      {2913143E-2EED-1069-BF5D-00DD011186B7}
// *********************************************************************//
  NOTESDOMNAMEDNODEMAP = dispinterface
    ['{2913143E-2EED-1069-BF5D-00DD011186B7}']
    function GETITEM(INDEX: Integer): OleVariant; dispid 3181;
    property NUMBEROFENTRIES: Integer readonly dispid 3180;
  end;

// *********************************************************************//
// DispIntf:  NOTESDOMNODELIST
// Flags:     (4096) Dispatchable
// GUID:      {2913143F-2EED-1069-BF5D-00DD011186B7}
// *********************************************************************//
  NOTESDOMNODELIST = dispinterface
    ['{2913143F-2EED-1069-BF5D-00DD011186B7}']
    function GETITEM(INDEX: Integer): OleVariant; dispid 3186;
    property NUMBEROFENTRIES: Integer readonly dispid 3185;
  end;

// *********************************************************************//
// DispIntf:  NOTESDOMNODE
// Flags:     (4096) Dispatchable
// GUID:      {29131440-2EED-1069-BF5D-00DD011186B7}
// *********************************************************************//
  NOTESDOMNODE = dispinterface
    ['{29131440-2EED-1069-BF5D-00DD011186B7}']
    function CLONE(DEEPCLONE: OleVariant): OleVariant; dispid 3213;
    function APPENDCHILD(NEWCHILD: OleVariant): OleVariant; dispid 3212;
    function REMOVECHILD(CHILD: OleVariant): OleVariant; dispid 3211;
    function REPLACECHILD(NEWCHILD: OleVariant; OLDCHILD: OleVariant): OleVariant; dispid 3210;
    property LOCALNAME: WideString readonly dispid 3194;
    property NODETYPE: Integer readonly dispid 3191;
    property ISNULL: OleVariant readonly dispid 3190;
    property PARENTNODE: OleVariant readonly dispid 3197;
    property NODEVALUE: WideString dispid 3196;
    property NODENAME: WideString readonly dispid 3195;
    property FIRSTCHILD: OleVariant readonly dispid 3198;
    property NAMESPACEURI: WideString readonly dispid 3193;
    property LASTCHILD: OleVariant readonly dispid 3203;
    property NEXTSIBLING: OleVariant readonly dispid 3200;
    property ATTRIBUTES: OleVariant readonly dispid 3201;
    property NUMBEROFCHILDNODES: Integer readonly dispid 3206;
    property PREFIX: WideString dispid 3192;
    property PREVIOUSSIBLING: OleVariant readonly dispid 3199;
    property HASCHILDNODES: OleVariant readonly dispid 3205;
  end;

// *********************************************************************//
// DispIntf:  NOTESDOMDOCUMENTNODE
// Flags:     (4096) Dispatchable
// GUID:      {29131443-2EED-1069-BF5D-00DD011186B7}
// *********************************************************************//
  NOTESDOMDOCUMENTNODE = dispinterface
    ['{29131443-2EED-1069-BF5D-00DD011186B7}']
    function CLONE(DEEPCLONE: OleVariant): OleVariant; dispid 3213;
    function APPENDCHILD(NEWCHILD: OleVariant): OleVariant; dispid 3212;
    function REMOVECHILD(CHILD: OleVariant): OleVariant; dispid 3211;
    function REPLACECHILD(NEWCHILD: OleVariant; OLDCHILD: OleVariant): OleVariant; dispid 3210;
    function GETELEMENTSBYTAGNAME(const ELEMENTNAME: WideString): OleVariant; dispid 3331;
    function CREATEXMLDECLNODE(const VERSION: WideString; const ENCODING: WideString; 
                               const STANDALONE: WideString): OleVariant; dispid 3333;
    function CREATEDOCUMENTFRAGMENTNODE: OleVariant; dispid 3330;
    function CREATECOMMENTNODE(const COMMENT: WideString): OleVariant; dispid 3329;
    function CREATEPROCESSINGINSTRUCTIONNODE(const TARGET: WideString; const DATA: WideString): OleVariant; dispid 3328;
    function CREATEENTITYREFERENCENODE(const ENTITYREFERENCENAME: WideString): OleVariant; dispid 3327;
    function CREATECDATASECTIONNODE(const CDATASECTION: WideString): OleVariant; dispid 3326;
    function CREATETEXTNODE(const TEXT: WideString): OleVariant; dispid 3325;
    function CREATENOTATIONNODE(const NOTATIONNAME: WideString): OleVariant; dispid 3332;
    function CREATEATTRIBUTENODE(const ATTRIBUTENAME: WideString): OleVariant; dispid 3324;
    function CREATEELEMENTNODE(const ELEMENTNAME: WideString): OleVariant; dispid 3323;
    function CREATEDOCUMENTNODE: OleVariant; dispid 3322;
    property NUMBEROFCHILDNODES: Integer readonly dispid 3206;
    property HASCHILDNODES: OleVariant readonly dispid 3205;
    property LASTCHILD: OleVariant readonly dispid 3203;
    property ATTRIBUTES: OleVariant readonly dispid 3201;
    property NEXTSIBLING: OleVariant readonly dispid 3200;
    property PREVIOUSSIBLING: OleVariant readonly dispid 3199;
    property FIRSTCHILD: OleVariant readonly dispid 3198;
    property PARENTNODE: OleVariant readonly dispid 3197;
    property NODEVALUE: WideString dispid 3196;
    property NODENAME: WideString readonly dispid 3195;
    property LOCALNAME: WideString readonly dispid 3194;
    property NAMESPACEURI: WideString readonly dispid 3193;
    property PREFIX: WideString dispid 3192;
    property NODETYPE: Integer readonly dispid 3191;
    property ISNULL: OleVariant readonly dispid 3190;
    property DOCUMENTELEMENT: OleVariant readonly dispid 3321;
  end;

// *********************************************************************//
// DispIntf:  NOTESDOMELEMENTNODE
// Flags:     (4096) Dispatchable
// GUID:      {29131444-2EED-1069-BF5D-00DD011186B7}
// *********************************************************************//
  NOTESDOMELEMENTNODE = dispinterface
    ['{29131444-2EED-1069-BF5D-00DD011186B7}']
    function CLONE(DEEPCLONE: OleVariant): OleVariant; dispid 3213;
    function APPENDCHILD(NEWCHILD: OleVariant): OleVariant; dispid 3212;
    function REMOVECHILD(CHILD: OleVariant): OleVariant; dispid 3211;
    function REPLACECHILD(NEWCHILD: OleVariant; OLDCHILD: OleVariant): OleVariant; dispid 3210;
    function REMOVEATTRIBUTENODE(ATTRIBUTENODE: OleVariant): OleVariant; dispid 3247;
    procedure REMOVEATTRIBUTE(const ATTRIBUTENAME: WideString); dispid 3246;
    function SETATTRIBUTENODE(ATTRIBUTENODE: OleVariant): OleVariant; dispid 3245;
    procedure SETATTRIBUTE(const ATTRIBUTENAME: WideString; const ATTRIBUTEVALUE: WideString); dispid 3244;
    function GETATTRIBUTENODE(const ATTRIBUTENAME: WideString): OleVariant; dispid 3243;
    function GETATTRIBUTE(const ATTRIBUTENAME: WideString): WideString; dispid 3242;
    function GETELEMENTSBYTAGNAME(const TAGNAME: WideString): OleVariant; dispid 3241;
    property PREVIOUSSIBLING: OleVariant readonly dispid 3199;
    property NEXTSIBLING: OleVariant readonly dispid 3200;
    property NODETYPE: Integer readonly dispid 3191;
    property NODENAME: WideString readonly dispid 3195;
    property PARENTNODE: OleVariant readonly dispid 3197;
    property FIRSTCHILD: OleVariant readonly dispid 3198;
    property ATTRIBUTES: OleVariant readonly dispid 3201;
    property NODEVALUE: WideString dispid 3196;
    property LASTCHILD: OleVariant readonly dispid 3203;
    property PREFIX: WideString dispid 3192;
    property HASCHILDNODES: OleVariant readonly dispid 3205;
    property NUMBEROFCHILDNODES: Integer readonly dispid 3206;
    property TAGNAME: WideString readonly dispid 3240;
    property ISNULL: OleVariant readonly dispid 3190;
    property NAMESPACEURI: WideString readonly dispid 3193;
    property LOCALNAME: WideString readonly dispid 3194;
  end;

// *********************************************************************//
// DispIntf:  NOTESDOMATTRIBUTENODE
// Flags:     (4096) Dispatchable
// GUID:      {29131445-2EED-1069-BF5D-00DD011186B7}
// *********************************************************************//
  NOTESDOMATTRIBUTENODE = dispinterface
    ['{29131445-2EED-1069-BF5D-00DD011186B7}']
    function CLONE(DEEPCLONE: OleVariant): OleVariant; dispid 3213;
    function APPENDCHILD(NEWCHILD: OleVariant): OleVariant; dispid 3212;
    function REMOVECHILD(CHILD: OleVariant): OleVariant; dispid 3211;
    function REPLACECHILD(NEWCHILD: OleVariant; OLDCHILD: OleVariant): OleVariant; dispid 3210;
    property ATTRIBUTEVALUE: WideString dispid 3261;
    property PREFIX: WideString dispid 3192;
    property ISSPECIFIED: OleVariant readonly dispid 3262;
    property ATTRIBUTENAME: WideString readonly dispid 3260;
    property NODEVALUE: WideString dispid 3196;
    property NAMESPACEURI: WideString readonly dispid 3193;
    property LOCALNAME: WideString readonly dispid 3194;
    property PARENTNODE: OleVariant readonly dispid 3197;
    property NODENAME: WideString readonly dispid 3195;
    property FIRSTCHILD: OleVariant readonly dispid 3198;
    property ATTRIBUTES: OleVariant readonly dispid 3201;
    property NEXTSIBLING: OleVariant readonly dispid 3200;
    property PREVIOUSSIBLING: OleVariant readonly dispid 3199;
    property NUMBEROFCHILDNODES: Integer readonly dispid 3206;
    property ISNULL: OleVariant readonly dispid 3190;
    property NODETYPE: Integer readonly dispid 3191;
    property HASCHILDNODES: OleVariant readonly dispid 3205;
    property LASTCHILD: OleVariant readonly dispid 3203;
  end;

// *********************************************************************//
// DispIntf:  NOTESDOMCHARACTERDATANODE
// Flags:     (4096) Dispatchable
// GUID:      {29131458-2EED-1069-BF5D-00DD011186B7}
// *********************************************************************//
  NOTESDOMCHARACTERDATANODE = dispinterface
    ['{29131458-2EED-1069-BF5D-00DD011186B7}']
    function CLONE(DEEPCLONE: OleVariant): OleVariant; dispid 3213;
    function APPENDCHILD(NEWCHILD: OleVariant): OleVariant; dispid 3212;
    function REMOVECHILD(CHILD: OleVariant): OleVariant; dispid 3211;
    function REPLACECHILD(NEWCHILD: OleVariant; OLDCHILD: OleVariant): OleVariant; dispid 3210;
    procedure REPLACEDATA(OFFSET: Integer; COUNT: Integer; const REPLACEMENTTEXT: WideString); dispid 3944;
    procedure DELETEDATA(OFFSET: Integer; COUNT: Integer); dispid 3943;
    procedure INSERTDATA(OFFSET: Integer; const INSERTTEXT: WideString); dispid 3942;
    procedure APPENDDATA(const APPENDTEXT: WideString); dispid 3941;
    function SUBSTRINGDATA(OFFSET: Integer; COUNT: Integer): WideString; dispid 3940;
    property NEXTSIBLING: OleVariant readonly dispid 3200;
    property PREVIOUSSIBLING: OleVariant readonly dispid 3199;
    property PREFIX: WideString dispid 3192;
    property ATTRIBUTES: OleVariant readonly dispid 3201;
    property FIRSTCHILD: OleVariant readonly dispid 3198;
    property PARENTNODE: OleVariant readonly dispid 3197;
    property NODEVALUE: WideString dispid 3196;
    property NODETYPE: Integer readonly dispid 3191;
    property NUMBEROFCHILDNODES: Integer readonly dispid 3206;
    property HASCHILDNODES: OleVariant readonly dispid 3205;
    property LASTCHILD: OleVariant readonly dispid 3203;
    property NAMESPACEURI: WideString readonly dispid 3193;
    property ISNULL: OleVariant readonly dispid 3190;
    property NODENAME: WideString readonly dispid 3195;
    property LOCALNAME: WideString readonly dispid 3194;
  end;

// *********************************************************************//
// DispIntf:  NOTESDOMCOMMENTNODE
// Flags:     (4096) Dispatchable
// GUID:      {2913144B-2EED-1069-BF5D-00DD011186B7}
// *********************************************************************//
  NOTESDOMCOMMENTNODE = dispinterface
    ['{2913144B-2EED-1069-BF5D-00DD011186B7}']
    function CLONE(DEEPCLONE: OleVariant): OleVariant; dispid 3213;
    function APPENDCHILD(NEWCHILD: OleVariant): OleVariant; dispid 3212;
    function REMOVECHILD(CHILD: OleVariant): OleVariant; dispid 3211;
    function REPLACECHILD(NEWCHILD: OleVariant; OLDCHILD: OleVariant): OleVariant; dispid 3210;
    procedure REPLACEDATA(OFFSET: Integer; COUNT: Integer; const REPLACEMENTTEXT: WideString); dispid 3944;
    procedure DELETEDATA(OFFSET: Integer; COUNT: Integer); dispid 3943;
    procedure INSERTDATA(OFFSET: Integer; const INSERTTEXT: WideString); dispid 3942;
    procedure APPENDDATA(const APPENDTEXT: WideString); dispid 3941;
    function SUBSTRINGDATA(OFFSET: Integer; COUNT: Integer): WideString; dispid 3940;
    property NEXTSIBLING: OleVariant readonly dispid 3200;
    property PREVIOUSSIBLING: OleVariant readonly dispid 3199;
    property PREFIX: WideString dispid 3192;
    property ATTRIBUTES: OleVariant readonly dispid 3201;
    property FIRSTCHILD: OleVariant readonly dispid 3198;
    property PARENTNODE: OleVariant readonly dispid 3197;
    property NODEVALUE: WideString dispid 3196;
    property NODETYPE: Integer readonly dispid 3191;
    property NUMBEROFCHILDNODES: Integer readonly dispid 3206;
    property HASCHILDNODES: OleVariant readonly dispid 3205;
    property LASTCHILD: OleVariant readonly dispid 3203;
    property NAMESPACEURI: WideString readonly dispid 3193;
    property ISNULL: OleVariant readonly dispid 3190;
    property NODENAME: WideString readonly dispid 3195;
    property LOCALNAME: WideString readonly dispid 3194;
  end;

// *********************************************************************//
// DispIntf:  NOTESDOMTEXTNODE
// Flags:     (4096) Dispatchable
// GUID:      {29131446-2EED-1069-BF5D-00DD011186B7}
// *********************************************************************//
  NOTESDOMTEXTNODE = dispinterface
    ['{29131446-2EED-1069-BF5D-00DD011186B7}']
    function CLONE(DEEPCLONE: OleVariant): OleVariant; dispid 3213;
    function APPENDCHILD(NEWCHILD: OleVariant): OleVariant; dispid 3212;
    function REMOVECHILD(CHILD: OleVariant): OleVariant; dispid 3211;
    function REPLACECHILD(NEWCHILD: OleVariant; OLDCHILD: OleVariant): OleVariant; dispid 3210;
    procedure REPLACEDATA(OFFSET: Integer; COUNT: Integer; const REPLACEMENTTEXT: WideString); dispid 3944;
    procedure DELETEDATA(OFFSET: Integer; COUNT: Integer); dispid 3943;
    procedure INSERTDATA(OFFSET: Integer; const INSERTTEXT: WideString); dispid 3942;
    procedure APPENDDATA(const APPENDTEXT: WideString); dispid 3941;
    function SUBSTRINGDATA(OFFSET: Integer; COUNT: Integer): WideString; dispid 3940;
    function SPLITTEXT(OFFSET: Integer): OleVariant; dispid 3270;
    property NEXTSIBLING: OleVariant readonly dispid 3200;
    property PREVIOUSSIBLING: OleVariant readonly dispid 3199;
    property PREFIX: WideString dispid 3192;
    property ATTRIBUTES: OleVariant readonly dispid 3201;
    property FIRSTCHILD: OleVariant readonly dispid 3198;
    property PARENTNODE: OleVariant readonly dispid 3197;
    property NODEVALUE: WideString dispid 3196;
    property NODETYPE: Integer readonly dispid 3191;
    property LASTCHILD: OleVariant readonly dispid 3203;
    property NUMBEROFCHILDNODES: Integer readonly dispid 3206;
    property HASCHILDNODES: OleVariant readonly dispid 3205;
    property NAMESPACEURI: WideString readonly dispid 3193;
    property ISNULL: OleVariant readonly dispid 3190;
    property NODENAME: WideString readonly dispid 3195;
    property LOCALNAME: WideString readonly dispid 3194;
  end;

// *********************************************************************//
// DispIntf:  NOTESDOMCDATASECTIONNODE
// Flags:     (4096) Dispatchable
// GUID:      {29131447-2EED-1069-BF5D-00DD011186B7}
// *********************************************************************//
  NOTESDOMCDATASECTIONNODE = dispinterface
    ['{29131447-2EED-1069-BF5D-00DD011186B7}']
    function CLONE(DEEPCLONE: OleVariant): OleVariant; dispid 3213;
    function APPENDCHILD(NEWCHILD: OleVariant): OleVariant; dispid 3212;
    function REMOVECHILD(CHILD: OleVariant): OleVariant; dispid 3211;
    function REPLACECHILD(NEWCHILD: OleVariant; OLDCHILD: OleVariant): OleVariant; dispid 3210;
    procedure REPLACEDATA(OFFSET: Integer; COUNT: Integer; const REPLACEMENTTEXT: WideString); dispid 3944;
    procedure DELETEDATA(OFFSET: Integer; COUNT: Integer); dispid 3943;
    procedure INSERTDATA(OFFSET: Integer; const INSERTTEXT: WideString); dispid 3942;
    procedure APPENDDATA(const APPENDTEXT: WideString); dispid 3941;
    function SUBSTRINGDATA(OFFSET: Integer; COUNT: Integer): WideString; dispid 3940;
    function SPLITTEXT(OFFSET: Integer): OleVariant; dispid 3270;
    property NEXTSIBLING: OleVariant readonly dispid 3200;
    property PREVIOUSSIBLING: OleVariant readonly dispid 3199;
    property PREFIX: WideString dispid 3192;
    property ATTRIBUTES: OleVariant readonly dispid 3201;
    property FIRSTCHILD: OleVariant readonly dispid 3198;
    property PARENTNODE: OleVariant readonly dispid 3197;
    property NODEVALUE: WideString dispid 3196;
    property NODETYPE: Integer readonly dispid 3191;
    property LASTCHILD: OleVariant readonly dispid 3203;
    property NUMBEROFCHILDNODES: Integer readonly dispid 3206;
    property HASCHILDNODES: OleVariant readonly dispid 3205;
    property NAMESPACEURI: WideString readonly dispid 3193;
    property ISNULL: OleVariant readonly dispid 3190;
    property NODENAME: WideString readonly dispid 3195;
    property LOCALNAME: WideString readonly dispid 3194;
  end;

// *********************************************************************//
// DispIntf:  NOTESDOMENTITYREFERENCENODE
// Flags:     (4096) Dispatchable
// GUID:      {29131448-2EED-1069-BF5D-00DD011186B7}
// *********************************************************************//
  NOTESDOMENTITYREFERENCENODE = dispinterface
    ['{29131448-2EED-1069-BF5D-00DD011186B7}']
    function CLONE(DEEPCLONE: OleVariant): OleVariant; dispid 3213;
    function APPENDCHILD(NEWCHILD: OleVariant): OleVariant; dispid 3212;
    function REMOVECHILD(CHILD: OleVariant): OleVariant; dispid 3211;
    function REPLACECHILD(NEWCHILD: OleVariant; OLDCHILD: OleVariant): OleVariant; dispid 3210;
    property LOCALNAME: WideString readonly dispid 3194;
    property NODETYPE: Integer readonly dispid 3191;
    property ISNULL: OleVariant readonly dispid 3190;
    property PARENTNODE: OleVariant readonly dispid 3197;
    property NODEVALUE: WideString dispid 3196;
    property NODENAME: WideString readonly dispid 3195;
    property FIRSTCHILD: OleVariant readonly dispid 3198;
    property NAMESPACEURI: WideString readonly dispid 3193;
    property LASTCHILD: OleVariant readonly dispid 3203;
    property NEXTSIBLING: OleVariant readonly dispid 3200;
    property ATTRIBUTES: OleVariant readonly dispid 3201;
    property NUMBEROFCHILDNODES: Integer readonly dispid 3206;
    property PREFIX: WideString dispid 3192;
    property PREVIOUSSIBLING: OleVariant readonly dispid 3199;
    property HASCHILDNODES: OleVariant readonly dispid 3205;
  end;

// *********************************************************************//
// DispIntf:  NOTESDOMENTITYNODE
// Flags:     (4096) Dispatchable
// GUID:      {29131449-2EED-1069-BF5D-00DD011186B7}
// *********************************************************************//
  NOTESDOMENTITYNODE = dispinterface
    ['{29131449-2EED-1069-BF5D-00DD011186B7}']
    function CLONE(DEEPCLONE: OleVariant): OleVariant; dispid 3213;
    function APPENDCHILD(NEWCHILD: OleVariant): OleVariant; dispid 3212;
    function REMOVECHILD(CHILD: OleVariant): OleVariant; dispid 3211;
    function REPLACECHILD(NEWCHILD: OleVariant; OLDCHILD: OleVariant): OleVariant; dispid 3210;
    property LOCALNAME: WideString readonly dispid 3194;
    property NODETYPE: Integer readonly dispid 3191;
    property ISNULL: OleVariant readonly dispid 3190;
    property PARENTNODE: OleVariant readonly dispid 3197;
    property NODEVALUE: WideString dispid 3196;
    property NODENAME: WideString readonly dispid 3195;
    property FIRSTCHILD: OleVariant readonly dispid 3198;
    property NAMESPACEURI: WideString readonly dispid 3193;
    property LASTCHILD: OleVariant readonly dispid 3203;
    property NEXTSIBLING: OleVariant readonly dispid 3200;
    property ATTRIBUTES: OleVariant readonly dispid 3201;
    property NUMBEROFCHILDNODES: Integer readonly dispid 3206;
    property PREFIX: WideString dispid 3192;
    property PREVIOUSSIBLING: OleVariant readonly dispid 3199;
    property HASCHILDNODES: OleVariant readonly dispid 3205;
  end;

// *********************************************************************//
// DispIntf:  NOTESDOMPROCESSINGINSTRUCTIONNODE
// Flags:     (4096) Dispatchable
// GUID:      {2913144A-2EED-1069-BF5D-00DD011186B7}
// *********************************************************************//
  NOTESDOMPROCESSINGINSTRUCTIONNODE = dispinterface
    ['{2913144A-2EED-1069-BF5D-00DD011186B7}']
    function CLONE(DEEPCLONE: OleVariant): OleVariant; dispid 3213;
    function APPENDCHILD(NEWCHILD: OleVariant): OleVariant; dispid 3212;
    function REMOVECHILD(CHILD: OleVariant): OleVariant; dispid 3211;
    function REPLACECHILD(NEWCHILD: OleVariant; OLDCHILD: OleVariant): OleVariant; dispid 3210;
    property DATA: WideString dispid 3296;
    property NODEVALUE: WideString dispid 3196;
    property ISNULL: OleVariant readonly dispid 3190;
    property TARGET: WideString readonly dispid 3295;
    property NAMESPACEURI: WideString readonly dispid 3193;
    property LOCALNAME: WideString readonly dispid 3194;
    property PARENTNODE: OleVariant readonly dispid 3197;
    property NODENAME: WideString readonly dispid 3195;
    property PREFIX: WideString dispid 3192;
    property PREVIOUSSIBLING: OleVariant readonly dispid 3199;
    property NUMBEROFCHILDNODES: Integer readonly dispid 3206;
    property ATTRIBUTES: OleVariant readonly dispid 3201;
    property NEXTSIBLING: OleVariant readonly dispid 3200;
    property FIRSTCHILD: OleVariant readonly dispid 3198;
    property NODETYPE: Integer readonly dispid 3191;
    property HASCHILDNODES: OleVariant readonly dispid 3205;
    property LASTCHILD: OleVariant readonly dispid 3203;
  end;

// *********************************************************************//
// DispIntf:  NOTESDOMDOCUMENTTYPENODE
// Flags:     (4096) Dispatchable
// GUID:      {2913144D-2EED-1069-BF5D-00DD011186B7}
// *********************************************************************//
  NOTESDOMDOCUMENTTYPENODE = dispinterface
    ['{2913144D-2EED-1069-BF5D-00DD011186B7}']
    function CLONE(DEEPCLONE: OleVariant): OleVariant; dispid 3213;
    function APPENDCHILD(NEWCHILD: OleVariant): OleVariant; dispid 3212;
    function REMOVECHILD(CHILD: OleVariant): OleVariant; dispid 3211;
    function REPLACECHILD(NEWCHILD: OleVariant; OLDCHILD: OleVariant): OleVariant; dispid 3210;
    property LOCALNAME: WideString readonly dispid 3194;
    property NODETYPE: Integer readonly dispid 3191;
    property ISNULL: OleVariant readonly dispid 3190;
    property PARENTNODE: OleVariant readonly dispid 3197;
    property NODEVALUE: WideString dispid 3196;
    property NODENAME: WideString readonly dispid 3195;
    property FIRSTCHILD: OleVariant readonly dispid 3198;
    property NAMESPACEURI: WideString readonly dispid 3193;
    property LASTCHILD: OleVariant readonly dispid 3203;
    property NEXTSIBLING: OleVariant readonly dispid 3200;
    property ATTRIBUTES: OleVariant readonly dispid 3201;
    property NUMBEROFCHILDNODES: Integer readonly dispid 3206;
    property PREFIX: WideString dispid 3192;
    property PREVIOUSSIBLING: OleVariant readonly dispid 3199;
    property HASCHILDNODES: OleVariant readonly dispid 3205;
  end;

// *********************************************************************//
// DispIntf:  NOTESDOMDOCUMENTFRAGMENTNODE
// Flags:     (4096) Dispatchable
// GUID:      {29131456-2EED-1069-BF5D-00DD011186B7}
// *********************************************************************//
  NOTESDOMDOCUMENTFRAGMENTNODE = dispinterface
    ['{29131456-2EED-1069-BF5D-00DD011186B7}']
    function CLONE(DEEPCLONE: OleVariant): OleVariant; dispid 3213;
    function APPENDCHILD(NEWCHILD: OleVariant): OleVariant; dispid 3212;
    function REMOVECHILD(CHILD: OleVariant): OleVariant; dispid 3211;
    function REPLACECHILD(NEWCHILD: OleVariant; OLDCHILD: OleVariant): OleVariant; dispid 3210;
    property LOCALNAME: WideString readonly dispid 3194;
    property NODETYPE: Integer readonly dispid 3191;
    property ISNULL: OleVariant readonly dispid 3190;
    property PARENTNODE: OleVariant readonly dispid 3197;
    property NODEVALUE: WideString dispid 3196;
    property NODENAME: WideString readonly dispid 3195;
    property FIRSTCHILD: OleVariant readonly dispid 3198;
    property NAMESPACEURI: WideString readonly dispid 3193;
    property LASTCHILD: OleVariant readonly dispid 3203;
    property NEXTSIBLING: OleVariant readonly dispid 3200;
    property ATTRIBUTES: OleVariant readonly dispid 3201;
    property NUMBEROFCHILDNODES: Integer readonly dispid 3206;
    property PREFIX: WideString dispid 3192;
    property PREVIOUSSIBLING: OleVariant readonly dispid 3199;
    property HASCHILDNODES: OleVariant readonly dispid 3205;
  end;

// *********************************************************************//
// DispIntf:  NOTESDOMNOTATIONNODE
// Flags:     (4096) Dispatchable
// GUID:      {29131457-2EED-1069-BF5D-00DD011186B7}
// *********************************************************************//
  NOTESDOMNOTATIONNODE = dispinterface
    ['{29131457-2EED-1069-BF5D-00DD011186B7}']
    function CLONE(DEEPCLONE: OleVariant): OleVariant; dispid 3213;
    function APPENDCHILD(NEWCHILD: OleVariant): OleVariant; dispid 3212;
    function REMOVECHILD(CHILD: OleVariant): OleVariant; dispid 3211;
    function REPLACECHILD(NEWCHILD: OleVariant; OLDCHILD: OleVariant): OleVariant; dispid 3210;
    property SYSTEMID: WideString readonly dispid 3356;
    property NODEVALUE: WideString dispid 3196;
    property ISNULL: OleVariant readonly dispid 3190;
    property PUBLICID: WideString readonly dispid 3355;
    property NAMESPACEURI: WideString readonly dispid 3193;
    property LOCALNAME: WideString readonly dispid 3194;
    property PARENTNODE: OleVariant readonly dispid 3197;
    property NODENAME: WideString readonly dispid 3195;
    property PREFIX: WideString dispid 3192;
    property PREVIOUSSIBLING: OleVariant readonly dispid 3199;
    property NUMBEROFCHILDNODES: Integer readonly dispid 3206;
    property ATTRIBUTES: OleVariant readonly dispid 3201;
    property NEXTSIBLING: OleVariant readonly dispid 3200;
    property FIRSTCHILD: OleVariant readonly dispid 3198;
    property NODETYPE: Integer readonly dispid 3191;
    property HASCHILDNODES: OleVariant readonly dispid 3205;
    property LASTCHILD: OleVariant readonly dispid 3203;
  end;

// *********************************************************************//
// DispIntf:  NOTESDOMXMLDECLNODE
// Flags:     (4096) Dispatchable
// GUID:      {2913144C-2EED-1069-BF5D-00DD011186B7}
// *********************************************************************//
  NOTESDOMXMLDECLNODE = dispinterface
    ['{2913144C-2EED-1069-BF5D-00DD011186B7}']
    function CLONE(DEEPCLONE: OleVariant): OleVariant; dispid 3213;
    function APPENDCHILD(NEWCHILD: OleVariant): OleVariant; dispid 3212;
    function REMOVECHILD(CHILD: OleVariant): OleVariant; dispid 3211;
    function REPLACECHILD(NEWCHILD: OleVariant; OLDCHILD: OleVariant): OleVariant; dispid 3210;
    property ENCODING: WideString readonly dispid 3761;
    property PREFIX: WideString dispid 3192;
    property STANDALONE: WideString readonly dispid 3762;
    property VERSION: WideString readonly dispid 3760;
    property NODEVALUE: WideString dispid 3196;
    property NAMESPACEURI: WideString readonly dispid 3193;
    property LOCALNAME: WideString readonly dispid 3194;
    property PARENTNODE: OleVariant readonly dispid 3197;
    property NODENAME: WideString readonly dispid 3195;
    property FIRSTCHILD: OleVariant readonly dispid 3198;
    property ATTRIBUTES: OleVariant readonly dispid 3201;
    property NEXTSIBLING: OleVariant readonly dispid 3200;
    property PREVIOUSSIBLING: OleVariant readonly dispid 3199;
    property NUMBEROFCHILDNODES: Integer readonly dispid 3206;
    property ISNULL: OleVariant readonly dispid 3190;
    property NODETYPE: Integer readonly dispid 3191;
    property HASCHILDNODES: OleVariant readonly dispid 3205;
    property LASTCHILD: OleVariant readonly dispid 3203;
  end;

// *********************************************************************//
// DispIntf:  NOTESSTREAM
// Flags:     (4096) Dispatchable
// GUID:      {2913144F-2EED-1069-BF5D-00DD011186B7}
// *********************************************************************//
  NOTESSTREAM = dispinterface
    ['{2913144F-2EED-1069-BF5D-00DD011186B7}']
    function WRITE(WRITEARRAY: OleVariant): Integer; dispid 3402;
    function READTEXT(READLENGTH: OleVariant; ENDOFLINE: OleVariant): WideString; dispid 3401;
    procedure TRUNCATE; dispid 3399;
    function WRITETEXT(const WRITESTRING: WideString; ENDOFLINE: OleVariant): Integer; dispid 3403;
    function READ(READLENGTH: OleVariant): OleVariant; dispid 3400;
    procedure CLOSE; dispid 3398;
    function OPEN(const PATHNAME: WideString; CHARSET: OleVariant): OleVariant; dispid 3397;
    property ISREADONLY: OleVariant readonly dispid 3384;
    property BYTES: Integer readonly dispid 3383;
    property POSITION: Integer dispid 3382;
    property ISEOS: OleVariant readonly dispid 3381;
    property CHARSET: WideString readonly dispid 3380;
  end;

// *********************************************************************//
// DispIntf:  NOTESADMINISTRATIONPROCESS
// Flags:     (4096) Dispatchable
// GUID:      {29131450-2EED-1069-BF5D-00DD011186B7}
// *********************************************************************//
  NOTESADMINISTRATIONPROCESS = dispinterface
    ['{29131450-2EED-1069-BF5D-00DD011186B7}']
    function DELETEGROUP(const GROUPNAME: WideString; IMMEDIATE: OleVariant; 
                         DELETEWINDOWSGROUP: OleVariant): WideString; dispid 3445;
    function CHANGEHTTPPASSWORD(const USERNAME: WideString; const OLDPASSWORD: WideString; 
                                const NEWPASSWORD: WideString): WideString; dispid 3446;
    function RENAMENOTESUSER(const USERNAME: WideString; LASTNAME: OleVariant; 
                             FIRSTNAME: OleVariant; MIDDLEINITIAL: OleVariant; ORGUNIT: OleVariant; 
                             ALTCOMMONNAME: OleVariant; ALTORGUNIT: OleVariant; 
                             ALTLANGUAGE: OleVariant; RENAMEWINDOWSUSER: OleVariant): WideString; dispid 3435;
    function UPGRADEUSERTOHIERARCHICAL(const USERNAME: WideString; ORGUNIT: OleVariant; 
                                       ALTCOMMONNAME: OleVariant; ALTORGUNIT: OleVariant; 
                                       ALTLANGUAGE: OleVariant): WideString; dispid 3436;
    function DELETEUSER(const USERNAME: WideString; IMMEDIATE: OleVariant; 
                        MAILFILEACTION: Smallint; const DENYGROUP: WideString; 
                        DELETEWINDOWSUSER: OleVariant): WideString; dispid 3440;
    function ADDSERVERTOCLUSTER(const SERVER: WideString; const CLUSTER: WideString): WideString; dispid 3603;
    function FINDGROUPINDOMAIN(const GROUP: WideString): WideString; dispid 3601;
    function RENAMEWEBUSER(const USERNAME: WideString; const NEWUSERNAME: WideString; 
                           NEWLASTNAME: OleVariant; NEWFIRSTNAME: OleVariant; 
                           NEWMIDDLEINITIAL: OleVariant; NEWSHORTNAME: OleVariant; 
                           NEWINTERNETADDRESS: OleVariant): WideString; dispid 3444;
    function FINDSERVERINDOMAIN(const SERVER: WideString): WideString; dispid 3602;
    function MOVEUSERINHIERARCHYCOMPLETE(const REQUESTNOTEID: WideString; LASTNAME: OleVariant; 
                                         FIRSTNAME: OleVariant; MIDDLEINITIAL: OleVariant; 
                                         ORGUNIT: OleVariant; ALTCOMMONNAME: OleVariant; 
                                         ALTORGUNIT: OleVariant; ALTLANGUAGE: OleVariant; 
                                         RENAMEWINDOWSUSER: OleVariant): WideString; dispid 3438;
    function CONFIGUREMAILAGENT(const USERNAME: WideString; const AGENTNAME: WideString; 
                                ACTIVATABLE: OleVariant; ENABLE: OleVariant): WideString; dispid 3447;
    function RECERTIFYUSER(const USERNAME: WideString): WideString; dispid 3448;
    function MOVEMAILUSER(const USERNAME: WideString; const NEWHOMESERVER: WideString; 
                          const NEWHOMESERVERMAILPATH: WideString; USESCOS: OleVariant; 
                          NEWCLUSTERREPLICAARRAY: OleVariant; DELETEOLDCLUSTERREPLICAS: OleVariant): WideString; dispid 3449;
    function MOVEROAMINGUSER(const USERNAME: WideString; const DESTSERVER: WideString; 
                             const DESTSERVERPATH: WideString): WideString; dispid 3580;
    function APPROVEDELETEPERSONINDIRECTORY(const NOTEID: WideString): WideString; dispid 3583;
    function APPROVERESOURCEDELETION(const NOTEID: WideString): WideString; dispid 3582;
    function MOVEUSERINHIERARCHYREQUEST(const USERNAME: WideString; 
                                        const TARGETCERTIFIER: WideString; 
                                        ALLOWPRIMARYNAMECHANGE: OleVariant): WideString; dispid 3437;
    function APPROVEDELETESERVERINDIRECTORY(const NOTEID: WideString): WideString; dispid 3584;
    function APPROVEMAILFILEDELETION(const NOTEID: WideString): WideString; dispid 3581;
    function APPROVERENAMESERVERINDIRECTORY(const NOTEID: WideString): WideString; dispid 3586;
    function APPROVENAMECHANGERETRACTION(const NOTEID: WideString): WideString; dispid 3589;
    function APPROVEDESIGNELEMENTDELETION(const NOTEID: WideString): WideString; dispid 3587;
    function APPROVERENAMEPERSONINDIRECTORY(const NOTEID: WideString): WideString; dispid 3585;
    function MOVEREPLICA(const SOURCESERVER: WideString; const SOURCEDBFILE: WideString; 
                         const DESTSERVER: WideString; DESTDBFILE: OleVariant; COPYACL: OleVariant; 
                         CREATEFTINDEX: OleVariant): WideString; dispid 3594;
    function RECERTIFYSERVER(const SERVER: WideString): WideString; dispid 3591;
    function SIGNDATABASEWITHSERVERID(const SERVER: WideString; const DBFILE: WideString; 
                                      UPDATEONLY: OleVariant): WideString; dispid 3592;
    function SETUSERPASSWORDSETTINGS(const USERNAME: WideString; 
                                     NOTESPASSWORDCHECKSETTING: OleVariant; 
                                     NOTESPASSWORDCHANGEINTERVAL: OleVariant; 
                                     NOTESPASSWORDGRACEPERIOD: OleVariant; 
                                     INTERNETPASSWORDFORCECHANGE: OleVariant): WideString; dispid 3595;
    function CREATEREPLICA(const SOURCESERVER: WideString; const SOURCEDBFILE: WideString; 
                           const DESTSERVER: WideString; DESTDBFILE: OleVariant; 
                           COPYACL: OleVariant; CREATEFTINDEX: OleVariant): WideString; dispid 3593;
    function APPROVEREPLICADELETION(const NOTEID: WideString): WideString; dispid 3588;
    function REMOVESERVERFROMCLUSTER(const SERVER: WideString): WideString; dispid 3604;
    function ADDGROUPMEMBERS(const GROUP: WideString; MEMBERS: OleVariant): WideString; dispid 3608;
    function DELETEREPLICAS(const SERVER: WideString; const DBFILE: WideString): WideString; dispid 3599;
    function FINDUSERINDOMAIN(const USER: WideString): WideString; dispid 3600;
    function DELETESERVER(const SERVERNAME: WideString; IMMEDIATE: OleVariant): WideString; dispid 3609;
    function RENAMEGROUP(const GROUP: WideString; const NEWGROUP: WideString): WideString; dispid 3606;
    function APPROVEMOVEDREPLICADELETION(const NOTEID: WideString): WideString; dispid 3590;
    function ADDINTERNETCERTIFICATETOUSER(const USER: WideString; const KEYRINGFILE: WideString; 
                                          const KEYRINGPASSWORD: WideString; EXPIRATION: OleVariant): WideString; dispid 3607;
    function SETSERVERDIRECTORYASSISTANCESETTINGS(const SERVER: WideString; const DBFILE: WideString): WideString; dispid 3605;
    property ISCERTIFICATEAUTHORITYAVAILABLE: OleVariant dispid 3439;
    property CERTIFICATEEXPIRATION: OleVariant dispid 3434;
    property CERTIFIERPASSWORD: WideString dispid 3433;
    property CERTIFIERFILE: WideString dispid 3432;
    property CERTIFICATEAUTHORITYORG: WideString dispid 3431;
    property USECERTIFICATEAUTHORITY: OleVariant dispid 3430;
  end;

// *********************************************************************//
// DispIntf:  NOTESREPLICATIONENTRY
// Flags:     (4096) Dispatchable
// GUID:      {29131454-2EED-1069-BF5D-00DD011186B7}
// *********************************************************************//
  NOTESREPLICATIONENTRY = dispinterface
    ['{29131454-2EED-1069-BF5D-00DD011186B7}']
    function SAVE: Smallint; dispid 3686;
    function REMOVE: Smallint; dispid 3685;
    property FORMULA: WideString dispid 3682;
    property SOURCE: WideString readonly dispid 3680;
    property VIEWS: WideString dispid 3683;
    property ISINCLUDEFORMS: OleVariant dispid 3687;
    property DESTINATION: WideString readonly dispid 3681;
    property ISINCLUDEDOCUMENTS: OleVariant dispid 3690;
    property ISINCLUDEFORMULAS: OleVariant dispid 3689;
    property ISINCLUDEAGENTS: OleVariant dispid 3688;
    property ISINCLUDEACL: OleVariant dispid 3691;
  end;

implementation

uses ComObj;

end.
