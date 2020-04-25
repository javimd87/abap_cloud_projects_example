@AbapCatalog.sqlViewName: 'ZJMD_ICUSTOMER'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Customer CDS View'
define view ZJMD_I_CUSTOMER as select from zjmd_customer {//zjmd_customer
                                                          
   key customer_id,
   @Semantics.text: true
   name 
}
