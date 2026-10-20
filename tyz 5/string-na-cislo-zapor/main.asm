TITLE MASM Template						(main.asm)

INCLUDE Irvine32.inc
.data
	dlzka equ 7
	vstup DB dlzka dup(?), 0

.code
main PROC
	call ClrScr

	mov edx, offset vstup
	mov ecx, dlzka
	call ReadString
	
	mov bx, 0
	mov cx, 10

	cmp vstup[0], '-'
	je MaZnamienko
	jne NemaZnamienko
	
	MaZnamienko:
		mov edi, 1
		mov esi, 1
		jmp Cyklus

	NemaZnamienko:
		mov edi, 0
		mov esi, 0
		jmp Cyklus

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

		cmp esi, 1
		je Zneguj
		jne Zapis

		Zneguj:
			neg eax

		Zapis: 

		call WriteInt
		exit

main ENDP
END main