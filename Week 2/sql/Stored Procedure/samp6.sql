CREATE OR REPLACE PROCEDURE TransferFunds(
   from_acc IN NUMBER,
   to_acc IN NUMBER,
   amt IN NUMBER
) IS
   from_balance NUMBER;
BEGIN
   SELECT Balance INTO from_balance FROM Accounts WHERE AccountID = from_acc;

   IF from_balance < amt THEN
      DBMS_OUTPUT.PUT_LINE('Transfer failed: Insufficient funds in AccountID ' || from_acc);
   ELSE
      UPDATE Accounts
      SET Balance = Balance - amt,
          LastModified = SYSDATE
      WHERE AccountID = from_acc;

      UPDATE Accounts
      SET Balance = Balance + amt,
          LastModified = SYSDATE
      WHERE AccountID = to_acc;

      DBMS_OUTPUT.PUT_LINE('Transferred ' || amt || ' from AccountID ' || from_acc ||
                           ' to AccountID ' || to_acc);
   END IF;
END;
/
