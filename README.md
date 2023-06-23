# WindowsSandboxForMABS   

### this is an example only.   
---

Configure Windows to make Windows Sandbox available; Control Panel, Programs and Features, Turn Windows features On or Off, tick these: Virtual Machine Platform, Windows Hypervisor Platform, Windows Sandbox.    

Download this git somwhere and get ready to create some folders and edit the 2 files (`.wsb` and `.bat`) to tell it where those folders are, then pop the 2 edited files into your equivalent of `C:\software\WindowsSandbox`.

After download **and edit** of the `.bat` and `.wsb`, double-click on the `.wsb` to fire up a Windows Sandbox prepared for use by MABS.   

First, double-click on the auto-created `000-RUNME_init_mabs.bat` to download and extract MABS ready to run.   

In the Windows Sandbox, run the MABS build process in the normal way per https://github.com/m-ab-s/media-autobuild_suite

Last, when MABS has built, double-click on the auto-create `111-SAVE_mabs.bat` to save the results back to the host, whereupon one can close the Sandbox whereupon the Microsoft Windows Sandbox product auto-erases eveything in the Sandbox.   

#### Dependencies you can/must edit or delete:   

  1. Inside `MABS_Sandbox_v02.wsb`   
    1.1 `C:\software` is on the host and contains software folders, like NPP containing portable Notepad++ ... change this to your location of Notepad++ (you can comment this out)    
    1.2 `C:\software\WindowsSandbox` is on the host and contains `MABS_Sandbox_v02.wsb` and `Setup_v02.bat` ... change this to your location of those 2 files      
    1.3 `D:\VM\MABS` is on the host and, after you copy stuff into there, will contain the results of the MABS run ... change this to your chosen location for results      
    1.4 `C:\host_software\WindowsSandbox\Setup_v02.bat` is a file on the host and is auto-run by the `.wsb` inside newly created windows Sandbox ... change this to your chosen location for both of the `.wsb` and matching `.bat`    

  2. Inside `Setup_v02.bat` (which relies on the settings inside `MABS_Sandbox_v02.wsb`)   
    2.1 it creates some folders and links on the Sandbox desktop, dependent on the folder mapping specified in the `.wsb`   
    2.2 it changes explorer View settings to be as we like them   
    2.3 it creates registry entries to add "Edit with Notepad++" to the explorer right-click context pop-up  (you can comment this out)   
      2.3.1 note that NPP directory on the host containing portable Notepad++ must exist  (you can comment this out)   
