; Script generated by the Inno Setup Script Wizard.
; SEE THE DOCUMENTATION FOR DETAILS ON CREATING INNO SETUP SCRIPT FILES!

[CustomMessages]
Version=2.0.10.0


[Setup]
OutputBaseFilename=Last.fm-0.0.0.0
VersionInfoVersion=2.0.10
VersionInfoTextVersion=2.0.10
AppName=Last.fm
AppVerName=Last.fm {cm:Version}
VersionInfoDescription=Last.fm Installer
AppPublisher=Last.fm
AppPublisherURL=http://www.last.fm
AppSupportURL=http://www.last.fm
AppUpdatesURL=http://www.last.fm
AppCopyright=Copyright 2010 Last.fm Ltd. (C)
DefaultDirName={pf}\Last.fm
UsePreviousAppDir=yes
DefaultGroupName=Last.fm
OutputDir=.
AllowNoIcons=yes
Compression=lzma
SolidCompression=yes
DisableReadyPage=yes
DirExistsWarning=no
DisableFinishedPage=no
ShowLanguageDialog=yes
WizardImageFile=wizard.bmp
WizardSmallImageFile=wizard_small.bmp
SetupIconFile=installer.ico
UninstallDisplayIcon="{app}\Last.fm.exe"
AppModifyPath="{app}\UninsHs.exe" /m0=LastFM
WizardImageBackColor=$ffffff
WizardImageStretch=no
AppMutex=Lastfm-F396D8C8-9595-4f48-A319-48DCB827AD8F, Audioscrobbler-7BC5FBA0-A70A-406e-A50B-235D5AFE67FB

; This should stay the same across versions for the installer to treat it as the same program.
; It will then work to install however many updates and then run the uninstall script for
; the first version.
AppId=LastFM

[Languages]
; The first string is an internal code that we can set to whatever we feel like
Name: "en"; MessagesFile: "compiler:Default.isl"
;Name: "fr"; MessagesFile: "compiler:French.isl"
;Name: "it"; MessagesFile: "compiler:Italian.isl"
;Name: "de"; MessagesFile: "compiler:Deutsch.isl"
;Name: "es"; MessagesFile: "compiler:Spanish.isl"
;Name: "pt"; MessagesFile: "compiler:Portuguese - Brasil.isl"
;Name: "pl"; MessagesFile: "compiler:Polish.isl"
;Name: "ru"; MessagesFile: "compiler:Russian.isl"
;Name: "jp"; MessagesFile: "compiler:Japanese.isl"
;Name: "chs"; MessagesFile: "compiler:Simplified Chinese.isl"
;Name: "tr"; MessagesFile: "compiler:Turkish.isl"
;Name: "se"; MessagesFile: "compiler:Swedish.isl"


[Tasks]
Name: "desktopicon"; Description: "{cm:CreateDesktopIcon}"; GroupDescription: "{cm:AdditionalIcons}"

; The OnlyBelowVersion flag disables this on Vista as an admin-run installer can't install a quick launch
; icon to the standard user's folder location. Sucks.
Name: "quicklaunchicon"; Description: "{cm:CreateQuickLaunchIcon}"; GroupDescription: "{cm:AdditionalIcons}"; Flags: unchecked; OnlyBelowVersion: 0, 6;


[Files]
; Main files
Source: "..\..\..\_bin\Last.fm.exe"; DestDir: "{app}"; Flags: ignoreversion; BeforeInstall: ExitApp('{app}\Last.fm R')
Source: "..\..\..\_bin\iPodScrobbler.exe"; DestDir: "{app}"; Flags: ignoreversion

;libraries
Source: "..\..\..\_bin\lastfm.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "..\..\..\_bin\unicorn.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "..\..\..\_bin\listener.dll"; DestDir: "{app}"; Flags: ignoreversion

;Visual Studio redistributable packages
Source: "%VSDIR%\VC\redist\x86\Microsoft.VC90.CRT\*"; DestDir: "{app}"; Flags: ignoreversion
Source: "%VSDIR%\VC\redist\x86\Microsoft.VC90.ATL\*"; DestDir: "{app}"; Flags: ignoreversion

;Qt binaries
Source: "%QTDIR%\bin\QtCore4.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "%QTDIR%\bin\QtGui4.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "%QTDIR%\bin\QtNetwork4.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "%QTDIR%\bin\QtXml4.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "%QTDIR%\bin\QtSql4.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "%QTDIR%\bin\phonon4.dll"; DestDir: "{app}"; Flags: ignoreversion

;image formats plugins
Source: "%QTDIR%\plugins\imageformats\qjpeg4.dll"; DestDir: "{app}\imageformats"; Flags: ignoreversion
Source: "%QTDIR%\plugins\imageformats\qgif4.dll"; DestDir: "{app}\imageformats"; Flags: ignoreversion
Source: "%QTDIR%\plugins\imageformats\qmng4.dll"; DestDir: "{app}\imageformats"; Flags: ignoreversion

