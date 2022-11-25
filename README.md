# 12x12-Sudoku

## Project Overview
Developed a 12 by 12 Sudoku Game with x8086 Assembly Language to test out my x86 Assembly Programming skills. At the time, I was studying several key topics in the language relating to Registers, Memory Addressing, Instructions, and Calling Conventions. As such, I engaged in the creation of this project to consolidate that knowledge and discover what areas of that knowledge required additional revision.

## Illustrations

### Photos of the Program

![image](https://user-images.githubusercontent.com/73263754/203939070-5b7b5028-83d5-478c-89d8-26f07f0bc9a5.png)

***Figure 1: Initial home screen for the SDK.EXE***

![image](https://user-images.githubusercontent.com/73263754/203939280-a7fc50b9-59e0-4cad-ba46-ee77dd9ee8a8.png)

***Figure 2: Initial loading of Board 1***

![image](https://user-images.githubusercontent.com/73263754/203939366-86c9dc71-05e9-4772-bef9-014deb371d82.png)

***Figure 3: Attempt to check the correctness of the current board***


## Scope of Functionality
As addressed within the Project Overview, this project is comprised of 144 Cells based on the standard rules of Sudoku.
As such, you can expect to play a standard game of 12 x 12 Sudoku, based on the 5 default boards already provided.
Once you run the .EXE file, you can exit the game by pressing (q) or check the current status of the board by pressing (p).


## Known Bugs
1) Changing the values of the yellow characters engenders an erroneous game-state.

## Prerequisities
A Working Knowledge of x8086 Assembly Language to understand the instructions presented in the .asm file.
A 32-bit x86 Emulator for running the program, I recommend DOSBox for this project.

## Installation (Relating to DOSBox)
1) Download/Install the latest version of DOSBox here: https://www.dosbox.com/download.php?main=1
2) Download the SDK.exe file to your computer to a directory. E.g. Downloads Folder per-se
3) Open the DOSBox application
4) Mount a Disk into the virtual environment from your local files to the folder containing the .EXE:
   On Windows, The command would be similar to MOUNT [desiredDiskName] [Path]
5) Change Disks by entering: '[desiredDiskName]:'
6) Run the .EXE file with the 'SDK.EXE' command.
7) Enjoy the game to its fullest. :D

## Technologies Used:
   1) Assembly (.asm) Code Editor (E.g. Notepad++)
   2) x8086 Assembly Language
   3) DOSBox application for compiling and linking the .asm and object files.
 
