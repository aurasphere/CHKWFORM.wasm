       IDENTIFICATION DIVISION.
        PROGRAM-ID. worker.
        DATA DIVISION.
        WORKING-STORAGE SECTION.
       01 VALIDATION-OK     PIC X(6)  VALUE "CC0000".
       01 VALIDATION-ERROR  PIC X(6)  VALUE "CC0008".
       01 FORM-FIELD        PIC S9(9) BINARY.
       01 HIGHER-BOUND      PIC S9(9) BINARY.
       01 LOWER-BOUND       PIC S9(9) BINARY.
       01 ARG-NAME          PIC A(5)  VALUE 'input'.
       01 HIGH-ARG-NAME     PIC A(11) VALUE 'higherBound'.
       01 LOW-ARG-NAME      PIC A(10) VALUE 'lowerBound'.
        PROCEDURE DIVISION.
           CALL "get_http_form" USING ARG-NAME RETURNING FORM-FIELD.
           CALL "get_http_form" USING HIGH-ARG-NAME RETURNING
              HIGHER-BOUND.
           CALL "get_http_form" USING LOW-ARG-NAME RETURNING LOWER-BOUND.
           IF FORM-FIELD > HIGHER-BOUND
              CALL "set_http_body" USING VALIDATION-ERROR
           ELSE
              IF FORM-FIELD < LOWER-BOUND 
                 CALL "set_http_body" USING VALIDATION-ERROR
              ELSE
                 CALL "set_http_body" USING VALIDATION-OK 
              END-IF.