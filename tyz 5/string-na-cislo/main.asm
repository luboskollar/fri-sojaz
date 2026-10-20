TITLE MASM Template						(main.asm)

INCLUDE Irvine32.inc
.data
	dlzka equ 6
	vstup DB dlzka dup(?), 0

.code
main PROC
	call ClrScr

	mov edx, offset vstup
	mov ecx, dlzka
	call ReadString
	
	mov bx, 0
	mov cx, 10
	mov edi, 0

	Cyklus:
		cmp vstup[edi], 0
		je Koniec

		mov ax, bx 
		mul cx
		mov bx, ax

		mov al, vstup[edi]
		sub al, '0'
		mov ah, 0 
		add bx, ax

		inc edi
		jmp Cyklus


	Koniec:
		mov eax, 0	; da sa aj movzx eax, bx <- toto tam movne veci z bx a zvysok doplni 0
		mov ax, bx	; davame do eax lebo odtial sa vypisuje int
		call WriteInt
		exit

main ENDP
END main