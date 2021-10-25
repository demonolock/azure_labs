-- Create table
CREATE TABLE dbo.Orders
(
OrderID int IDENTITY(1,1) NOT NULL
,OrderDate datetime NOT NULL
,OrderDescription char(15) DEFAULT 'NewOrder' )
WITH
( CLUSTERED INDEX (OrderID)
, DISTRIBUTION = ROUND_ROBIN
);

-- Fill data
SET NOCOUNT ON
DECLARE @i INT SET @i = 1
DECLARE @date DATETIME SET @date = dateadd(mi,@i,'2019-08-01') WHILE (@i <= 60)
BEGIN
INSERT INTO dbo.Orders (OrderDate) SELECT @date
SET @i = @i+1;
END;

-- Check distribution
SELECT
o.name AS tableName, pnp.pdw_node_id, pnp.distribution_id,
pnp.rows FROM
sys.pdw_nodes_partitions AS pnp JOIN sys.pdw_nodes_tables AS NTables ON pnp.object_id = NTables.object_id
AND pnp.pdw_node_id = NTables.pdw_node_id
JOIN sys.pdw_table_mappings AS TMap ON NTables.name = TMap.physical_name
AND substring(TMap.physical_name,40, 10) = pnp.distribution_id
JOIN sys.objects AS o
ON TMap.object_id = o.object_id
WHERE o.name in ('orders')
ORDER BY distribution_id
