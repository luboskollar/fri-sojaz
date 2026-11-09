TITLE MASM Template						(main.asm)

INCLUDE Irvine32.inc
.data
	
	cisla DW 0Ah, 0Bh, 0Ah, 01h, 0

.code
main PROC
	call ClrScr

	mov ax, [cisla] 
	mov edi, 1
	mov esi, 1
	jmp Cyklus
	
	ZmenCislo:
		mov ax, bx
		jmp Cyklus
		mov edi, esi

	Cyklus:


		mov bx, [cisla + 2*edi]
		inc edi
		cmp bx, 0
		je Koniec
		cmp bx, ax
		jb ZmenCislo
		jmp Cyklus

	Koniec:
		movzx eax, ax
		call WriteDec
		exit

main ENDP

END main