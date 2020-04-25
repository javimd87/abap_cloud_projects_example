@AbapCatalog.sqlViewName: 'ZJMD_ICONSULTANT'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Consultant CDS View'
define view ZJMD_I_CONSULTANT as select from zjmd_consultant {
    
    key consultant_id,
    name
}
