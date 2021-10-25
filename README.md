# Azure labs

## 1. Distributions

### a) Round robin

```sql
CREATE TABLE dbo.Orders
(
OrderID int IDENTITY(1,1) NOT NULL
,OrderDate datetime NOT NULL
,OrderDescription char(15) DEFAULT 'NewOrder' )
WITH
( CLUSTERED INDEX (OrderID)
, DISTRIBUTION = ROUND_ROBIN
);
```

![Alt text](/screens/distributions_round_robin.jpg/?raw=true "Distribution Round robin")

### b) 