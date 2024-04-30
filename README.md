# Preppin-Data-2023-Week-2-International-Bank-Account

#### Link to Challenge

https://preppindata.blogspot.com/2023/01/2023-week-2-international-bank-account.html

#### SQL Techniques Used

- Table Joins
- Case Statement
- Length Function
- Replace Function

## Questions

### Output to Product

In the Transactions table, there is a Sort Code field which contains dashes. We need to remove these so just have a 6 digit string
Use the SWIFT Bank Code lookup table to bring in additional information about the SWIFT code and Check Digits of the receiving bank account
Add a field for the Country Code
      Hint: all these transactions take place in the UK so the Country Code should be GB
Create the IBAN as above
      Hint: watch out for trying to combine string fields with numeric fields - check data types
Remove unnecessary fields

```
SELECT 
      TRANSACTION_ID
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

```
