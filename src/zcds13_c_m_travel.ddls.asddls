@AbapCatalog.sqlViewName: 'ZSQL13_C_M'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CORE CDS VIEWTRAVEL MANAGED SCENARIO'
@Metadata.ignorePropagatedAnnotations: true
define root view ZCDS13_C_M_TRAVEL
  as select from /dmo/travel as Travel composition[0..*] of ZCDS14_C_M_BOOKING as _Booking
  association [1] to ZCDS11_I_U_agency   as _Agency   on $projection.agency_id = _Agency.AgencyId
  association [1] to ZCDS10_I_U_CUSTOMER as _Customer on $projection.customer_id = _Customer.CustomerId
  
  association [1] to I_Currency as _Currency 
    on $projection.currency_code = _Currency.Currency

{
 
 key travel_id,
      agency_id,
      customer_id,
      begin_date,
      end_date,
@Semantics.amount.currencyCode: 'currency_code'
      booking_fee,
@Semantics.amount.currencyCode: 'currency_code'
      total_price,
      currency_code,
      description,
      status,
@Semantics.user.createdBy: true
      createdby,
@Semantics.systemDateTime.createdAt: true
      createdat,
@Semantics.user.lastChangedBy: true
      lastchangedby,
@Semantics.systemDateTime.lastChangedAt: true
      lastchangedat,-- used for etag
      _Agency,
      _Customer,
      _Booking,
      _Currency

 
}
