unit strconst_en;

{$mode objfpc}{$H+}
{
    Commandoo Program: Helper application for Linux commands / CLI
    Copyright (C) 2017 Julius Heinrich Ludwig Schön / Ronald Michael Spicer
    created by Julius Schön / R. Spicer
    Foto.TimePirate.org / TimePirate.org / PaganToday.TimePirate.org
    Julius@TimePirate.org

        This program is free software: you can redistribute it and/or modify
        it under the terms of the GNU General Public License as published by
        the Free Software Foundation, version 3 of the License.

        This program is distributed in the hope that it will be useful,
        but WITHOUT ANY WARRANTY; without even the implied warranty of
        MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
        GNU General Public License for more details.

        You should have received a copy of the GNU General Public License
        along with this program.  If not, see <http://www.gnu.org/licenses/>.

}
interface

uses
  Classes, SysUtils;

const
  //ccapTabSelected = '◉ %s ◉';  ◆  ◢  ◣
  ccapTabSelected = '◢  %s  ◣';
  ccapTabUnSelected = ' %s ';
  cRootMode = '<< ROOT MODE >> ';


resourceString

//======================================================
//NOTE: Single "+ LineEnding"'s are important. I use them either for emphasis, or, more importanly,
//to limit the width of text designated for hints. If you don't limit the line for a hint it spreads across
//the screen and becomes almost unreadable. So hint text is made of short lines that require a carriage return.
//======================================================

  ccapTabCommands = 'Commands';//'Cmd''s';
  ccapTabFavorites = 'Favorites';//'Favs';
  ccapTabKeyWords = 'KeyWords';//'KeyW';
  ccapTabSearch = 'Search';//'Search';
  ccapTabProcesses = 'Det. Processes';//'Proc''s';

  cstrCmdDisplayObjects = '>>         ↑ Commands   ---   ↓ Command Lines';


  cCantCopy = 'Could not copy "%s" to "%s".';
  //cCantCopyNotFound = '"%s" not found!';
  cFileNotExist = 'File "%s" does not exist.';
  cmsgAdvancedOptions = '< All changes are saved immediately on "OK" >';

  cAboutLine = 'commandoo   Version: %s';
  cAboutBDLine = 'DB Version: %s';
  cAboutInstalled = 'Program installed in:   %s';
  cAboutIni = 'Settings files (%s, %s & %s) in:   %s';
  cAboutLanguage = 'Language (.po) files in:   %s';
  cAboutFormSettings = 'Program Settings located in: %s';
  cAboutGitHub = 'This is open source software, the source code can be found on GitHub at: '
                 + LineEnding
                 + '      https://github.com/Juuliuus/commandoo'
                 + LineEnding + LineEnding
                 + 'Release Notes and download instructions can be seen in the '
                 + 'README file there.';
  cEmail = 'Comments etc. to email:     Commandoo@TimePirate.org';
  cContribute = 'Contributions of any amount you want can be given to Juuliuus@me.com on PayPal. '
                 + 'Another way to contribute, if you are bi-lingual, is to do a translation for commandoo. '
                 + 'It''s easy-ish...email me if you are interested. ';

  cInputCantBeBlank = 'Text cannot be blank';

  ccapChangeLangDoReset = 'Reset "Show No More" Dialogs?';
  cmsgChangeLangDoReset =
    'Do you want to reset all the "show no more" dialogs so you can read '
    + 'them in the new language?';

  cGNU_GPL =
    'Copyright (C) 2017 Julius Heinrich Ludwig Schön / Ronald Michael Spicer '
    + LineEnding
    + 'Created by Julius Schön / R. Spicer '
    + LineEnding
    + 'https://www.TimePirate.org'
    + LineEnding
    + 'https://Foto.TimePirate.org'
    + LineEnding
    + 'https://PaganToday.TimePirate.org'
    + LineEnding + LineEnding
    + 'Email: Commandoo@TimePirate.org'
    + LineEnding + LineEnding
    + 'Commandoo Program: Helper application for Linux commands / CLI '
    + LineEnding + LineEnding
    + 'This program is free software: you can redistribute it and/or modify '
    + 'it under the terms of the GNU General Public License as published by '
    + 'the Free Software Foundation, version 3 of the License. '
    + LineEnding + LineEnding
    + 'This program is distributed in the hope that it will be useful, '
    + 'but WITHOUT ANY WARRANTY; without even the implied warranty of '
    + 'MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the '
    + 'GNU General Public License for more details. '
    + LineEnding + LineEnding
    + 'You should have received a copy of the GNU General Public License '
    + 'along with this program.  If not, see <http://www.gnu.org/licenses/>. '
    + LineEnding + LineEnding
    ;

  ccapIntro = 'Introduction';
  cmsgIntro =
    'Introduction:'
    + LineEnding
    + '============ '
    + LineEnding + LineEnding
    + 'Welcome to commandoo the Graphical User Interface (GUI) for the Linux '
    + 'Command Line Interface (CLI), perhaps better known as the "Terminal". '
    + 'You can read this introduction again later in the "About" window. '
    + 'Also available in the "About" window are some == TIPS == for use, '
    + 'recommended reading... '
    + LineEnding + LineEnding
    + 'It''s purpose is to give you a place to store the cool and/or useful '
    + 'command lines you find, discover, or create. Then, months later, when '
    + 'you need it again, it will be here, easy to find. '
    + LineEnding + LineEnding
    + 'It''s primary audience was intended for people new to Linux, but the features and '
    + 'usefulness of storing command lines could be of interest for veteran users too. '
    + LineEnding + LineEnding
    + 'You can copy the Command Line with a right click and paste into a Terminal to use...Or...'
    + LineEnding + LineEnding
    + '...you can run it from within this program. Commandoo is NOT a terminal replacement, '
    + 'but it''s been designed to be as useful as possible and running Command Line''s seemed like a '
    + 'nice feature. '
    + LineEnding + LineEnding
    + 'Other features: '
    + LineEnding + LineEnding
    + '** Commands and Command Lines can be marked as to how dangerous they are, and you can '
    + 'optionally set that a particular danger level (harmless, careful, caution, danger) needs '
    + 'confirmation before running. '
    + LineEnding + LineEnding
    + '** You can mark a command line to take input from you, before running. Not all Commands pay '
    + 'any attention to input (stdin) but for the ones that do this is kind of a cool feature. '
    + 'Think grep for instance. '
    + LineEnding + LineEnding
    + '** You can test your command lines while editing them. The only thing this program does NOT '
    + 'provide is a shell within which to run commands. So running commands from here like "cd", "pwd", "alias" '
    + 'and some others like these are, well, useless to run from here. But even these are included in the '
    + 'database for reference since the program can show the command''s help text for you. '
    + LineEnding + LineEnding
    + '** You can add any number of self defined keywords to a command and these, of course, are searchable. '
    + LineEnding + LineEnding
    + 'There is one other thing to know about the absence of a "true" shell: you can''t change directories (cd) '
    + 'to run a command in that directory. For instance, if you choose to add "git" to your Commands you need to use '
    + 'it with the "-C <path>" flag. This is true of any command like git, you will need to use pathing and appropriate '
    + 'flags to run it. And the last BIG difference: any command that expects input will NOT run properly because '
    + 'I haven''t figured out how to communicate (yet) with a running process in a shell-like manner waiting for input. '
    + 'These have to be run in a terminal. '
    + LineEnding + LineEnding
    + 'You can choose to use text based database files or sqlite db files. You can convert '
    + 'from one to the other. You can merge from one to the other. You can send individual Command Lines '
    + 'from your open db and send it to another db.'
    + LineEnding + LineEnding
    + 'This is completely "open" software, the source code is on GitHub, see the link in the '
    + '"About" window. It is written in pascal (thank you FreePascal) with the Lazarus IDE (thank you Lazarus). '
    + LineEnding + LineEnding
    + 'Help is included in the program. Almost all windows have a checkbox in the upper right to "show '
    + 'hints on mouseover". Check that and then move the mouse over the control you have a question '
    + 'about. '
    + LineEnding + LineEnding
    + 'A word of CAUTION:     Be careful out there. '
    + LineEnding + LineEnding
    + 'Linux comes with very powerful commands to use, really cool ones. But they can be dangerous '
    + 'if misused and/or misunderstood. As they say with great power comes great responsibility. '
    + LineEnding + LineEnding
    + 'If you don''t know whether a command is dangerous or not then you really '
    + 'need to educate yourself about that command. Hopefully this database will help you with that. '
    + 'I will try to be as thorough as possible in the database descriptions of a command''s merits. And, '
    + 'in the original database coming with this program, if I have marked a command line as harmless '
    + 'then it IS harmless you can be certain. If a command line is marked careful or higher then you '
    + 'may want to spend some time learning about that command so you understand WHY it is not completely harmless. '
    + LineEnding + LineEnding
    + 'Another word of CAUTION:     Backup your database files regularly. File locations can be seen in the "About" '
    + 'window. And now License Information: '
    + LineEnding + LineEnding
    + '%s'
    + '%s'
    ;

  cmsgTips =
    'TIPS:'
    + LineEnding
    + '===== '
    + LineEnding + LineEnding
    + 'Commands are entries that describe the command you are using. Commands >> CAN NOT BE RUN <<. '
    + 'Only Command Lines can be run, but you must add the command first. Then you add command lines to it. '
    + LineEnding + LineEnding
    + 'Before adding Command Lines you should edit your new Command and give it a threat level and so on. '
    + 'This is because any command lines you add will "inherit" those settings (excepting the notes and KeyWords) '
    + 'saving you some work. '
    + LineEnding + LineEnding
    + 'Note for Debian users: If an entered command you know you should have and it comes back with "badpath" this is '
    + 'probably because the command is in /sbin/ and not in your $PATH. Edit the Command (go into edit mode and '
    + 'double click the command name) and simply type the /sbin/ manually. /sbin/ commands are usually reserved for '
    + 'ROOT users and so will not be seen by the program under your normal login. '
    + LineEnding + LineEnding
    + 'commandoo supports variables in Command Lines. Highlight the CL you want and go into edit mode. Double '
    + 'click the command line and you will be taken to a edit window that has buttons to allow you to enter various '
    + 'types of variables (strings, integer, real, and file/folder names).  '
    + LineEnding + LineEnding
    + 'Look through the provided database, there are examples of variables, Command Line input, etc. '
    + LineEnding + LineEnding
    + 'One cool options is "Alert". If this is checked then the program makes you look at the notes for that '
    + 'Command Line. This can be really useful if you need to be aware of something, or having done something, '
    + 'BEFORE you run that command line. Try it. '
    + LineEnding + LineEnding
    + 'If you want commandoo to act as a "launcher" be sure to check the "Child Proc" checkbox in the Command Line. '
    + 'Otherwise, it will (usually) return immediately, having not done anything. Say you are running Gimp or Blender, '
    + 'well sending it out to be run like "uname" does precisely that. It runs it, and then stops and kills it. The '
    + 'Child Proc setting says "hey, this is GUI program, keep it open". '
    + LineEnding + LineEnding
    + '"Use Shell" attempts to let the system handle it and this usually works pretty well. It is necessary for '
    + 'processes that use more terminal like syntax (semicolons and such). commandoo can internally handle the basic '
    + 'command lines, but if yours doesn''t seem to work, try Use Shell and see if that does it. If not then '
    + 'that Command Line should only be run in a Terminal (term. only). '
    + LineEnding + LineEnding
    + 'If the Command Line is mission critical, complex, etc. you should probably only use it in a Terminal. commandoo '
    + 'is pretty good at performing most CL''s but IT IS NOT A TERMINAL, be aware of that and use your best judgement '
    + 'on where commandoo can/should be used and where a Terminal should be used. '
    + LineEnding + LineEnding
    + '"Wants Input" is pretty cool (I think). On Commands that accept input (like, for instance, grep) marking this '
    + 'option for a Command Line will ask you for input before running the Command Line. So for something like grep you '
    + 'can paste in some text you want to search. '
    + LineEnding + LineEnding
    + 'SuperUser (you can set details in OPTIONS): how this works varies on your distribution. If you are on Debian '
    + 'there is an admin user and then your personal login. If you are not part of "sudo''ers" then you can not run '
    + 'Commands as ROOT and you will need to know the admin password. For ''buntu distribs this is not the case unless '
    + 'you have set your system up specifically as such. See OPTIONS for SuperUser for more details. '
    + LineEnding + LineEnding
    + 'Use DB profiles, why not? The provided database is of basic Linux commands. Now you can add more and more to this '
    + 'database as you like, fine. But you could also make specific databases for specific needs. This is another way '
    + 'to make commandoo useful for you. Maybe you want a GUI launcher database for all your programs. And another that '
    + 'just deals with hardware commands. Etc. Make commandoo yours. '
    + LineEnding + LineEnding
    + 'Almost every window in commandoo has a checkbox at upper right to show hints on mouseover. Use it!! Lot''s of information '
    + 'there. When you are done reading, uncheck it to stop the hints. The detailed hints for the Commands and CL''s are '
    + 'only shown in edit mode. '
    + LineEnding + LineEnding
    + 'Heads UP: I ran into an odd problem with a couple of the more abstruse, esoteric Commands. When you add  '
    + 'a new Command the HELP and VERSION fields are filled in for you with the most common variants: "--help" and '
    + '"--version". Upon entering a new Command I always check that these are correct for that Command, sometimes they '
    + 'aren''t. Well, in a couple of cases running the "--help" threw me out of my session!! Surprise! I don''t know '
    + 'why, it is hard to reproduce. But, for this reason, I recommend you test the help and version commands in a '
    + 'TERMINAL WINDOW first. '
    + LineEnding + LineEnding
    ;

  cmsgOwnRisk =
    'The use of of this software is at YOUR OWN RISK. While I strive for complete testing it has no implicit or explicit '
    + 'warranty or guarantee of being bug free. '
    + 'I hope you find it useful, enjoy. '
    + LineEnding + LineEnding
    ;

  ccapMultipleDisallowed = 'Already running';
  cmsgMultipleDisallowed = 'commandoo is already running and your OPTIONS setting disallows this.'
                        + LineEnding
                        ;
  ccapMulipleInstances = '  >>>>>  %d or More COPIES OPEN!! Careful!!';
  cmsgMulipleInstances = '%d COPIES OPEN, Closing this window is highly recommended!! '
                        + 'Continue using it at your own risk with the understandking that '
                        + 'these windows know nothing about what the other(s) is doing and '
                        + 'there could be unintended / unanticipated consequences. Exclamation Point.'
                        + LineEnding + LineEnding
                        + 'Do you STILL want two (or more?!) commandoo windows open?????'
                        + LineEnding
                        ;
  //ccapRootModeWait = '>>>>>>  Waiting for  ROOT MODE  to close...  <<<<<<';
  ccapProgram = 'COMMANDOO : GUI for Linux Commands / CLI';
  //cmsgAlreadyRoot = 'This program is already running as ROOT';
  //cmsgSUAdvancedOptions =
  //  'You are in SuperUser mode. Any changes you make in '
  //  + 'advanced options will be for the SuperUser session '
  //  + 'only (excepting "stub" changes) and will NOT be '
  //  + 'saved to main program.'
  //  ;

  cMsgHarmless = 'No changes to system or files';
  cMsgCareful = 'Can change system and/or files, know how to use';
  cMsgCaution = 'Probable system changes, research before use!';
  cMsgDanger = 'Can trash your system, research before use!!!';

  ccapListManagerNothingSelected = 'Nothing Selected';
  cmsgListManagerNothingSelected = 'You have not selected an item in the list.';
  ccapListManagerDuplicate = 'Duplicate %s';
  cmsgListManagerDuplicate = '%s "%s" is already in the list.';

  cDisplayUpdating = 'Updating %s';

  ccapPathCaption = 'Path to: "%s"';
  cmsgNotSpecified = '-???-';
  cmsgInvalidString = '< Invalid >';
  cmsgProfileString = 'DB Profile  =>  %s%s %s';


  cmsgProcessSingular = 'Proc';
  cmsgProcessPlural = 'Procs';
  ccapDetachedProcesses = '%d  Running%s';

  ccapQuickRun = 'Command to Run';
  ccapSwitchDBNotAllowed = 'Can not Switch or Manage Database';
  cmsgSwitchDBNotAllowed = 'Can not Switch or Manage Database Profiles while editing.';
  ccapCurrentlyEditing = 'Currently Editing';
  cmsgCurrentlyEditing = 'Currently editing a Command or Command Line. This task is not allowed '
                         + 'while editing. Apply your editing changes, or cancel them.';

  ccapSwitchDBSave = 'Unsaved Data';
  cmsgSwitchDBSave = 'There is currently unsaved data. Do you want me to save it before switching the Database?';
  cmsgManageDBSave = 'You have unsaved edited items. You need to save your changes before entering management mode.';

  cmsgLimitInfinity = LineEnding + LineEnding
                       + '{It appears you are using /dev/[ zero|full|random|urandom ] in this command '
                       + LineEnding
                       + 'line. As a safety measure to prevent "runaway" processes input / output has '
                       + LineEnding
                       + 'been limited to %d characters. For the most common uses of these devices '
                       + LineEnding
                       + 'it should not affect your results. If you do want this command to run to finish '
                       + LineEnding
                       + 'using these devices change the limit in options or run the command in a terminal.} '
                       + LineEnding + LineEnding ;
  cmsgSudoSuProblem = Lineending + LineEnding
                      + '______________________'
                      + LineEnding
                      + 'It appears you are using "sudo" or "su" in your command line. This is '
                      + LineEnding
                      + 'not allowed as it is not secure! Either run this command line through '
                      + LineEnding
                      + 'a terminal, or remove the sudo (or su) and use the "run as SuperUser" option '
                      + LineEnding
                      + 'which uses the secure system program(s) to go into ROOT mode. '
                      + LineEnding;

  ccapThreatLevelWarning = 'Allow Execution "%s"?';
  cmsgThreatLevelWarning = 'Threat Level: %s '
                           + LineEnding + LineEnding
                           + 'Do you want to allow the command line: '
                           + LineEnding + LineEnding
                           + '==> %s'
                           + Lineending + LineEnding
                           + 'which is marked -- %s -- to run? '
                           + Lineending + LineEnding + LineEnding
                           + '( These confirmations can be changed in "Options" )'
                           + LineEnding;

  cmsgDisallowedPhrase = 'A command may not have "%s" in the name.';
  cmsgEmptyString = 'A Command name not be blank.%s';
  ccapDisplayCaptionAndValue = '%s:  %s';
  ccapOverflow = 'Overflow from long line';

