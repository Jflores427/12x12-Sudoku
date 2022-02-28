;Sudoku Assembly Code By Josue Flores
.model small
.stack 200h
.data

Board1    db '1','9',0,0,'B','8',0,0,0,'A',0,0
          db '5','2','A',0,0,'C','1',0,0,'8',0,0
          db 0,'8','3','4',0,'7',0,'9',0,'1','6','5'
          db 0,0,'9',0,'4',0,0,'5','C','6','3',0
          db 'B','C','8',0,'3','1',0,0,0,'9','7',0
          db '3','5','4',0,'9','B',0,0,0,0,'A',0
          db '9',0,'2','C',0,0,0,0,0,0,0,'7'
          db 0,'3',0,'8',0,'5',0,'7','A',0,0,'2'
          db 0,0,0,0,'1','6',0,'A','3',0,'9',0
          db 'A','1',0,'2',0,0,'B','8','9',0,0,0
          db 0,0,'B',0,0,'9','C','6',0,0,'2',0
          db 0,0,'5',0,'A',0,0,0,'4',0,0,'C'

Board2    db 0,0,0,'B',0,'2','6','4','C',0,0,0
          db 0,0,'3',0,0,'9',0,'C','B','5',0,0
          db '9','1','5',0,0,'B',0,'8','6',0,0,0
          db '7','3',0,0,0,0,0,0,0,'9','1',0
          db 0,'A',0,'5',0,0,'3','9',0,'B',0,'7'
          db 0,0,0,0,0,'8','4',0,0,'2',0,0
          db '5',0,0,0,0,'C','8','6','1','3','4',0
          db 0,'9','4','3',0,0,'A','1',0,0,'8','C'
          db 0,0,'1','6','4','7','B',0,'2',0,'9','5'
          db 0,'7','8',0,'B',0,0,0,0,0,0,'2'
          db '2',0,0,'4','1',0,0,0,0,0,0,'3'
          db 0,0,0,0,'8','3',0,0,0,'7','5','1'


Board3    db 0,0,'C',0,'7',0,'4','B','6',0,0,0
          db '3','5','4',0,'1',0,0,'C','8',0,0,0
          db 'B',0,'8',0,'5',0,0,0,0,'9',0,0
          db 0,0,0,'3',0,'2',0,0,0,'5','B','A'
          db 0,0,0,'A','4','5',0,0,0,'2','6','3'
          db '6','2',0,'C',0,0,'1',0,0,0,0,0
          db '1','4','A','B',0,0,'3','2',0,0,0,0
          db 0,'3',0,0,0,0,0,0,'7','1','9','B'
          db '8','C',0,0,0,'1','5','6',0,'4','3',0
          db 'C',0,'7',0,0,'3',0,0,'B',0,0,0
          db 'A','1','2','8',0,0,0,0,'3',0,'C',0
          db '5',0,0,0,'C','A','7',0,'4','6',0,'1'

Board4    db 0,0,0,'8','3','4',0,0,'B',0,'9',0
          db '3',0,'6','B',0,'1',0,'9','A',0,0,0
          db '4',0,'A','1',0,'8',0,0,0,0,'2',0
          db 0,'C','2','A','9',0,0,'B',0,0,0,0
          db 0,0,0,0,0,0,0,'1','6','5',0,'2'
          db 0,'8','1',0,'7',0,'5',0,0,'A','C','4'
          db 0,'A','9',0,0,0,'3','C',0,0,0,'B'
          db 0,0,'8','4','5','B','2','A',0,'C',0,'9'
          db 0,'B','C',0,0,0,0,0,'4','2',0,'5'
          db '6','5','4',0,0,0,'B',0,'C',0,0,0
          db 0,'3',0,0,0,0,'9',0,0,'7','8',0
          db '8','1',0,0,'C','3','6',0,0,0,'4',0
          
Board5    db 0,'8','3','5',0,0,0,0,0,0,'C',0
          db 0,'2',0,0,0,0,'C',0,'4','6','A','5'
          db 0,0,0,0,'4','7','5','2','3',0,'8',0
          db '7',0,'C','8',0,0,0,'A','2',0,0,'6'
          db '3',0,'2',0,0,0,0,'6','5',0,'B','C'
          db '5',0,'6','A',0,0,'4','3',0,0,0,0
          db 0,'C',0,'2',0,'B','9','4',0,0,0,0
          db 'A','7',0,0,0,0,0,0,'8','4',0,0
          db 0,'9',0,0,'3',0,0,0,'A',0,0,'2'
          db 0,0,0,'4','7','6','A',0,0,'9',0,0
          db '6',0,0,'B','2','4',0,'C','7',0,0,0
          db '2',0,0,'1','B','5',0,0,0,'8','6',0                                        
