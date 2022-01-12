;    abcdefghijklmnopqrstuvwx
; 0   ******   *****  *    *
; 1      *    *       *  *
; 2      *    *       **
; 3      *    *       **
; 4      *    *       * *
; 5   *  *    *       *  *
; 6   ****     *****  *   * 
loop0_adj:
    nop

loop0:
    blank           ; a
    point           ; b
    point           ; c
    point           ; d
    point           ; e
    point           ; f
    point           ; g
    blank           ; h
    blank           ; i
    blank           ; j
    point           ; k
    point           ; l
    point           ; m
    point           ; n
    point           ; o
    blank           ; p
    blank           ; q
    point           ; r
    blank           ; s
    blank           ; t
    blank           ; u
    blank           ; v
    point           ; w
    blank           ; x - 24
    
    h_sync          ; 26-30
    
    decfsz      text_row_count0     ; 25 | 31-32
    goto        loop0               ; 31-32
    
loop1_adj:
    nop
    
loop1:
    blank           ; a
    blank           ; b
    blank           ; c
    blank           ; d
    point           ; e
    blank           ; f
    blank           ; g
    blank           ; h
    blank           ; i
    point           ; j
    blank           ; k
    blank           ; l
    blank           ; m
    blank           ; n
    blank           ; o
    blank           ; p
    blank           ; q
    point           ; r
    blank           ; s
    blank           ; t
    point           ; u
    blank           ; v
    blank           ; w
    blank           ; x - 24
    
    h_sync          ; 26-30
    
    decfsz      text_row_count1     ; 25 | 31-32
    goto        loop1               ; 31-32
    
loop2_adj:
    nop
    
loop2:
    blank           ; a
    blank           ; b
    blank           ; c
    blank           ; d
    point           ; e
    blank           ; f
    blank           ; g
    blank           ; h
    blank           ; i
    point           ; j
    blank           ; k
    blank           ; l
    blank           ; m
    blank           ; n
    blank           ; o
    blank           ; p
    blank           ; q
    point           ; r
    point           ; s
    blank           ; t
    blank           ; u
    blank           ; v
    blank           ; w
    blank           ; x - 24
    
    h_sync          ; 26-30
    
    decfsz      text_row_count2     ; 25 | 31-32
    goto        loop2               ; 31-32
    
loop3_adj:
    nop

loop3:
    blank           ; a
    blank           ; b
    blank           ; c
    blank           ; d
    point           ; e
    blank           ; f
    blank           ; g
    blank           ; h
    blank           ; i
    point           ; j
    blank           ; k
    blank           ; l
    blank           ; m
    blank           ; n
    blank           ; o
    blank           ; p
    blank           ; q
    point           ; r
    point           ; s
    blank           ; t
    blank           ; u
    blank           ; v
    blank           ; w
    blank           ; x - 24
    
    h_sync          ; 26-30
    
    decfsz      text_row_count3     ; 25 | 31-32
    goto        loop3               ; 31-32
    
loop4_adj:
    nop
    
loop4:
    blank           ; a
    blank           ; b
    blank           ; c
    blank           ; d
    point           ; e
    blank           ; f
    blank           ; g
    blank           ; h
    blank           ; i
    point           ; j
    blank           ; k
    blank           ; l
    blank           ; m
    blank           ; n
    blank           ; o
    blank           ; p
    blank           ; q
    point           ; r
    blank           ; s
    point           ; t
    blank           ; u
    blank           ; v
    blank           ; w
    blank           ; x - 24
    
    h_sync          ; 26-30
    
    decfsz      text_row_count4     ; 25 | 31-32
    goto        loop4               ; 31-32
    
loop5_adj:
    nop
    
loop5:
    blank           ; a
    point           ; b
    blank           ; c
    blank           ; d
    point           ; e
    blank           ; f
    blank           ; g
    blank           ; h
    blank           ; i
    point           ; j
    blank           ; k
    blank           ; l
    blank           ; m
    blank           ; n
    blank           ; o
    blank           ; p
    blank           ; q
    point           ; r
    blank           ; s
    blank           ; t
    point           ; u
    blank           ; v
    blank           ; w
    blank           ; x - 24
    
    h_sync          ; 26-30
    
    decfsz      text_row_count5     ; 25 | 31-32
    goto        loop5               ; 31-32
    
loop6_adj:
    nop
    
loop6:
    blank           ; a
    point           ; b
    point           ; c
    point           ; d
    point           ; e
    blank           ; f
    blank           ; g
    blank           ; h
    blank           ; i
    blank           ; j
    point           ; k
    point           ; l
    point           ; m
    point           ; n
    point           ; o
    blank           ; p
    blank           ; q
    point           ; r
    blank           ; s
    blank           ; t
    blank           ; u
    point           ; v
    blank           ; w
    blank           ; x - 24
    
    h_sync          ; 26-30
    
    decfsz      text_row_count6     ; 25 | 31-32
    goto        loop6               ; 31-32
