CLASS zemlclass DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
   DATA LV_TYPE TYPE C VALUE 'R'.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZEMLCLASS IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
  IF LV_TYPE = 'C'.
    DATA :it_data_create TYPE TABLE FOR CREATE ZCDS13_C_M_TRAVEL.
    it_data_create = VALUE #( (
    travel_id = '00009999'
    agency_id = 70003
    customer_id = 3
    begin_date = cl_abap_context_info=>get_system_date(  )
    end_date = cl_abap_context_info=>get_system_date(  ) + 30
    booking_fee = 50
    total_price = 5000
    currency_code = 'USD'
    description = 'WW'

    %control = VALUE #( agency_id = if_abap_behv=>mk-on
    travel_id = if_abap_behv=>mk-on
     customer_id   = if_abap_behv=>mk-on
     begin_date  = if_abap_behv=>mk-on
     end_date = if_abap_behv=>mk-on
     booking_fee  = if_abap_behv=>mk-on
     total_price  = if_abap_behv=>mk-on
     currency_code  = if_abap_behv=>mk-on
           description  = if_abap_behv=>mk-on
    ) ) ).

MODIFY entities of ZCDS13_C_M_TRAVEL
entity Travel
create from it_data_create
Failed data(lt_data_failed)
reported data(lt_reported).
if lt_data_failed is not initial.
out->write(
exporting data = lt_data_failed ).
endif.
COMMIT ENTITIES.

ELSEIF LV_TYPE = 'U'.
 DATA :it_data_UPDATE TYPE TABLE FOR UPDATE ZCDS13_C_M_TRAVEL.
    it_data_UPDATE = VALUE #( (
    travel_id = '00009999'

    description = 'SAILEE'

    %control = VALUE #(

           description  = if_abap_behv=>mk-on
    ) ) ).

MODIFY entities of ZCDS13_C_M_TRAVEL
entity Travel
UPDATE from it_data_UPDATE
Failed lt_data_failed
reported lt_reported.
if lt_data_failed is not initial.
out->write(
exporting data = lt_data_failed ).
endif.
COMMIT ENTITIES.
ELSEIF LV_TYPE = 'D'.

DATA :it_data_DELETE TYPE TABLE FOR DELETE ZCDS13_C_M_TRAVEL.
    it_data_DELETE = VALUE #( (
    travel_id = '00009999'
 ) ).

MODIFY entities of ZCDS13_C_M_TRAVEL
entity Travel
DELETE from it_data_DELETE
Failed lt_data_failed
reported lt_reported.
if lt_data_failed is not initial.
out->write( lt_data_failed ).
endif.
COMMIT ENTITIES.
ELSEIF LV_TYPE = 'R'.

READ ENTITIES of ZCDS13_C_M_TRAVEL
ENTITY Travel
from value #( ( travel_id = '00009999'

  %control = VALUE #(

           description  = if_abap_behv=>mk-on
 booking_fee = if_abap_behv=>mk-on )
) ) result data(it_found_records).

if it_found_records is not iniTIAL.
out->write( it_found_records ).

ENDIF.
enDIF.
endmETHOD.

ENDCLASS.