.code

start:    
    
    mov al, 03h            ;Enters Video Mode
    mov ah, 0
    int 10h

    mov al, 1              ;Prints a string with attribute
    mov bh, 0
    mov bl, 14
    mov cx, msg1end - offset msg1 ; calculate message size.
    mov dl, 0
    mov dh, 11
    push cs
    pop es
    mov bp, offset msg1
    mov ah, 13h
    int 10h    
    jmp msg1end
  msg1  DB  " Welcome to Sudoku! "
  msg1end:
    
    mov al, 1              ;Prints a string with attribute
    mov bh, 0
    mov bl, 14
    mov cx, msg16end - offset msg16 ; calculate message size.
    mov dl, 0
    mov dh, 12
    push cs
    pop es
    mov bp, offset msg16
    mov ah, 13h
    int 10h    
    jmp msg16end
  msg16  DB  " No same #'s in any row, "
  msg16end:
    
    mov al, 1              ;Prints a string with attribute
    mov bh, 0
    mov bl, 14
    mov cx, msg17end - offset msg17 ; calculate message size.
    mov dl, 0
    mov dh, 13
    push cs
    pop es
    mov bp, offset msg17
    mov ah, 13h
    int 10h    
    jmp msg17end
  msg17  DB  " column, or 4x3 box to win."
  msg17end:     
    
    mov al, 1              ;Prints a string with attribute
    mov bh, 0
    mov bl, 14
    mov cx, msg2end - offset msg2 ; calculate message size.
    mov dl, 0
    mov dh, 14
    push cs
    pop es
    mov bp, offset msg2
    mov ah, 13h
    int 10h    
    jmp msg2end
  msg2  DB  " Use arrows keys to move, " 
  msg2end:            
   
    mov al, 1              ;Prints a string with attribute
    mov bh, 0
    mov bl, 14
    mov cx, msg3end - offset msg3 ; calculate message size.
    mov dl, 0
    mov dh, 15
    push cs
    pop es
    mov bp, offset msg3
    mov ah, 13h
    int 10h    
    jmp msg3end
  msg3  DB  " (q)uit,(p) Checks Ans." 
  msg3end:  
    
    mov al, 1              ;Prints a string with attribute
    mov bh, 0
    mov bl, 14
    mov cx, msg4end - offset msg4 ; calculate message size.
    mov dl, 0
    mov dh, 16
    push cs
    pop es
    mov bp, offset msg4
    mov ah, 13h
    int 10h    
    jmp msg4end
  msg4  DB  " Express #'s in Hex,(A=10) " 
  msg4end:
    
    mov al, 1              ;Prints a string with attribute
    mov bh, 0
    mov bl, 14
    mov cx, msg5end - offset msg5 ; calculate message size.
    mov dl, 0
    mov dh, 17
    push cs
    pop es
    mov bp, offset msg5
    mov ah, 13h
    int 10h    
    jmp msg5end
  msg5  DB  " Keep it lowercase, " 
  msg5end:
  
    mov al, 1              ;Prints a string with attribute
    mov bh, 0
    mov bl, 14
    mov cx, msg6end - offset msg6 ; calculate message size.
    mov dl, 0
    mov dh, 18
    push cs
    pop es
    mov bp, offset msg6
    mov ah, 13h
    int 10h    
    jmp msg6end
  msg6  DB  " And don't edit yellow #'s." 
  msg6end:    
    
    mov dh, 0               ;Sets Cursor Position
    mov dl, 27
    call SetCursor
  
    mov al, 201             ;Sets Border char, line 1
    mov bh, 0
    mov cx, 1
    mov ah, 0Eh
    int 10h
             
    mov bh, 0
    mov cx, 23
    
  L1:                       ;Loops border character
    mov al, 205             ;Sets Border character.
    mov ah, 0Eh      
    int 10h
    dec cx
    JZ Fin
  
  Divisor0:                 ;Divides the boxes into 3x4 sectors.
    cmp cx,16
    JG L1
    JNZ D0
    dec cx
    mov al,203
    mov ah, 0Eh 
    int 10h
    JMP L1
    
  D0:
    cmp cx,8
    JNZ L1
    dec cx
    mov ah, 0Eh
    mov al, 203
    int 10h
    JMP L1  
    
  Fin:  
    mov al, 187           ;Sets Border Character
    mov bh, 0
    mov cx, 1
    mov ah, 0Eh
    int 10h
    
   
    mov dh, 1           ;Sets Cursor Position
    mov dl, 27
    call SetCursor
    
    mov al, 186         ;Sets Border char '||' 
    mov bh, 0
    mov cx, 1
    mov ah, 0Eh
    int 10h
   
    mov bh, 0
    mov cx, 22
                  
  L2:                 ; Line 2
    mov al,0
    mov ah, 0Eh
    int 10h
    mov bl, al  
    dec cx
    OR cx,0 
    JNZ Divisor
    
   
  Divisor:            ;Divides the boxes into 3x4 sectors.
    cmp cx,15 
    JG L3
    JNZ D
    dec cx
    mov ah, 0Eh
    mov al, 186
    int 10h
    JMP L2
    
  D:
    cmp cx,7
    JNZ L3
    dec cx
    mov ah, 0Eh
    mov al, 186
    int 10h
    JMP L2
    
        
  L3:
    mov ah, 0Eh
    mov al, 179
    int 10h
    mov al, bl
    dec cx
    OR cx, 0
    JNZ L2    
    
    mov bh,0
    int 10h

    mov al, 186         ;Sets Border char '||' 
    mov bh, 0
    mov cx, 1
    mov ah, 0Eh
    int 10h
    
    
    
    mov dh, 2           ;Sets Cursor Position
    mov dl, 27
    call SetCursor
    
    mov al, 199         ;Sets Border char  
    mov bh, 0
    mov ah, 0Eh
    int 10h
    
    mov cx, 23
        
  L4:
    mov al, 196         ;Sets Border char 22 times ==== with separator border
    mov ah, 0Eh
    int 10h
    dec cx
    JZ Fin1
    
  Divisor1:            ;Divides the boxes into 3x4 sectors.
    cmp cx,16
    JG L4
    JNZ D1
    dec cx
    mov al,215
    mov ah, 0Eh 
    int 10h
    JMP L4
    
  D1:
    cmp cx,8
    JNZ L4
    dec cx
    mov ah, 0Eh
    mov al, 215
    int 10h
    JMP L4
    
    
  Fin1:   
    mov al, 182             ;Sets Border char     
    mov ah, 0Eh    
    int 10h
                              
    mov cx, 10              ;Sets Counter for display of other rows.
    

  L5:                       ;The Other boxes                        
    push cx
    
    inc dh
    mov dl, 27              ;Sets Cursor Position
    mov bh, 0
    mov ah, 02h
    int 10h
    
    mov al, 186             ;Sets Border char '||' 
    mov ah, 0Eh
    int 10h
    
    mov al, 0
    mov cx, 22
    
  L6:                         ;Other Rows
    mov ah, 0Eh
    int 10h
    mov bl, al  
    dec cx
    JNZ Divisor2
    
  Divisor2:            ;Divides the boxes into 3x4 sectors.
    cmp cx,15 
    JG L7
    JNZ D2
    dec cx
    mov ah, 0Eh
    mov al, 186
    int 10h
    mov al,bl
    JMP L6
    
  D2:
    cmp cx,7
    JNZ L7
    dec cx
    mov ah, 0Eh
    mov al, 186
    int 10h
    mov al, bl
    JMP L6
   
  L7:
    mov ah, 0Eh
    mov al, 179
    int 10h
    mov al, bl
    dec cx
    JNZ L6
    
    mov al, 0
    mov bh, 0
    int 10h

    mov al, 186                 ;Sets Border char '||' 
    mov bh, 0
    mov cx, 1
    mov ah, 0Eh
    int 10h
    
    
    inc dh                          ;Sets cursor
    mov dl, 27
    call SetCursor
    
    mov al, 199                     ;Sets Border char  
    mov bh, 0
    mov ah, 0Eh
    int 10h
    
    mov cx, 23  
  
  skip: 
      jmp L8
  
  
  L5intermediate:
      cmp cx, 0
      push cx
      JE next
      JNE L5
    
  L8:
    mov al, 196         ;Sets Border char 22 times ====
    mov ah, 0Eh
    int 10h
    dec cx
    JZ Fin2
    
  Divisor3:            ;Divides the boxes into 3x4 sectors.
    cmp cx,16
    JG L8
    JNZ D3
    mov al,215
    mov ah, 0Eh 
    int 10h
    dec cx
    JMP L8
    
  D3:
    cmp cx,8
    JNZ L8
    dec cx
    mov ah, 0Eh
    mov al, 215
    int 10h
    JMP L8
    
  Fin2:   
    mov al, 182         ;Sets Border char     
    mov ah, 0Eh    
    int 10h    
    
    pop cx
    Loop L5intermediate   ;Reiterates loop for whole counter
             
 Next:   
    inc dh                ;Slight Replica for final 2 rows
    mov dl, 27            ;Sets Cursor Position
    call SetCursor
    
    mov al, 186           ;Sets Border char '||' 
    mov bh, 0
    mov cx, 1
    mov ah, 0Eh
    int 10h
    
    mov bh, 0              ;Sets up 2nd to last row
    mov cx, 22
    
  L9:                      ;Sets up number data
    mov al,0
    mov ah, 0Eh
    int 10h
    mov bl, al  
    dec cx
    JNZ Divisor4
    
  Divisor4:                 ;Divides the boxes into 3x4 sectors.
    cmp cx,15 
    JG L10
    JNZ D4
    dec cx
    mov ah, 0Eh
    mov al, 186
    int 10h
    JMP L9
    
  D4:                       ;Divides the boxes into 3x4 sectors.
    cmp cx,7
    JNZ L10
    dec cx
    mov ah, 0Eh
    mov al, 186
    int 10h
    JMP L9
                            
  L10:                      ;Sets up Separator
    mov ah, 0Eh
    mov al, 179
    int 10h
    mov al, bl
    dec cx
    JNZ L9
    
    mov al, 0                 ;last column data cell
    mov ah, 0Eh
    mov bh, 0
    int 10h

    mov al, 186                 ;Sets Border char '||' 
    mov bh, 0
    mov cx, 1
    mov ah, 0Eh
    int 10h
    
    
    inc dh                          ;Sets Cursor
    mov dl, 27
    mov bh, 0
    mov ah, 02h
    int 10h
    
    mov al, 200                     ;Sets Border char  
    mov bh, 0
    mov ah, 0Eh
    int 10h
    
    mov cx, 23
    
  L11:
    mov al, 205                 ;Sets Border char 22 times ====
    mov ah, 0Eh
    int 10h
    dec cx
    JZ Fin3
    
  Divisor5:            ;Divides the boxes into 3x4 sectors.
    cmp cx,16
    JG L11
    JNZ D5
    dec cx
    mov al,202
    mov ah, 0Eh 
    int 10h
    JMP L11
   
  D5:
    cmp cx,8
    JNZ L11
    dec cx
    mov ah, 0Eh
    mov al, 202
    int 10h
    JMP L11
    
    
  Fin3:   
    mov al, 188           ;Sets Border char     
    mov ah, 0Eh    
    int 10h    

    mov dl, 27
    mov dh, 6
    mov bh, 0
    mov ah, 2
    int 10h  
    mov cx, 3
 
  adjust:                       ;Fixes Board Lines
    push cx 
    mov ah, 0Eh
    mov al,204
    mov cx,1
    int 10h
    mov cx,23
   
   adj: 
    cmp cx,16
    je adj2
    cmp cx,8
    je adj2
    mov ah, 0Eh
    mov al,205
    int 10h
    loop adj
    jmp adj3
    
   adj2:
    mov ah, 0Eh
    mov al,206
    int 10h
    loop adj
    
   adj3: 
    mov ah, 0Eh
    mov al,185
    mov cx,1
    int 10h  
  
    add dh, 6
    mov dl, 27
    mov ah, 2
    int 10h  
    pop cx
    loop adjust     
  
  ; BOARD IS DONE.  
  
    mov al, 1              ;Prints a string with attribute
    mov bh, 0
    mov bl, 14
    mov cx, msg9end - offset msg9 ; calculate message size.
    mov dl, 0
    mov dh, 19
    push cs
    pop es
    mov bp, offset msg9
    mov ah, 13h
    int 10h    
    jmp msg9end
  msg9  DB  " Choose Board 1-5, Input #:" 
  msg9end:  
  
    mov dl,1
    mov dh,20
    call SetCursor
    
 Decision:   
    mov ah,00h
    int 16h
    cmp al, '1'
    je B1a
    cmp al, '2'
    je B2a
    cmp al, '3'
    je B3a
    cmp al, '4'
    je B4a    
    cmp al, '5'
    je B5a
    jmp Decision 
    
    B1a:
    JMP B1
    B2a:
    JMP B2
    B3a:
    JMP B3
    B4a:
    JMP B4
    B5a:
    JMP B5
    
                    ;import data from Board Arrays
 
