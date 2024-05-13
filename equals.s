// Contract for equal:
        // Subroutine length: Provided a pointer to a null terminated string, equals will 
        //      return a bool whether the value is true or not
        // X0: Must point to a null terminated string
        // LR: Must contain the return address
        // All AAPCS required registers are preserved,  r19-r29 and SP.
 .global Equals
          .equ BUFFER, 21                               // Variable that will be used to allocate space
          .equ MAX_LEN,20                               // Creates a restriction on the length of inputs

  .data
    String1:       .asciz "1" 
    String2:    .asciz "1" 

  .text
  Equals:
  
  STR X30,[SP, # -16]!  // push registrs
//  STR X0,[SP,#-16]!
//  STR X1,[SP,#-16]!
 
  loop:
  LDRB w2,[x0]  // load byte
  LDRB w3,[x1]  // load byte

  CMP W2,0x00  // comapre to null
  BEQ equal     // branch to equal if equal

  CMP W2, W3    // compare bytes
  BNE not_equal // branch to not_equal if not equal

  ADD  X0, X0,#1   // increment
  ADD  X1, X1,#1   // increment


  B loop        // loop

  equal:
  MOV X0, #1 // True
  B   done              // finish

  not_equal:
      MOV X0, #0 // False
  B   done              // finish

 done:
// LDR X1,[SP], #16       // pop registers
// LDR X0,[SP], #16
 LDR X30,[SP], #16

 RET LR


.end
