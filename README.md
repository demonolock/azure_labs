# Azure labs

## 1. Distributions

What is distribution?

![Alt text](/screens/dist_scheme.jpg/?raw=true "Distribution scheme")

Сomparison scheme

![Alt text](/screens/comparison_dist_scheme.jpg/?raw=true "Comparison scheme")


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

Got distribution by 60 parts

![Alt text](/screens/distributions_round_robin.jpg/?raw=true "Distribution Round robin")

### b) Hash distribution
### c) Replicated