B1:  
    mov dh, 1       ;Sets Cursor Position
    mov dl, 28
    mov bh, 0
    mov ah, 02h
    int 10h
    
    mov ax, @DATA   ;Moves Data from array to es
    mov es, ax      
     
    mov cx, 12      ; counter for rows
    push cx
    mov bl,0
    mov si, offset board1
  
  Copy1:              ;Starts process of copying
    push cx
    mov cx, 12    
   
   b1out:  
    push cx
    mov al,es:[si]
    mov ah, 09h
    mov cx, 1
    mov bl, 14
    int 10h
    add dl,2
    call setcursor
    inc si
    pop cx
    loop b1out
    
   b1out2:
    add dh, 2          ;Sets Cursor Next row
    mov dl, 28
    mov ah, 02h
    int 10h
    mov cx,1
    pop cx
    dec cx
    JNZ Copy1    
    
    mov al, 1              ;Prints a string with attribute
    mov bh, 0
    mov bl, 14
    mov cx, msg10end - offset msg10 ; calculate message size.
    mov dl, 7
    mov dh, 3
    push cs
    pop es
    mov bp, offset msg10
    mov ah, 13h
    int 10h    
    jmp msg10end
  msg10  DB  " BOARD 1 " 
  msg10end:    
    
    mov dh, 1       ;Sets Cursor Position
    mov dl, 28
    mov bh, 0
    mov ah, 02h
    int 10h
        
    mov ch, 0     ;Sets text mode Cursor shape
    mov cl, 7
    mov ah, 1
    int 10h    
    jmp main
    
