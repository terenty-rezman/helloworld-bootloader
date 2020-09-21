bits 16 ; 16 bit mode
org 0x7c00 ; set start address

start:
  cli ; disable interrupts
  mov si, msg ; load "msg" address int SI register
  mov ah, 0x0e ; we'll be calling "teletype" bios function
print_char:
  lodsb ; load byte from where SI is pointing to AL and increment SI
  cmp al, 0 ; compare AL to zero
  je done ; check if at string's end '\0'
  int 0x10 ; print one char with bios interrrupt
  jmp print_char ; print next char
done:
  hlt ; stop execution of code

msg: db "this is art", 0 ; zero byte to terminate the string

times 510-($-$$) db 0 ; fill the rest of the otput file with zeros

dw 0xaa55; magic number to tell BIOS this is MBR
 
