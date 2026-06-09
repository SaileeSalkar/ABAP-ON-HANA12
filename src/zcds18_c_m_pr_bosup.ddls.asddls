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

typeName :'Booking Supplementi',
typeNamePlural: 'Booking Supplementi',
title:{type:#STANDARD,value:''}
}

}
@Search.searchable: true


define view entity ZCDS18_C_M_PR_BOSUP as projection on ZCDS15_C_M_BOOKSUPP
{
@UI.facet: [{ id:'Bookings',
 purpose:#STANDARD,
 type:#IDENTIFICATION_REFERENCE,
 label:'BookingS',
 position:10}]
 @UI:{lineItem: [{position:10,importance:#HIGH }],
 identification:[{position:10,label:'Travel ID'}]}
@Search.defaultSearchElement: true

    key travel_id,
    @UI:{lineItem: [{position:20,importance:#HIGH }],
 identification:[{position:20,label:'Booking ID'}]}
@Search.defaultSearchElement: true
    
    key booking_id,
           @UI:{lineItem: [{position:30,importance:#HIGH }],
 identification:[{position:20,label:'Booking SID'}]}
@Search.defaultSearchElement: true
    
    key booking_supplement_id,
    @UI:{lineItem: [{position:40,importance:#HIGH }],
 identification:[{position:20,label:'SID'}]}
@Search.defaultSearchElement: true
    
    supplement_id,
    @Semantics.amount.currencyCode: 'currency_code'
    price,
    last_changed_at,
       
    currency_code,
    lastchangedat,
    /* Associations */
    _Booking: redirected to parent ZCDS17_C_M_PR_BOOKING,
    _Product,
    _SupplementText,
    _Travel
}
