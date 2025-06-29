BEGIN
   FOR rec IN (
      SELECT l.LoanID, l.EndDate, c.Name
      FROM Loans l
      JOIN Customers c ON l.CustomerID = c.CustomerID
      WHERE l.EndDate <= SYSDATE + 30
   ) LOOP
      DBMS_OUTPUT.PUT_LINE('Reminder: Loan ' || rec.LoanID || ' for ' || rec.Name ||
                           ' is due on ' || TO_CHAR(rec.EndDate, 'DD-MON-YYYY'));
   END LOOP;
END;
/
