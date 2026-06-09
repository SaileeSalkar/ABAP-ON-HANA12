@AbapCatalog.sqlViewName: 'ZSQL14_C_M'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS FOR BOOKING DETAILS MANAGED SCENARIO'
@Metadata.ignorePropagatedAnnotations: true
define view ZCDS14_C_M_BOOKING as select from /dmo/booking as Booking association to parent ZCDS13_C_M_TRAVEL as _Travel
on $projection.travel_id = _Travel.travel_id composition[0..*] of ZCDS15_C_M_BOOKSUPP as _BookSupplemnt association[1..1] to /DMO/I_Customer as _Customer
on $projection.customer_id = _Customer.CustomerID association[1..1] to /DMO/I_Carrier as _Carrier
on $projection.carrier_id = _Carrier.AirlineID association[1..1] to /DMO/I_Connection as _Connection
on $projection.carrier_id = _Connection.AirlineID and $projection.connection_id = _Connection.ConnectionID
{
    
    key travel_id ,
    key booking_id ,
    booking_date ,
    customer_id ,
    carrier_id ,
    connection_id ,
    flight_date ,
    flight_price ,
    currency_code ,
    _Travel.lastchangedat,
    _Travel,
    _Customer,
    _Carrier,
    _Connection,
    _BookSupplemnt
}