;phonon backend plugin
Source: "%QTDIR%\plugins\phonon_backend\phonon_ds94.dll"; DestDir: "{app}\phonon_backend"; Flags: ignoreversion

;media player plugin installers
Source: "..\..\..\_bin\plugins\FooPlugin0.9.4Setup_2.3.1.2.exe"; DestDir: "{app}\plugins"; Flags: ignoreversion
Source: "..\..\..\_bin\plugins\FooPlugin0.9Setup_2.1.exe"; DestDir: "{app}\plugins"; Flags: ignoreversion
Source: "..\..\..\_bin\plugins\iTunesPluginWinSetup_5.0.2.0.exe"; DestDir: "{app}\plugins"; Flags: ignoreversion
Source: "..\..\..\_bin\plugins\WinampPluginSetup_2.1.0.9.exe"; DestDir: "{app}\plugins"; Flags: ignoreversion
Source: "..\..\..\_bin\plugins\WmpPluginSetup_2.1.0.6.exe"; DestDir: "{app}\plugins"; Flags: ignoreversion

;3rd party
Source: "..\..\..\_bin\WinSparkle.dll"; DestDir: "{app}"; Flags: ignoreversion

;The stylesheets
Source: "..\..\..\app\client\Last.fm.css"; DestDir: "{app}"; Flags: ignoreversion

;The add/modify/remove file
Source: "UninsHs.exe"; DestDir: "{app}"; Flags: onlyifdoesntexist

;Text files?

[Registry]
Root: HKLM; Subkey: "Software\Last.fm\Client"; ValueType: string; ValueName: "Version"; ValueData: "{cm:Version}"; Flags: uninsdeletekey
Root: HKLM; Subkey: "Software\Last.fm\Client"; ValueType: string; ValueName: "Path"; ValueData: "{app}\Last.fm.exe"; Flags: uninsdeletekey

; Register last.fm protocol only if it isn't already
Root: HKCR; Subkey: "lastfm"; ValueType: string; ValueName: ""; ValueData: "URL:lastfm"; Flags: uninsdeletekey
Root: HKCR; Subkey: "lastfm"; ValueType: string; ValueName: "URL Protocol"; ValueData: ""; Flags: uninsdeletekey
Root: HKCR; Subkey: "lastfm\shell\open\command"; ValueType: string; ValueName: ""; ValueData: """{app}\Last.fm.exe"" ""%1"""; Flags: uninsdeletekey
Root: HKCR; Subkey: "lastfm"; ValueType: string; ValueName: "URL Protocol"; ValueData: ""; Flags: uninsdeletekey

