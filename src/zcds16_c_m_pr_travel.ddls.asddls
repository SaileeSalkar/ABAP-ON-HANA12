@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'PROJECTION VIEW'
@Metadata.ignorePropagatedAnnotations: true
@UI:{

headerInfo:{

typeName :'Travel',
typeNamePlural: 'Travels',
title:{type:#STANDARD,value:''}
}

}
@Search.searchable: true


define root view entity ZCDS16_C_M_PR_TRAVEL as projection on ZCDS13_C_M_TRAVEL
{
    @UI.facet: [{ id:'Travel',
 purpose:#STANDARD,
 type:#IDENTIFICATION_REFERENCE,
 label:'Travel',
 position:10},
 {
 id:'Booking',
 purpose:#STANDARD,
 type:#LINEITEM_REFERENCE,
 label:'Booking',
 position:60,
 targetElement:'_Booking'
 }]
 @UI:{lineItem: [{position:10,importance:#HIGH}],
 identification:[{position:10,label:'Travel ID'}]}
@Search.defaultSearchElement: true


    key travel_id,
   @UI:{lineItem: [{position:20,importance:#HIGH }],
 identification:[{position:10,label:'Agency ID'}],
 selectionField:[{position:10}]}

   @ObjectModel.text.element:['_Agency.Name']  
   agency_id as AgencyID,
    _Agency.Name as AgencyName,

                  @UI:{lineItem: [{position:30,importance:#HIGH }],
 identification:[{position:10,label:'Customer ID'}],
 selectionField:[{position:20}]}
 @Consumption.valueHelpDefinition: [{ entity:{name:'/DMO/I_Agency',element:'AgencyID'} }]
 @ObjectModel.text.element:['CustomerName']
       customer_id as CustomerID,
    _Customer.LastName as CustomerName,

         @UI:{lineItem: [{position:40,importance:#HIGH }],
 identification:[{position:20}]
 }
   @Consumption.valueHelpDefinition: [{ entity:{name:'/DMO/I_Customer',element:'CustomerID'} }]
 

    begin_date,
               @UI:{lineItem: [{position:50,importance:#HIGH }],
 identification:[{position:30}]
 }
    end_date,
    @Semantics.amount.currencyCode: 'currency_code'
    booking_fee,
        @UI:{lineItem: [{position:70,importance:#HIGH }],
 identification:[{position:50}]}

 @Semantics.amount.currencyCode: 'currency_code'
    total_price,
                  @UI:{lineItem: [{position:80,importance:#HIGH }],
 identification:[{position:60}]}

    
    currency_code,
    
    description,
  @UI:{lineItem: [{position:90,importance:#HIGH }],
 identification:[{position:70}]}
 

    
    status,
    createdby,
    createdat,
    lastchangedby,
    lastchangedat,
    /* Associations */
    _Agency,
    _Booking :redirected to composition child ZCDS17_C_M_PR_BOOKING,
    _Currency,
    _Customer
}
