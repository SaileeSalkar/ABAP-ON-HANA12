@AbapCatalog.sqlViewName: 'ZSQL12_C'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CONSUMPTION CDS FOR TRAVEL FOR FIORI'
@Metadata.ignorePropagatedAnnotations: true
@UI.headerInfo.typeName: 'travel'
@UI.headerInfo.typeNamePlural: 'TRAVELS'
@Search.searchable: true //Annotation to add search filter tab

define root view ZCDS12_C_U_TRAVEL as select from /dmo/travel as Travel association[1] to ZCDS11_I_U_agency as _Agency
on $projection.AgencyId = _Agency.AgencyId
association[1] to ZCDS10_I_U_CUSTOMER as _Customer on $projection.CustomerId = _Customer.CustomerId
association[1] to I_Currency as _Currency on $projection.CurrencyCode = _Currency.Currency

{
@UI.facet: [{ position:10,label: 'Details' ,purpose: #STANDARD, type: #IDENTIFICATION_REFERENCE }]  //Annotation to create a tab inside details of the field when clicked
@UI.lineItem: [{ position: 10 }]
//@UI.identification: [{ position: 10 }]
    key Travel.travel_id as TravelId,
    @UI.selectionField: [{ position:10 }]
    @EndUserText.label: 'Agency No'
    @UI.lineItem: [{ position: 20 }]
    @UI.identification: [{ position: 20 }]
    @ObjectModel.text.association: '_Agency'
    
    @Consumption.valueHelpDefinition: [{entity :{name: 'ZCDS11_I_U_agency' , element: 'AgencyId' }}] //Annotation to add f4 help
    @Search.defaultSearchElement: true
    @Search.fuzzinessThreshold: 0.7 ///Annotation to find entries atleast 70% match results will be shown
    Travel.agency_id as AgencyId,
      @UI.selectionField: [{ position:20 }]
      @UI.lineItem: [{ position: 30 }]
      @UI.identification: [{ position: 30 }]
      @ObjectModel.text.association: '_Customer'
      
      @Consumption.valueHelpDefinition: [{entity :{name: 'ZCDS10_I_U_CUSTOMER' , element: 'CustomerId' }}]
      @Search.defaultSearchElement: true
    @Search.fuzzinessThreshold: 0.7 
    
    Travel.customer_id as CustomerId,
    Travel.begin_date as BeginDate,
    @UI.lineItem: [{ position: 40 }]
    @UI.identification: [{ position: 40 }]
    Travel.end_date as EndDate,
    @UI.lineItem: [{ position: 50 ,label: 'Booking Amount' }]
    @UI.identification: [{ position: 50 }]
    Travel.booking_fee as BookingFee,
    @UI.lineItem: [{ position: 60 }]
    @UI.identification: [{ position: 60 }]
    Travel.total_price as TotalPrice,
    @UI.lineItem: [{ position: 70 }]
    @UI.identification: [{ position: 70 }]
//    @UI.hidden: true ///Annotation to Hide Field from Filter
    Travel.currency_code as CurrencyCode,
    @UI.lineItem: [{ position: 80 }]
    @UI.identification: [{ position: 80 }]
    @Consumption.hidden: true //Annotation to HIDE the option from Adapt Filter
    Travel.description as Description,
    @UI.lineItem: [{ position: 90 }]
    @UI.identification: [{ position: 90 }]
    Travel.status as Status,
   _Agency,
   _Customer,
   _Currency
}
