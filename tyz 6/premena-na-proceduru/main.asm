TITLE MASM Template						(main.asm)

INCLUDE Irvine32.inc
.data
	dlzka equ 7
	vystup DB dlzka dup(?), 0

.code
main PROC
	call ClrScr
	call ReadInt
	call IntNaString

	exit
main ENDP

IntNaString PROC USES eax ebx ecx edx esi
	mov ecx, dlzka
	mov cx, 10
	mov ebx, 0
	mov esi, 0
	mov edx, 0
		
	Cyklus:
	
	cmp eax, 0
	jz Nacitaj
	
	div cx
	add dx, '0'
	push dx
	mov dx, 0
	inc esi
	
	jmp Cyklus

	Nacitaj:
		pop dx
		mov vystup[ebx], dl
		dec esi
		inc ebx
		cmp esi, 0
		jne Nacitaj
	

	Koniec:
		mov vystup[ebx], 0
		mov edx, offset vystup
		call WriteString

		ret
		IntNaString ENDP

END main