B2:  
    mov dh, 1       ;Sets Cursor Position
    mov dl, 28
    mov bh, 0
    mov ah, 02h
    int 10h
    
    mov ax, @DATA   ;Moves Data from array to es
    mov es, ax      
     
    mov cx, 12      ; counter for rows
    push cx
    mov bl,0
    mov si, offset board2
  
  Copy2:              ;Starts process of copying
    push cx
    mov cx, 12    
   
   b2out:  
    push cx
    mov al,es:[si]
    mov ah, 09h
    mov cx, 1
    mov bl, 14
    int 10h
    add dl,2
    call setcursor
    inc si
    pop cx
    loop b2out
    
   b2out2:
    add dh, 2          ;Sets Cursor Next row
    mov dl, 28
    mov ah, 02h
    int 10h
    mov cx,1
    pop cx
    dec cx
    JNZ Copy2    
    
    mov al, 1              ;Prints a string with attribute
    mov bh, 0
    mov bl, 14
    mov cx, msg11end - offset msg11 ; calculate message size.
    mov dl, 7
    mov dh, 3
    push cs
    pop es
    mov bp, offset msg11
    mov ah, 13h
    int 10h    
    jmp msg11end
  msg11  DB  " BOARD 2 " 
  msg11end:    
    
    mov dh, 1       ;Sets Cursor Position
    mov dl, 28
    mov bh, 0
    mov ah, 02h
    int 10h
        
    mov ch, 0     ;Sets text mode Cursor shape
    mov cl, 7
    mov ah, 1
    int 10h    
    jmp main    
 
