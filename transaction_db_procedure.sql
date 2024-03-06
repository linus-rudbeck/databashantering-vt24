DELIMITER $$

CREATE PROCEDURE TransferMoney(IN fromAccountId INT, IN toAccountId INT, IN balanceToTransfer INT)
BEGIN
    DECLARE exit handler for sqlexception
    BEGIN
        ROLLBACK;
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'An error occurred during the transaction.';
    END;

    START TRANSACTION;
        UPDATE accounts SET balance = balance-balanceToTransfer WHERE account_id = accountId1;
        UPDATE accounts SET balance = balance+balanceToTransfer WHERE account_id = accountId2;
    COMMIT;
END$$

DELIMITER ;