; Register Last.fm in the control panel
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\ControlPanel\NameSpace\{{7BC5FBA0-A70A-406e-A50B-235D5AFE67FB}"; ValueType: string; ValueName: ""; ValueData: "Audioscrobbler"; Flags: uninsdeletekey
Root: HKCR; Subkey: "CLSID\{{7BC5FBA0-A70A-406e-A50B-235D5AFE67FB}"; ValueType: string; ValueName: ""; ValueData: "Audioscrobbler"; Flags: uninsdeletekey
Root: HKCR; Subkey: "CLSID\{{7BC5FBA0-A70A-406e-A50B-235D5AFE67FB}"; ValueType: string; ValueName: "InfoTip"; ValueData: "Last.fm"; Flags: uninsdeletekey
Root: HKCR; Subkey: "CLSID\{{7BC5FBA0-A70A-406e-A50B-235D5AFE67FB}"; ValueType: string; ValueName: "System.ApplicationName"; ValueData: "fm.last.audioscrobbler"; Flags: uninsdeletekey
Root: HKCR; Subkey: "CLSID\{{7BC5FBA0-A70A-406e-A50B-235D5AFE67FB}"; ValueType: string; ValueName: "System.ControlPanel.Category"; ValueData: "8"; Flags: uninsdeletekey
Root: HKCR; Subkey: "CLSID\{{7BC5FBA0-A70A-406e-A50B-235D5AFE67FB}\DefaultIcon"; ValueType: string; ValueName: ""; ValueData: "{app}\Last.fm.exe, -2"; Flags: uninsdeletekey
Root: HKCR; Subkey: "CLSID\{{7BC5FBA0-A70A-406e-A50B-235D5AFE67FB}\Shell\Open\Command"; ValueType: string; ValueName: ""; ValueData: "{app}\Last.fm.exe --settings"; Flags: uninsdeletekey

; WinSparkle - This stop it asking the user if they want to check for updates on first run.
Root: HKCU; Subkey: "Software\Last.fm\Last.fm Desktop App\WinSparkle"; ValueType: string; ValueName: "CheckForUpdates"; ValueData: "1"; Flags: uninsdeletekey

; This is just for deleting keys at uninstall
Root: HKCU; Subkey: "Software\Last.fm"; Flags: dontcreatekey uninsdeletekey
Root: HKLM; Subkey: "Software\Last.fm"; Flags: dontcreatekey uninsdeletekey

[Icons]
Name: "{group}\Last.fm"; Filename: "{app}\Last.fm.exe"
Name: "{commondesktop}\Last.fm"; Filename: "{app}\Last.fm.exe"; Tasks: desktopicon

;Uninstall
Name: "{group}\Uninstall Last.fm"; Filename: "{uninstallexe}"
Name: "{group}\Uninstall Last.fm"; Filename: "{app}\UninsHs.exe"; Parameters: "/u0=LastFM"

; The OnlyBelowVersion flag disables this on Vista as an admin-run installer can't install a quick launch
; icon to the standard user's folder location. Sucks.
Name: "{userappdata}\Microsoft\Internet Explorer\Quick Launch\Last.fm"; Filename: "{app}\Last.fm.exe"; OnlyBelowVersion: 0,6; Tasks: quicklaunchicon


[Run]
Filename: "{app}\Last.fm.exe"; Description: "Last.fm"; Flags: nowait postinstall
Filename: "{app}\UninsHs.exe"; Parameters: "/r0=LastFM,{language},{srcexe},{app}\Installer.exe"; Flags: runminimized runhidden nowait

[InstallDelete]
;All the files that are not in fixed components (so the Radio compontent is actually removed on modify)
Type: Files; Name: "{commondesktop}\Last.fm.lnk"
Type: Files; Name: "{app}\Last.fm.exe"
Type: Files; Name: "{app}\phonon4.dll"
Type: Files; Name: "{app}\Last.fm.css"
Type: Files; Name: "{app}\phonon_backend\phonon_ds94.dll"
Type: dirifempty; Name: "{app}\phonon_backend\"

; This is the LAST step of uninstallation
[UninstallDelete]
;remove folders, if they are empty
Type: files; Name: "{app}\Installer.exe"
Type: dirifempty; Name: "{app}"

Type: filesandordirs; Name: "{localappdata}\Last.fm"

; This should be possible to delete as we're waiting until all the plugin uninstallers have been run.
Type: files; Name: "{commonappdata}\Last.fm\Client\uninst.bat"
Type: files; Name: "{commonappdata}\Last.fm\Client\uninst2.bat"
Type: filesandordirs; Name: "{commonappdata}\Last.fm\Client"
Type: dirifempty; Name: "{commonappdata}\Last.fm"


; This is the FIRST step of uninstallation
[UninstallRun]
Filename: "{app}\Last.fm.exe"; Parameters: "--exit"

[Code]
// Global variables
var g_firstRun: Boolean;

// This must be called before the install and its value stored
function IsUpgrade(): Boolean;
var
  sPrevPath: String;
begin
  sPrevPath := '';
  if not RegQueryStringValue(HKLM, 'Software\Microsoft\Windows\CurrentVersion\Uninstall\LastFM_is1', 'UninstallString', sPrevpath) then
    RegQueryStringValue(HKCU, 'Software\Microsoft\Windows\CurrentVersion\Uninstall\LastFM_is1', 'UninstallString', sPrevpath);
  Result := (sPrevPath <> '');
end;

function ShouldSkipPage(PageID: Integer): Boolean;
begin
  if PageID = wpFinished then
  begin
    // We skip the final screen if it's first run and go straight into config wizard
    if g_firstRun then
      Result := TRUE
  end;
  
  // This skip page code is for add/modify/remove
  if Pos('/SP-', UpperCase(GetCmdTail)) > 0 then
    case PageID of
      wpLicense, wpPassword, wpInfoBefore, wpUserInfo,
      wpSelectDir, wpSelectProgramGroup, wpInfoAfter:
        Result := True;
  end;
end;


procedure ExitApp(FileName: String);
var
  processExitCode: Integer;
begin
  if ExecAsOriginalUser( ExpandConstant(FileName), '--exit', '', SW_SHOW, ewWaitUntilTerminated, processExitCode) then
  begin
    // *high five*
  end
  else begin
    //MsgBox( 'Failed to stop ' + ExpandConstant(FileName), mbInformation, MB_OK );
  end;
end;


procedure CurStepChanged(CurStep: TSetupStep);
begin
  if CurStep = ssInstall then
    begin
      ExitApp( '{app}\Last.fm.exe' );
    end;
end;

function InitializeSetup(): Boolean;
begin
  // Need to evaluate and store this before any installation has been done
  g_firstRun := not IsUpgrade();

  // Run setup
  Result := TRUE;
end;




