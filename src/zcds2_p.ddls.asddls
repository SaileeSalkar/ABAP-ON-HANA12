@AbapCatalog.sqlViewName: 'ZSQL2_P'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'PRIVATE VIEW ON PROD'
@Metadata.ignorePropagatedAnnotations: true
define view ZCDS2_P as select from zdbt_prod
{
    key product_id ,
    bp_role ,
    name ,
    category ,
    price ,
    currency ,
    discount 
}
