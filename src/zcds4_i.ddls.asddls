@AbapCatalog.sqlViewName: 'ZSQL4_I'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'BASIC VIEW ON SALES HEADER'
@Metadata.ignorePropagatedAnnotations: true
define view ZCDS4_I as select from zdbt_sh association[1] to
zdbt_bp as _bp on $projection.buyer = _bp.bp_id
{
   key order_id,
   order_no,
   buyer,
   gross_amount,
   currency,
   _bp
}
