@AbapCatalog.sqlViewName: 'ZSQL1_I'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'BASIC VIEW ON MASTER BP TABLE'
@Metadata.ignorePropagatedAnnotations: true
define view ZCDS1_I as select from zdbt_bp
{
    key bp_id, 
    bp_role,
    company_name ,
    street ,
    city ,
    country ,
    region 
}
