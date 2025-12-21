SELECT
  accounts.name,
  transaction_journals.date AS time,
  transaction_journals.description,
  SUM(transactions.amount)
    OVER (
      ORDER BY transaction_journals.date
      ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) AS value
FROM accounts
JOIN transactions
  ON transactions.account_id = accounts.id
JOIN transaction_journals
  ON transaction_journals.id = transactions.transaction_journal_id
WHERE accounts.id = 1
  AND accounts.deleted_at IS NULL
  AND transactions.deleted_at IS NULL
  AND transaction_journals.deleted_at IS NULL
ORDER BY
  transaction_journals.date;
