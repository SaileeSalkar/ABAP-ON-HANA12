@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'PROJECTION VIEW'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}


@UI:{

headerInfo:{

typeName :'Booking',
typeNamePlural: 'Booking',
title:{type:#STANDARD,value:''}
}

}
@Search.searchable: true

define view entity ZCDS17_C_M_PR_BOOKING as projection on ZCDS14_C_M_BOOKING
{
@UI.facet: [{ id:'Booking',
 purpose:#STANDARD,
 type:#IDENTIFICATION_REFERENCE,
 label:'Booking',
 position:10},
  {
 id:'BookingS',
 purpose:#STANDARD,
 type:#LINEITEM_REFERENCE,
 label:'Booking Supp',
 position:20,
 targetElement:'_BookSupplemnt'
 }]

 @UI:{lineItem: [{position:10,importance:#HIGH }],
 identification:[{position:10,label:'Travel ID'}]}
@Search.defaultSearchElement: true

    key travel_id,
        @UI:{lineItem: [{position:20,importance:#HIGH }],
 identification:[{position:20,label:'Booking ID'}]}
@Search.defaultSearchElement: true
    
    key booking_id,
    @UI:{lineItem: [{position:30,importance:#HIGH }],
 identification:[{position:30}]}
    
    booking_date,
    @UI:{lineItem: [{position:40,importance:#HIGH }],
 identification:[{position:40}]}
 @Consumption.valueHelpDefinition: [{ entity:{name:'/DMO/I_Customer',element:'CustomerID'} }]
 @ObjectModel.text.element:['CustomerName']
    customer_id as CustomerID,
    _Customer.LastName as CustomerName,
 
    @UI:{lineItem: [{position:50,importance:#HIGH }],
 identification:[{position:50}]}
    
 @Consumption.valueHelpDefinition: [{ entity:{name:'/DMO/I_Carrier',element:'AirlineID'} }]
 @ObjectModel.text.element:['CarrierName']
    carrier_id as CarrierID,
    _Carrier.Name as CarrierName,

    @UI:{lineItem: [{position:60,importance:#HIGH }],
 identification:[{position:60}]}
    
    connection_id,
    @UI:{lineItem: [{position:70,importance:#HIGH }],
 identification:[{position:60}]}
    
    flight_date,
     @Semantics.amount.currencyCode: 'currency_code'
      @UI:{lineItem: [{position:80,importance:#HIGH }],
      identification:[{position:80}]}
    
    flight_price,
     @UI:{lineItem: [{position:90,importance:#HIGH }],
     identification:[{position:90}]}
    
    currency_code,
    lastchangedat,
    /* Associations */
    _BookSupplemnt: redirected to composition child ZCDS18_C_M_PR_BOSUP,
    _Carrier,
    _Connection,
    _Customer,
    _Travel:redirected to parent ZCDS16_C_M_PR_TRAVEL
}