//hints
  cmsgDisplayPanels = 'This shows the current state of the selected '
                      + LineEnding
                      + '%s settings.'
                      + LineEnding + LineEnding
                      + 'If you focus on the Notes area and press '
                      + LineEnding
                      + 'Ctrl-F a text search dialog opens. '
                      + LineEnding + LineEnding
                      + 'And Ctrl-Shift-F or Ctrl-L will find the next '
                      + LineEnding
                      + 'find occurence. '
                      + LineEnding + LineEnding
                      + '<end>';
  cmsgEditButtons = 'Open the "%s" Edit panel to edit the %s settings.'
                      + LineEnding + LineEnding
                      + '<end>';

  cmsgEditOk = 'Confirm any changes you have made to the "%s".'
                      + LineEnding + LineEnding
                      + '<end>';

  cmsgEditCancel = 'Cancel the changes to the "%s".'
                      + LineEnding + LineEnding
                      + '<end>';

  cmsgThreatLevelsCommand =
    'In the commands it is really a convenience '
    + LineEnding
    + 'since you can not run Commands, only '
    + LineEnding
    + 'Command Lines. But if you set this properly '
    + LineEnding
    + 'on the Command then when you add a '
    + LineEnding
    + 'new Command Line it will inherit that threat '
    + LineEnding
    + 'level. '
    ;

  cmsgThreatLevelsCommandLine =
    'The Command line inherits the threat level '
    + LineEnding
    + 'of the Command when it is added. Depending '
    + LineEnding
    + 'on the flags used the threat level may '
    + LineEnding
    + 'be different for this command line. You '
    + LineEnding
    + 'can change it as you like. '
    ;

  cmsgThreatLevels =
    'This allows you to use the feature of '
    + LineEnding
    + '"Threat Levels". '
    + LineEnding + LineEnding
    + 'As you know some Linux commands can '
    + LineEnding
    + 'be quite dangerous.  Others should be used '
    + LineEnding
    + 'properly. '
    + LineEnding + LineEnding
    + 'Labeling the Command (and Command Lines) '
    + LineEnding
    + 'with an appropriate warning gives a heads '
    + LineEnding
    + 'up to the you the user to make sure you '
    + LineEnding
    + 'know what you are doing and have done it '
    + LineEnding
    + 'properly. '
    + LineEnding + LineEnding
    + 'In addition, in the Options you can specify '
    + LineEnding
    + 'which levels of threat should be confirmed '
    + LineEnding
    + 'before running. '
    + LineEnding + LineEnding
    + '%s '
    + LineEnding + LineEnding
    + '<end> ';

  cmsgHelpVersionInfoVersion = 'Version';
  cmsgHelpVersionInfoHelp = 'Help';

  cmsgHelpVersionInfo =
    'Uses the "%s" flag saved with this Command '
    + LineEnding
    + 'to display the Command''s %s. '
    + LineEnding + LineEnding
    + 'If this doesn''t work then the %s flag for '
    + LineEnding
    + 'this Command will need to be edited. '
    + LineEnding + LineEnding
    + 'This also will not work if the Command has '
    + LineEnding
    + 'a bad name. '
    + LineEnding + LineEnding
    + '<end> '
    ;

  cmsgRootNoStartup = 'It not allowed to run the program the FIRST TIME as <ROOT>.   Halting.';
  ccapRootModeConfirmation = 'Confirm <ROOT> Mode';
  cmsgRootModeConfirmation =
     'Hi. You are running commandoo in <ROOT> mode. '
     + LineEnding + LineEnding
     + 'There is literally no good reason to do so and many good reasons not to do so. '
     + LineEnding + LineEnding
     + 'But I don''t want to tell you what to do.'
     + LineEnding + LineEnding
     + 'Do you STILL want to run commandoo in <ROOT> mode even though it''s somewhat dangerous??????? '
     + LineEnding + LineEnding
     ;

  ccapGeneralInformation = 'Information you may want to know';

  ccapMasterListEmpty = 'Master List is empty';
  cmsgMasterListEmpty = 'The Master %s List is empty. Can not search on it.';

  ccapSearchDesignedInDiffDataBase = 'Database Stamp MisMatch';
  cmsgSearchDesignedInDiffDataBase =
     'Loaded file was designed in "%s" Database Profile but you are currently in "%s" Profile. '
     + 'It is quite possible the search will not be valid in this database. Do you still want to load it? '
     ;

  cmsgSearchMayBeInvalid =
     'Changes have been made that can affect Searches. '
     + 'For this reason any current search results may be incorrect. You should probably '
     + 're-run the search(es).'
     ;

  ccapSUFileInfo = 'ROOT authentication files';
  cmsgSUFileInfo =
    'In order to run command lines with superuser privileges you need to select a valid agent. '
    + LineEnding + LineEnding
    + 'Here select it from the list, or, if necessary, search for the file. '
    + LineEnding + LineEnding
    + 'Raw "sudo" and "su" commands are ==NOT== allowed because they are not secure to use from a GUI. '
    + LineEnding + LineEnding
    + 'What you select depends on your Linux system and the authentication scheme it uses. You need to '
    + 'know this to pick correctly. '
    + LineEnding + LineEnding
    + '"sudo" variants (gksudo and kdesudo) differ based on your desktop scheme, whether you use gnome '
    + 'or KDE. This also applies to the "su" variants (gksu and kdesu). '
    + LineEnding + LineEnding
    + 'On Debian systems the user account is separate from the ROOT account. An "su" variant is required '
    + 'and password used will be the ROOT password. '
    + LineEnding + LineEnding
    + 'However, if, on your Debian system, your user account is added to the "sudo-ers" group / list then '
    + 'the sudo variant will also work but with your user account password. '
    + LineEnding + LineEnding
    + 'For `Buntu systems (and some other derivatives) the initial user has both user and ROOT privileges, '
    + 'in this case the sudo variant ONLY will work. '
    + LineEnding + LineEnding
    + 'But it is possible to set a `Buntu system to have a separate ROOT. In this case the comments for the '
    + 'Debian system apply. '
    + LineEnding + LineEnding
    + 'A quick summary of the most usual situations: '
    + LineEnding + LineEnding
    + '`Buntu systems: use one of the "sudo" variants. '
    + LineEnding + LineEnding
    + 'Debian: use "su" variant unless your user account has ROOT privileges in which case "sudo" variant. '
    + LineEnding + LineEnding
    ;


  ccapSudoSet = 'ROOT Privileges';
  cmsgNoGoodSudo = 'I`ve searched for "kdesudo" and "gksudo", the safe and secure '
                       + 'gnu/Linux methods of launching programs with ROOT privileges '
                       + 'but didn`t find them.'
                       + LineEnding + LineEnding
                       + 'So, if you want to run commands with ROOT privileges you will '
                       + 'need to set it manually in "OPTIONS".'
                      ;
  cmsgSudoSet = 'Your ROOT mode file was not set. I`ve set your ROOT mode privileges file to "%s". '
                + 'For most users this will be correct.'
                + LineEnding + LineEnding
                + 'If you want to change it do so in "OPTIONS".'
                + LineEnding + LineEnding
                + 'If running ROOT mode has no effect then you will NEED to change it to the proper file '
                + 'depending on your Linux distribution (Debian vs. ''Buntu) and the type of administrative '
                + 'setup (sudo vs sudo''ers vs su) it has.'
                      ;

  ccapRootDisallowed = 'ROOT running Disallowed';
  cmsgRootDisallowed =
    'You have either specifically disallowed running as ROOT or you don''t have '
    + 'a valid Linux ROOT GUI file. You can change / check this in OPTIONS.'
    + LineEnding
    ;

  ccapCommandLineDisallowed = 'Command Line Disallowed';
  cmsgCommandLineDisallowed =
    'This Command Line has been set to be DISALLOWED (Terminal Only). If you really want to run this command you need '
    + 'to change that setting or run it in a Terminal.'
    + LineEnding + LineEnding
    ;

  ccapRequiredReading = 'REQUIRED READING';
  cmsgRequiredReading =
    'This Command Line has been set to display its notes for you to read and requires approval. '
    + LineEnding + LineEnding
    + 'Please read the notes below and then choose NO if you DO NOT WANT to continue: '
    + LineEnding + LineEnding
    + '==== ATTENTION ==='
    + LineEnding + LineEnding
    + '%s'
    + LineEnding + LineEnding
    ;

  cmsgOutputEndIndicator =
    LineEnding + LineEnding
    + '=============================================================='
    + LineEnding
    + '< END Command run ============================================'
    + LineEnding
    + '=============================================================='
    + LineEnding + LineEnding
    + LineEnding + LineEnding
    + LineEnding + LineEnding
    ;

  cmsgCommandsSaved = 'Saved by user at %s...'
                             + LineEnding + LineEnding;
  cmsgDisplayOutputCleared = 'Display Output Cleared by user at %s...'
                             + LineEnding + LineEnding;
  cmsgDisplayOutputTrimmed = '>>> >>> Display Output trimmed to about > %d < characters %s (set in OPTIONS)...'
                             + LineEnding + LineEnding;

  cmsgUpdated_DBFiles = '%s automatically updated to %s, Item %d';
  ccapUpdated_DB = 'Database';
  ccapUpdated_Prog = 'Program settings ';

  cmsgNoVersionFlagSpecified = 'Command "%s" has no %s flag specified.';

  cSearchHintGeneralCmd =
           'This presents search results for the various '
           + LineEnding
           + 'Favorites, KeyWords, and General Searches. '
           + LineEnding + LineEnding
           + 'The list can consist of both Commands '
           + LineEnding
           + '(listed first if any) and Command Lines '
           + LineEnding
           + '(listed second). If so there will be a '
           + LineEnding
           + '"separator" section between them. '
           + LineEnding + LineEnding
           + 'Clicking on an item shows it''s details to '
           + LineEnding
           + 'the right. If the selected item is a Command '
           + LineEnding
           + 'it''s Command Lines will be listed in '
           + LineEnding
           + 'the listbox below. '
           + LineEnding + LineEnding
           + 'Keep in mind that Commands / Command '
           + LineEnding
           + 'Lines that are in an edited state (i.e., not '
           + LineEnding
           + 'saved) may NOT or will NOT be included in the '
           + LineEnding
           + 'filtering. To see an accurate list be sure '
           + LineEnding
           + 'everything is saved. '
           + LineEnding + LineEnding
           + 'For the ClipBoard: '
           + LineEnding + LineEnding
           + 'Ctrl-Shift-C copies the entire list. '
           + LineEnding + LineEnding
           + 'Ctrl-f opens the find dialog. '
           + LineEnding + LineEnding
           + 'ctrl-g goes to the Cmd '
           + LineEnding + LineEnding;

  cSearchHintFavorites =
           'The Favorites list is, by default, automatically '
           + LineEnding
           + 'updated when you save after editing. When updated '
           + LineEnding
           + 'all previous selections are reset to point to the '
           + LineEnding
           + 'first item in all listboxes. If you don''t want this '
           + LineEnding
           + 'you can change in OPTIONS to disable this. In that case '
           + LineEnding
           + 'you will need to manually refresh the Favorites list. '
           + LineEnding + LineEnding;

  cSearchHintEnding = '<end>';

  cSearchHintGeneralCmdLine =
           'This will show any Command Lines belonging '
           + LineEnding
           + 'to the item selected in the list above if '
           + LineEnding
           + 'it is a Command. '
           + LineEnding + LineEnding
           + 'Click on a Command Line to enable the '
           + LineEnding
           + 'RUN button. '
           + LineEnding + LineEnding
           + 'It will be automatically cleared in some cases '
           + LineEnding
           + 'like when you edit the Master Keywords '
           + LineEnding
           + 'or maybe in some other cases. '
           + LineEnding + LineEnding
           + '<Enter> runs the command line. '
           + LineEnding + LineEnding
           + 'For the ClipBoard: '
           + LineEnding + LineEnding
           + 'Ctrl-c copies the selected command Line '
           + LineEnding
           + 'Ctrl-Shift-C copies the entire list '
           + LineEnding + LineEnding
           + 'Ctrl-f opens the find dialog. '
           + LineEnding + LineEnding
           + 'ctrl-g goes to the Command Line '
           + LineEnding + LineEnding;

   cSearchHintSearch =
           'These are global GENERAL SEARCH: '
           + LineEnding
           + '<ctrl-1> Search '
           + LineEnding
           + '<ctrl-2> New Search '
           + LineEnding
           + '<ctrl-3> Load Search '
           + LineEnding + LineEnding
           + 'Local to this page: '
           + LineEnding
           + '<ctrl-4> save search '
           + LineEnding
           + '<ctrl-5> display search '
           + LineEnding + LineEnding
           + '<end> ';

   cSearchHintKeyWords =
           'These are global KEYWORD SEARCH: '
           + LineEnding
           + '<alt-1> Search Keywords '
           + LineEnding
           + '<alt-2> New Search KeyWords '
           + LineEnding
           + '<alt-3> Load Search '
           + LineEnding + LineEnding
           + 'Local to this page: '
           + LineEnding
           + '<alt-4> save search '
           + LineEnding
           + '<alt-5> display search '
           + LineEnding + LineEnding
           + '<end> ';

   ccapUnsavedData = 'Unsaved Data!';
   cmsgUnsavedData = 'Either Editing or Unsaved Data, Do you still want to close??';
   cmsgFailedSave = 'Failure during save: %s';
   cmsgSQLiteLibNotFound = 'sqlite system library "%s" not found';
   ccapNothingLoaded = 'Nothing Loaded';
   cmsgNothingLoaded = 'There is nothing loaded, this Database is empty.';
   cmsgBadData_ESC = 'Output bad: %s which are not allowed in %s because of possible '
                     + 'insecure consequences. Run this command in a Terminal (can be changed in OPTIONS).';
   cmsgBadData_ESC_BASE = 'Output contains ESCAPE characters';
   cmsgBadData_ESC_OK = LineEnding + LineEnding +
                        '%s. This can mess up the output display. By default the output is thrown out. This can be changed in OPTIONS. '
                        + LineEnding + LineEnding;
   ccapApology = 'Merging TO sql DB''s:  My Apologies!!!';
   cmsgApology =
     'PLEASE READ: (!!!!) '
     + Lineending + LineEnding
     + 'There is some, very very very subtle issue, when merging INTO '
     + 'a sql database. Depending on circumstances it can take a VERY long time. '
     + 'I''ve done what I can to make it as fast as I can but it can be terribly, '
     + 'terribly slow. Best circumstances are small merges of course. And where the '
     + 'merging items are not already present in the database. Those will be fast-ish. '
     + Lineending + LineEnding
     + 'The worst case is where many of the incoming commands already exist in the destination. '
     + 'It''s really really bad slooowwww. So I truly apologize for this issue which I am trying '
     + 'to figure out. '
     + Lineending + LineEnding
     + 'You can, of course, merge commands one at a time from the right click popup on the commands '
     + 'list which then copy instantly to the destination. '
     + Lineending + LineEnding
     + 'So do you still want to merge to a sql destination?? ';

   cmsgDispNoNotes = '< No Notes >';
   cmsgDispNoKeyWords = '< No KeyWords >';



implementation

end.

