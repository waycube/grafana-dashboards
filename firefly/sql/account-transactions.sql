SELECT
  accounts.name,
  transaction_journals.date AS time,
  transaction_journals.description,
  transactions.amount AS value
FROM accounts
JOIN transactions
  ON transactions.account_id = accounts.id
JOIN transaction_journals
  ON transaction_journals.id = transactions.transaction_journal_id
WHERE accounts.account_type_id = 3
  AND accounts.deleted_at IS NULL
  AND transactions.deleted_at IS NULL
  AND transaction_journals.deleted_at IS NULL
ORDER BY
  transaction_journals.date;
-- This query retrieves all transactions for accounts of type 3 (e.g., ING, ABN Amro and Revolut).