B3:  
    mov dh, 1       ;Sets Cursor Position
    mov dl, 28
    mov bh, 0
    mov ah, 02h
    int 10h
    
    mov ax, @DATA   ;Moves Data from array to es
    mov es, ax      
     
    mov cx, 12      ; counter for rows
    push cx
    mov bl,0
    mov si, offset board3
  
  Copy3:              ;Starts process of copying
    push cx
    mov cx, 12    
   
   b3out:  
    push cx
    mov al,es:[si]
    mov ah, 09h
    mov cx, 1
    mov bl, 14
    int 10h
    add dl,2
    call setcursor
    inc si
    pop cx
    loop b3out
    
   b3out2:
    add dh, 2          ;Sets Cursor Next row
    mov dl, 28
    mov ah, 02h
    int 10h
    mov cx,1
    pop cx
    dec cx
    JNZ Copy3    
    
    mov al, 1              ;Prints a string with attribute
    mov bh, 0
    mov bl, 14
    mov cx, msg12end - offset msg12 ; calculate message size.
    mov dl, 7
    mov dh, 3
    push cs
    pop es
    mov bp, offset msg12
    mov ah, 13h
    int 10h    
    jmp msg12end
  msg12  DB  " BOARD 3 " 
  msg12end:    
    
    mov dh, 1       ;Sets Cursor Position
    mov dl, 28
    mov bh, 0
    mov ah, 02h
    int 10h
        
    mov ch, 0     ;Sets text mode Cursor shape
    mov cl, 7
    mov ah, 1
    int 10h    
    jmp main 
 
B4:  
    mov dh, 1       ;Sets Cursor Position
    mov dl, 28
    mov bh, 0
    mov ah, 02h
    int 10h
    
    mov ax, @DATA   ;Moves Data from array to es
    mov es, ax      
     
    mov cx, 12      ; counter for rows
    push cx
    mov bl,0
    mov si, offset board4
  
  Copy4:              ;Starts process of copying
    push cx
    mov cx, 12    
   
   b4out:  
    push cx
    mov al,es:[si]
    mov ah, 09h
    mov cx, 1
    mov bl, 14
    int 10h
    add dl,2
    call setcursor
    inc si
    pop cx
    loop b4out
    
   b4out2:
    add dh, 2          ;Sets Cursor Next row
    mov dl, 28
    mov ah, 02h
    int 10h
    mov cx,1
    pop cx
    dec cx
    JNZ Copy4    
    
    mov al, 1              ;Prints a string with attribute
    mov bh, 0
    mov bl, 14
    mov cx, msg13end - offset msg13 ; calculate message size.
    mov dl, 7
    mov dh, 3
    push cs
    pop es
    mov bp, offset msg13
    mov ah, 13h
    int 10h    
    jmp msg13end
  msg13  DB  " BOARD 4 " 
  msg13end:    
    
    mov dh, 1       ;Sets Cursor Position
    mov dl, 28
    mov bh, 0
    mov ah, 02h
    int 10h
        
    mov ch, 0     ;Sets text mode Cursor shape
    mov cl, 7
    mov ah, 1
    int 10h    
    jmp main 

