# WindowsSandboxForMABS

After download/edit of the .bat and .wsb, double-click on the .wsb to fire up a Windows Sandbox prepared for use by MABS.   

First, double-click on the auto-created `000-RUNME_init_mabs.bat` to download and extract MABS ready to run.   

Last, when MABS has built, double-click on the auto-create `111-SAVE_mabs.bat` to save the results back to the host, whereupon one can close the sandbox whereupon the Microsoft Windows Sandbox product auto-erases eveything in the sandbox.   

#### Dependencies you can/must edit or delete:   

  1. Inside `dcw_sandbox_v02.wsb`   
    1.1 `C:\software` is on the host and contains software folders, like NPP containing portable Notepad++   
    1.2 `C:\software\WindowsSandbox` is on the host and contains `dcw_sandbox_v02.wsb` and `Setup_v02.bat`   
    1.3 `D:\VM\MABS` is on the host and, after you copy stuff into there, will contain the results of the MABS run   
    1.4 `C:\host_software\WindowsSandbox\Setup_v02.bat` is a file on the host and is auto-run by the .wsb inside newly created windows sandbox

  2. Inside `Setup_v02.bat`   
    2.1 it creates some folders and links on the desktop, dependent on the folder mapping specified in the .wsb   
    2.2 it changes explorer View settings to be as we like them   
    2.3 it creates registry entries to add "Edit with Notepad++" to the explorer right-click context pop-up   
      2.3.1 note that NPP directory on the host containing portable Notepad++ must exist   
