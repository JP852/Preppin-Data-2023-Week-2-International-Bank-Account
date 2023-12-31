SELECT TRANSACTION_ID
,CASE WHEN (LENGTH(transaction_id)>1) THEN 'GB' ELSE 'ERROR' END
||
CHECK_DIGITS
||
SWIFT_CODE
||
REPLACE(sort_code,'-','')
||
ACCOUNT_NUMBER AS IBAN
FROM PD2023_WK02_TRANSACTIONS AS T
INNER JOIN PD2023_WK02_SWIFT_CODES AS SC
ON T.BANK = SC.BANK
