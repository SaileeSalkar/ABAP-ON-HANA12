CLASS zamdp5 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
  INTERFACES if_oo_adt_classrun.
  INTERFACES if_amdp_marker_hdb.

  TYPES: BEGIN OF T_PROD,
         PRODUCT_ID TYPE zdataele1,
         BP_ROLE TYPE zdataele2,
         END OF T_PROD.
     TYPES: TT_PROD TYPE TABLE OF T_PROD.

     METHODS GET_DATA AMDP OPTIONS CDS SESSION CLIENT DEPENDENT

    EXPORTING VALUE(et_data) type tt_prod.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zamdp5 IMPLEMENTATION.

method get_data by DATABASE PROCEDURE FOR HDB LANGUAGE SQLSCRIPT OPTIONS READ-ONLY USING zdbt_prod.
et_data = SELECT PRODUCT_ID,BP_ROLE FROM zdbt_prod;
ENDMETHOD.
METHOD if_oo_adt_classrun~main.
TYPES: BEGIN OF T_PROD,
         PRODUCT_ID TYPE zdataele1,
         BP_ROLE TYPE zdataele2,

         END OF T_PROD.
  DATA: TT_PROD TYPE TABLE OF T_PROD.

     ME->get_data(
       IMPORTING
        et_data = tt_prod
     ).

     OUT->write(
       EXPORTING
         data   = TT_PROD
*         name   =
*       RECEIVING
*         output =
     ).

ENDMETHOD.
ENDCLASS.
