@AbapCatalog.sqlViewName: 'ZSQL5_N'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Consumption View'
@Metadata.ignorePropagatedAnnotations: true
define view ZCDS5_N as select from zdbt_si association[1] to
ZCDS4_I as _saleshdr on
$projection.order_id = _saleshdr.order_id
{
 key item_id as ItemId,
    order_id,
  
    _saleshdr.order_no as OrderNo,
    
    _saleshdr._bp.company_name as CompanyName,
    
    _saleshdr._bp.country as Country,
    _saleshdr._bp.region as Region,
    
    qty as Qty,
    uom as Uom,
    amount as Amount,
    currency as Currency
  
}
