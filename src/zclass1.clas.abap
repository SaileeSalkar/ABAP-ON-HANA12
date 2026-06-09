CLASS zclass1 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

  INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
  methods fill_master_data.
  methods flush.
   methods fill_transaction_data.

ENDCLASS.



CLASS zclass1 IMPLEMENTATION.
method if_oo_adt_classrun~main.
me->flush(  ).
me->fill_master_data(  ).
me->fill_transaction_data(  ).
ENDMETHOD.
method flush.
delete from : ZDBT_BP,ZDBT_PROD,ZDBT_SH,ZDBT_SI.
ENDMETHOD.
method fill_master_data.
data: lt_bp type table of ZDBT_BP,
      lt_prod type table of ZDBT_PROD.
      append value #( bp_id = cl_uuid_factory=>create_system_uuid(  )->create_uuid_c22(  )
      bp_role = '01'
      company_name = 'OASIS'
      city = 'Hyderabad'
      street = 'Ameerpet'
      country = 'IN'
      region = 'SI') to lt_bp.

  append value #( bp_id = cl_uuid_factory=>create_system_uuid(  )->create_uuid_c22(  )
      bp_role = '02'
      company_name = 'OASIS'
      city = 'Hyderabad'
      street = 'Ameerpet'
      country = 'IN'
      region = 'SI') to lt_bp.
        append value #( product_id = cl_uuid_factory=>create_system_uuid(  )->create_uuid_c32(  )
      bp_role = '01'
      name = 'HP Laptop'
     price = 125
      currency = 'INR'
      discount = 2 ) to lt_prod.
         append value #( product_id = cl_uuid_factory=>create_system_uuid(  )->create_uuid_c32(  )
      bp_role = '02'
      name = 'Dell Laptop'
     price = 125
      currency = 'INR'
      discount = 2 ) to lt_prod.

insert ZDBT_BP from table @lt_bp.
insert ZDBT_PROD from table @lt_prod.
ENDMETHOD.
method fill_transaction_data.
data :o_rand type ref to cl_abap_random_int,
      n type i,
      seed type i,
      lt_so type table of ZDBT_SH,
      lt_so_i type table of ZDBT_SI,
      lv_date type timestamp.
      seed = cl_abap_random=>seed(  ).
      cl_abap_random_int=>create( exporting
      seed = seed
      min = 1
      max = 2
      RECEIVING
      prng = o_rand ).
      select * from ZDBT_BP into table @data(lt_bp).
      select * from ZDBT_PROD into table @data(lt_prod).
      do 10 times.
      data(lv_ord_id) = cl_uuid_factory=>create_system_uuid(  )->create_uuid_c32(  ).
      n = o_rand->get_next(  ).
      read table lt_bp into data(ls_bp) index n.
      append value #( order_id = lv_ord_id
      order_no = sy-index
      buyer = ls_bp-bp_id
      gross_amount = n * 100
      currency = 'INR'
      created_by = sy-uname
      created_on = lv_date
      changed_by = sy-uname
      changed_on = lv_date ) to lt_so.
      do 2 times .
      read table lt_prod into data(ls_product) index n.
      n = o_rand->get_next(  ).
      append value #( order_id = lv_ord_id
      item_id = cl_uuid_factory=>create_system_uuid(  )->create_uuid_c32(  )
      product = ls_product-product_id
      qty = n
      uom = 'PC'
      amount = n * ls_product-price
      currency = 'INR'
      created_by = sy-uname
      created_on = lv_date
      changed_by = sy-uname
      changed_on = lv_date
       ) to lt_so_i.
      enddo.

      enddo.
      insert ZDBT_SH from table @lt_so.
      insert ZDBT_SI from table @lt_so_i.
ENDMETHOD.

ENDCLASS.
