CLASS z_jmd_project_load_data DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS z_jmd_project_load_data IMPLEMENTATION.
METHOD if_oo_adt_classrun~main.
    DATA: lt_projects TYPE TABLE OF zjmd_project,
          lt_customers TYPE TABLE OF zjmd_customer,
          lt_consultants TYPE TABLE OF zjmd_consultant,
          lt_team_members TYPE TABLE of zjmd_team_member.



** CONSULTANTS ***

    lt_consultants = VALUE #(
        ( consultant_id = '1' name = 'Juan Perez Sanchez' picture = 'https://images.pexels.com/photos/614810/pexels-photo-614810.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500' )
        ( consultant_id = '2' name = 'Ruth Cortes Perez' picture = 'https://image.shutterstock.com/image-photo/beautiful-face-young-woman-clean-260nw-149962697.jpg' )
        ( consultant_id = '3' name = 'Luis Garcia Arreguín' picture = 'https://image.shutterstock.com/image-photo/studio-shot-young-man-looking-260nw-372072697.jpg' )
        ( consultant_id = '4' name = 'Rocio Gonzalez Sanchez' picture = 'https://images.generated.photos/sRF4IkhQconjjZMAvtRzHI4XhGJjlLZnFvofl7yHBAM/rs:fit:512:512/Z3M6Ly9nZW5lcmF0/ZWQtcGhvdG9zL3Yz/XzA5OTUwNDMuanBn.jpg'  )
        ( consultant_id = '5' name = 'Jaime Perez Gonzalez' picture = 'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcRCAQbhzsnyCIbnv_yUxE1b22eY9MlDaaQi7QGZJCLlmpA5ZZro&usqp=CAU' )
        ( consultant_id = '6' name = 'Sandra Garcia Perez' picture = 'https://fashion.susoba.com/wp-content/uploads/2019/07/2019072517081544-1.jpg' )
        ( consultant_id = '7' name = 'Pablo Martin Lopez' picture = 'https://static.artfido.com/2018/07/two-celebs-one-face-001.jpg' )
        ( consultant_id = '8' name = 'Lisset Rodriguez Lopez' picture = 'https://www.uni-regensburg.de/Fakultaeten/phil_Fak_II/Psychologie/Psy_II/beautycheck/english/prototypen/w_sexy_gr.jpg' )

     ).

    DELETE FROM zjmd_consultant.
    INSERT zjmd_consultant FROM TABLE @lt_consultants.

    SELECT * FROM zjmd_consultant INTO TABLE @lt_consultants.
    out->write( sy-dbcnt ).
    out->write( 'zjmd_consultant data inserted successfully!').
** CUSTOMERS**

    lt_customers = VALUE #(
        ( customer_id = '1' name = 'Repsol' )
        ( customer_id = '2' name = 'Telefonica' )
        ( customer_id = '3' name = 'SGT' )
        ( customer_id = '4' name = 'Enagas' )
        ( customer_id = '5' name = 'Naturgy' )
        ( customer_id = '6' name = 'BP' )
        ( customer_id = '7' name = 'CyT' )

     ).

    DELETE FROM zjmd_customer.
    INSERT zjmd_customer FROM TABLE @lt_customers.

    SELECT * FROM zjmd_customer INTO TABLE @lt_customers.
    out->write( sy-dbcnt ).
    out->write( 'zjmd_customer data inserted successfully!').

** PROJECTS **
    GET TIME STAMP FIELD DATA(lv_tmp).

    lt_projects = VALUE #(
        ( project_id  = '1' customer_id = '2' begin_date = '20200101' end_date = '20201231' total_cost = '245000'
          currency_code = 'EUR' description = 'Interfaces Cesta de la Compra' status = 'O' created_by = cl_abap_context_info=>get_user_technical_name( ) created_at = lv_tmp
          last_changed_by = cl_abap_context_info=>get_user_technical_name( )  last_changed_at = lv_tmp )
          ( project_id  = '2' customer_id = '5' begin_date = '20200101' end_date = '20211031' total_cost = '130200'
          currency_code = 'EUR' description = 'Swift Asset Power' status = 'O' created_by = cl_abap_context_info=>get_user_technical_name( ) created_at = lv_tmp
          last_changed_by = cl_abap_context_info=>get_user_technical_name( )  last_changed_at = lv_tmp )
          ( project_id  = '3' customer_id = '3' begin_date = '20200101' end_date = '20200330' total_cost = '355000'
          currency_code = 'EUR' description = 'S/4 conversion' status = 'D' created_by = cl_abap_context_info=>get_user_technical_name( ) created_at = lv_tmp
          last_changed_by = cl_abap_context_info=>get_user_technical_name( )  last_changed_at = lv_tmp )

     ).

    DELETE FROM ZJMD_PROJECT.
    INSERT zjmd_project FROM TABLE @lt_projects.

    SELECT * FROM zjmd_project INTO TABLE @lt_projects.
    out->write( sy-dbcnt ).
    out->write( 'zjmd_project data inserted successfully!').

** TEAM MEMBERS ***

    lt_team_members = VALUE #(
        ( project_id = '1' member_id = '1' begin_date = '20200101' end_date = '20200306' cost_rate = '250'
          currency_code = 'EUR' skill = 'ABAP Programming' )
        ( project_id = '1' member_id = '3' begin_date = '20200701' end_date = '20200407' cost_rate = '350'
          currency_code = 'EUR' skill = 'SAP SRM' )
        ( project_id = '2' member_id = '5' begin_date = '20200101' end_date = '20200306' cost_rate = '250'
          currency_code = 'EUR' skill = 'SAP PM' )
          ( project_id = '2' member_id = '6' begin_date = '20200101' end_date = '20200306' cost_rate = '400'
          currency_code = 'EUR' skill = 'eFolder' )
          ( project_id = '2' member_id = '7' begin_date = '20200101' end_date = '20200306' cost_rate = '300'
          currency_code = 'EUR' skill = 'UI5' )
          ( project_id = '3' member_id = '8' begin_date = '20200101' end_date = '20200306' cost_rate = '500'
          currency_code = 'EUR' skill = 'S/4' )


     ).

    DELETE FROM zjmd_team_member.
    INSERT zjmd_team_member FROM TABLE @lt_team_members.

    SELECT * FROM zjmd_team_member INTO TABLE @lt_team_members.
    out->write( sy-dbcnt ).
    out->write( 'zjmd_team_member data inserted successfully!').
ENDMETHOD.
ENDCLASS.
