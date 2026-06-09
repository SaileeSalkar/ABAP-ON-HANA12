@AbapCatalog.sqlViewName: 'ZSQL3_I'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'COMPOSITE VIEW ON SALES ITEM'
@Metadata.ignorePropagatedAnnotations: true
define view ZCDS3_I as select from zdbt_si association[1] to
zdbt_sh as _SALESHDR on
$projection.order_id = _SALESHDR.order_id
{
    key item_id,
   order_id ,
  product ,
 qty ,
    uom ,
    amount ,
    currency,
    _SALESHDR
}
