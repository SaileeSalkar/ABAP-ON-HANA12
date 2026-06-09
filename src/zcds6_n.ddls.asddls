@AbapCatalog.sqlViewName: 'ZSQL6_N'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'FINAL CONSUMPTION'
@Metadata.ignorePropagatedAnnotations: true
define view ZCDS6_N as select from zdbt_si association[1] to
zdbt_prod as _PRODUCTS on
$projection.product = _PRODUCTS.product_id
association[1]
to ZCDS4_I as _saleshdr on $projection.order_id = _saleshdr.order_id
{
    key item_id as ItemId,
    order_id,
  product,
    _saleshdr.order_no as OrderNo,
    
    _saleshdr._bp.company_name as CompanyName,
    
    _saleshdr._bp.country as Country,
    _saleshdr._bp.region as Region,
    _PRODUCTS.name as ProductName,
    _PRODUCTS.category as Category,
    
    qty as Qty,
    uom as Uom,
    amount as Amount,
    currency as Currency
    
}
