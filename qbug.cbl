 IDENTIFICATION DIVISION.
       PROGRAM-ID.          QBUG.
       PROCEDURE DIVISION.

       Z-500-READ-Q.
            PERFORM Z-510-GET-Q.
      
       Z-510-GET-Q.
            EXEC CICS HANDLE CONDITION
                LENGERR  (Z-330-RESET-HANDLE)
                QIDERR   (Z-320-CREATE-Q)
            END-EXEC.
      
            EXEC CICS READQ
                TS QUEUE (Q-ID)
                INTO     (Q)
                LENGTH   (Q-LENGTH)
                ITEM     (Q-NUM)
            END-EXEC.
      
            GO TO Z-330-RESET-HANDLE.
      
       Z-320-CREATE-Q.
            CONTINUE.
      
       Z-330-RESET-HANDLE.
             EXEC CICS
                 HANDLE CONDITION LENGERR
                                  QIDERR
             END-EXEC.
       Z-500-Q-RETURN.
             EXIT.
