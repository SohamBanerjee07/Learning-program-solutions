CREATE OR REPLACE PROCEDURE ProcessMonthlyInterest IS
BEGIN
   FOR rec IN (
      SELECT AccountID, Balance
      FROM Accounts
      WHERE AccountType = 'Savings'
   ) LOOP
      UPDATE Accounts
      SET Balance = Balance + (rec.Balance * 0.01),
          LastModified = SYSDATE
      WHERE AccountID = rec.AccountID;

      DBMS_OUTPUT.PUT_LINE('Interest applied to AccountID ' || rec.AccountID ||
                           '. New balance: ' || (rec.Balance + rec.Balance * 0.01));
   END LOOP;
END;
/