B5:  
    mov dh, 1       ;Sets Cursor Position
    mov dl, 28
    mov bh, 0
    mov ah, 02h
    int 10h
    
    mov ax, @DATA   ;Moves Data from array to es
    mov es, ax      
     
    mov cx, 12      ; counter for rows
    push cx
    mov bl,0
    mov si, offset board5
  
  Copy5:              ;Starts process of copying
    push cx
    mov cx, 12    
   
   b5out:  
    push cx
    mov al,es:[si]
    mov ah, 09h
    mov cx, 1
    mov bl, 14
    int 10h
    add dl,2
    call setcursor
    inc si
    pop cx
    loop b5out
    
   b5out2:
    add dh, 2          ;Sets Cursor to Next row
    mov dl, 28
    mov ah, 02h
    int 10h
    mov cx,1
    pop cx
    dec cx
    JNZ Copy5    
    
    mov al, 1              ;Prints a string with attribute
    mov bh, 0
    mov bl, 14
    mov cx, msg14end - offset msg14 ; calculate message size.
    mov dl, 7
    mov dh, 3
    push cs
    pop es
    mov bp, offset msg14
    mov ah, 13h
    int 10h    
    jmp msg14end
  msg14  DB  " BOARD 5 " 
  msg14end:    
    
    mov dh, 1       ;Sets Cursor Position
    mov dl, 28
    mov bh, 0
    mov ah, 02h
    int 10h
        
    mov ch, 0     ;Sets text mode Cursor shape
    mov cl, 7
    mov ah, 1
    int 10h    
    jmp main 
 
     
 
 Main:             ;The Game commences.
      mov ah,00h
      int 16h
    
      cmp ah, 50h    ; The down key moves the cursor down
      je Down
      cmp ah, 48h    ; The up key moves the cursor up
      je Up
      cmp ah, 4Bh    ; The left key moves the cursor left
      je Left
      cmp ah, 4Dh    ; The right key moves the cursor right
      je Right
      cmp al, '1'
      je Num1
      cmp al, '2'
      je Num2          
      jmp main2
      
  Right:
      add dl, 2
      cmp dl, 52
      je subtr
      call SetCursor
      jmp main

  Left:
      sub dl, 2
      cmp dl,26
      JE addit
      call SetCursor
      jmp main

  Up:
      sub dh, 2
      cmp dh, 1
      jl addit2
      cmp bh,0
      jne addit2
      call SetCursor
      jmp main

  Down:
      add dh, 2
      cmp dh,23
      jg subtr2
      cmp bh,0
      jne subtr2
      call SetCursor
      jmp main
 
  addit:                           ;Stops cursor from moving out of borders.
      add dl,2
      call setcursor
      jmp main
      
  subtr:
      sub dl,2
      call setcursor
      jmp main   
  
  addit2:
      add dh,2
      call setcursor
      jmp main
  
  subtr2:
      sub dh,2
      call setcursor
      jmp main  
  
 Mainint:                       
      jmp main
  
  
  Num1:                                 ;Inputs
      ;Call Read                        ;If you want the yellow numbers to be uneditable.
      ;cmp al, 0
      ;jne Color   
   ;ca:
      mov ah, 09h           
      mov bl,15
      mov cx, 1
      mov al, '1'
      int 10h
      call SetCursor
      jmp main
   
   ;Color:
      ;call Read
      ;cmp ah, 14
      ;je mainint
      ;jmp ca
  Num2:      
      mov ah, 09h           
      mov bl,15
      mov cx, 1
      mov al, '2'
      int 10h
      call SetCursor
      jmp main 
  
  Num3:     
      mov ah, 09h           
      mov bl,15
      mov cx, 1
      mov al, '3'
      int 10h
      call SetCursor
      jmp main
  
  Num4:      
      mov ah, 09h           
      mov bl,15
      mov cx, 1
      mov al, '4'
      int 10h
      call SetCursor
      jmp main
      
 Main2:
      cmp al, '3'
      je Num3
      cmp al, '4'
      je Num4
      cmp al, '5'
      je Num5
      cmp al, '6'
      je Num6
      cmp al, '7'
      je Num7
      cmp al, '8'
      je Num8                                                
      jmp main3      
  
  SetCursor:               ;Sets Cursor
      mov ah, 02h
      mov bh, 00
      int 10h
      ret
  
 Mainint2:
     jmp mainint
  
  
  Num5:      
      mov ah, 09h           
      mov bl,15
      mov cx, 1
      mov al, '5'
      int 10h
      call SetCursor
      jmp main
  
  Num6: 
      mov ah, 09h           
      mov bl,15
      mov cx, 1
      mov al, '6'
      int 10h
      call SetCursor
      jmp main
  
  Num7:     
      mov ah, 09h           
      mov bl,15
      mov cx, 1
      mov al, '7'
      int 10h
      call SetCursor
      jmp main
  
  Num8:     
      mov ah, 09h           
      mov bl,15
      mov cx, 1
      mov al, '8'
      int 10h
      call SetCursor
      jmp main
  
 Mainint3:
      jmp mainint2
  
  
  Num9:      
      mov ah, 09h           
      mov bl,15
      mov cx, 1
      mov al, '9'
      int 10h
      call SetCursor
      jmp main
  
  NumA:      
      mov ah, 09h           
      mov bl,15
      mov cx, 1
      mov al, 'A'
      int 10h
      call SetCursor
      jmp main  
  
  NumB:
      mov ah, 09h           
      mov bl,15
      mov cx, 1
      mov al, 'B'
      int 10h
      call SetCursor
      jmp main
  
  NumC:
      mov ah, 09h           
      mov bl,15
      mov cx, 1
      mov al, 'C'
      int 10h
      call SetCursor
      jmp main 
 
  
 Main3:
      cmp al, '9'
      je Num9
      cmp al, 'a'
      je NumA
      jmp Main4
      
  
 Main4:
      cmp al, 'b'
      je NumB      
      cmp al, 'c'
      je NumC      
      cmp al, 'q'
      je Stop
      cmp al, 'p'
      je Checker
      jmp Main      
      
      
  Stop:                   ;Clears screen and exits program
      mov ax,0003h
      int 10h
      mov ah,4ch
      int 21h
      ret   
  
  Read:                 ;Reads data at Cursor
      mov ah, 08h
      mov bh, 00
      int 10h
      ret
      
  Checker:
     
     mov dh, 1                      ;Setup For RowChecker
     mov dl, 28
     mov bx, 12
     mov ah, 12
     mov cx, 0
     push ax
     
   RowChecker:     
     push bx
     Call SetCursor
     Call Read
     mov bl, al
     add cx, bx
     add dl, 2
     pop bx
     dec bx
     JNZ RowChecker
     
     cmp cx, 675
     jne Errorint
     
     mov cx, 0
     mov bx, 12
     add dh, 2
     mov dl, 28
     pop ax
     dec ah
     push ax
     jnz RowChecker
     
                                     
     mov dh, 1                      ;Setup for ColumnChecker
     mov dl, 28
     mov bx, 12
     mov ah, 12
     mov cx, 0
     push ax
    
   ColumnChecker:     
     push bx
     Call SetCursor
     Call Read
     mov bl, al
     add cx, bx
     add dh, 2
     pop bx
     dec bx
     JNZ ColumnChecker
     
     cmp cx, 675
     jne Errorint
     
     mov cx, 0
     mov bx, 12
     add dl, 2
     mov dh, 1
     pop ax
     dec ah
     push ax
     jnz ColumnChecker
     
     pop ax
     mov dh, 1                      ;Setup for BoxCheck
     mov dl, 28                     ;If Doesnt work Review BoxCheck
     mov bx, 12                     
     mov ah, 4 
     mov cx, 0
     push ax
     jmp BoxCheck
     
    Errorint:
     jmp Error
     
   BoxCheck:   
                                  ;First 4 Column of boxes
    BC1: 
     push bx                      ;BoxCheck Line 1
     Call SetCursor
     Call Read                                  
     mov bl, al
     add cx, bx
     add dl, 2
     pop bx
     dec bx
     cmp bx,8
     jg BC1
     
     add dh, 2
     mov dl, 28
     
    BC2: 
     push bx                      ;BoxCheck Line 2
     Call SetCursor
     Call Read
     mov bl, al
     add cx, bx
     add dl, 2         
     pop bx
     dec bx
     cmp bx,4
     jg BC2
     
     add dh, 2
     mov dl, 28
    
    BC3:     
     push bx                      ;BoxCheck Line 3
     Call SetCursor
     Call Read
     mov bl, al
     add cx, bx
     add dl, 2
     pop bx
     dec bx
     cmp bx,0
     jnz BC3     
     
     cmp cx, 675                     ;Checks Whole Box
     jne Errorint               
     
     add dh,2
     mov dl, 28
     mov bx, 12
     mov cx, 0
     pop ax
     dec ah
     push ax
     jnz BC1

                                    ;Second 4 column of boxes
     pop ax                         ;Balances Stack
     mov dh, 1                      ;Box Check Setup
     mov dl, 36
     mov bx, 12
     mov ah, 4                      ;Number of Boxes corresponding to second column
     mov cx, 0
     push ax  
   
    BC4: 
     push bx                      ;BoxCheck Line 1
     Call SetCursor
     Call Read
     mov bl, al
     add cx, bx
     add dl, 2
     pop bx
     dec bx
     cmp bx, 8
     jne BC4
     
     add dh, 2                     ;Sets next row of box.
     mov dl, 36
    
    BC5: 
     push bx                      ;BoxCheck Line 2
     Call SetCursor
     Call Read
     mov bl, al
     add cx, bx
     add dl, 2
     pop bx
     dec bx
     cmp bx, 4
     jne BC5
     
     add dh, 2
     mov dl, 36
    
    BC6:     
     push bx                      ;BoxCheck Line 3
     Call SetCursor
     Call Read
     mov bl, al
     add cx, bx
     add dl, 2
     pop bx
     dec bx
     jnz BC6     
     
     cmp cx, 675                  ;Checks Whole Box
     jne Errorint2
     
     add dh, 2
     mov dl, 36
     mov bx, 12
     mov cx, 0
     pop ax
     dec ah
     push ax
     jnz BC4
                                    
                                    ;Final 4 Column of boxes
     pop ax                         ;Balances Stack
     mov dh, 1                      ;Box Check Setup
     mov dl, 44
     mov bx, 12
     mov ah, 4                      ;Number of Boxes corresponding to second column
     mov cx, 0
     push ax  
   
    BC7: 
     push bx                      ;BoxCheck Line 1
     Call SetCursor
     Call Read
     mov bl, al
     add cx, bx
     add dl, 2
     pop bx
     dec bx
     cmp bx,8
     jne BC7
     
     add dh, 2
     mov dl, 44
     
    BC8: 
     push bx                      ;BoxCheck Line 2
     Call SetCursor
     Call Read
     mov bl, al
     add cx, bx
     add dl, 2
     pop bx
     dec bx
     cmp bx,4
     jne BC8
     
     add dh, 2
     mov dl, 44
    BC9:     
     push bx                      ;BoxCheck Line 3
     Call SetCursor
     Call Read
     mov bl, al
     add cx, bx
     add dl, 2
     pop bx
     dec bx
     jnz BC9     
     
     cmp cx, 675                  ;Checks Whole Box
     jne Errorint2     
     
     add dh, 2
     mov dl, 44
     mov bx, 12
     mov cx, 0
     pop ax
     dec ah
     push ax
     jnz BC7
     
     jmp Victory 
     
    Errorint2:
     jmp Error 
      
         
  Victory:
     mov al, 1              ;Prints a string with attribute
     mov bh, 0
     mov bl, 14
     mov cx, msg8end - offset msg8 ; calculate message size.
     mov dl, 53
     mov dh, 1
     push cs
     pop es
     mov bp, offset msg8
     mov ah, 13h
     int 10h    
     jmp msg8end
   msg8  DB  "You won! Press q to exit, "
   msg8end:
      
     mov al, 1              ;Prints a string with attribute
     mov bh, 0
     mov bl, 14
     mov cx, msg15end - offset msg15 ; calculate message size.
     mov dl, 53
     mov dh, 2
     push cs
     pop es
     mov bp, offset msg15
     mov ah, 13h
     int 10h    
     jmp msg15end
   msg15  DB  "or select a Board 1-5. "
   msg15end:      
 
    Main5:   
     mov ah,00h
     int 16h
     cmp al, 'q'
     je stopint
     cmp al, '1'
     je B1b
     cmp al, '2'
     je B2b
     cmp al, '3'
     je B3b
     cmp al, '4'
     je B4b
     cmp al, '5'
     je B5b
     jmp Main5
      
    B1b:
     jmp B1
    B2b:
     jmp B2
    B3b:
     jmp B3
    B4b:
     jmp B4
    B5b:
     jmp B5     
           
   Stopint:
     jmp stop
      
  Error:
     mov al, 1                     ;Prints a string with attribute
     mov bh, 0
     mov bl, 14
     mov cx, msg7end - offset msg7 ; calculate message size.
     mov dl, 55
     mov dh, 1
     push cs
     pop es
     mov bp, offset msg7
     mov ah, 13h
     int 10h    
     jmp msg7end
   msg7  DB  "Wrong ans, try again!"
   msg7end:
     mov dh, 1
     mov dl, 28
     Call SetCursor
     jmp Main
    
End start 