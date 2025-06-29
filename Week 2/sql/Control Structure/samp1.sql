BEGIN
   FOR rec IN (
      SELECT l.LoanID, l.InterestRate, l.CustomerID, c.DOB
      FROM Loans l
      JOIN Customers c ON l.CustomerID = c.CustomerID
   ) LOOP
      IF MONTHS_BETWEEN(SYSDATE, rec.DOB) / 12 > 60 THEN
         UPDATE Loans
         SET InterestRate = InterestRate - 1
         WHERE LoanID = rec.LoanID;

         DBMS_OUTPUT.PUT_LINE('Discount applied to LoanID ' || rec.LoanID ||
                              ' for CustomerID ' || rec.CustomerID);
      END IF;
   END LOOP;
END;
/
