# ASM_Projects
Fun and educational programs writen in assembly language on Linux OS

  The .asm files are compiled and linked with nasm and ld, so make sure to install first:                                         
    - sudo apt-get install nasm                                                         
  
  To automaticaly compile and link with nasm and ld all the files in the project or any other assembly project, download the following script that I have writen in bash: curl -o HexEmbedd_ASM https://raw.githubusercontent.com/kapucin28/HexEmbedd_ASM/master/HexEmbedd_ASM.sh. Download from the terminal right in project main directory, NOT somewhere else!
  
  The script will do the following:                                                        
    - compile asm files,                                            
    - create the .lst file,                                                    
    - create the .o files,                                      
    - create the executable file.
