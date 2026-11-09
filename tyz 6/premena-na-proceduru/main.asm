TITLE MASM Template						(main.asm)

INCLUDE Irvine32.inc
.data
	
	cisla DW 01h, 02h, 0Ah, 05h, 0

.code
main PROC
	call ClrScr

	mov ax, [cisla] 
	mov edi, 0
	jmp Cyklus
	
	ZmenCislo:
		mov ax, bx
		jmp Cyklus

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
		call WriteString
		exit

main ENDP

END main