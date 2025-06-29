CREATE OR REPLACE PROCEDURE UpdateEmployeeBonus(
   dept IN VARCHAR2,
   bonus_percent IN NUMBER
) IS
BEGIN
   FOR rec IN (
      SELECT EmployeeID, Salary FROM Employees WHERE Department = dept
   ) LOOP
      UPDATE Employees
      SET Salary = Salary + (rec.Salary * bonus_percent / 100)
      WHERE EmployeeID = rec.EmployeeID;

      DBMS_OUTPUT.PUT_LINE('Bonus applied to EmployeeID ' || rec.EmployeeID ||
                           '. New Salary: ' || (rec.Salary + rec.Salary * bonus_percent / 100));
   END LOOP;
END;
/
